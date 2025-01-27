from django.http import JsonResponse
from datetime import datetime
from psycopg2.extras import RealDictCursor
import psycopg2
from .connections import database_connection
from datetime import datetime, timedelta
from urllib.parse import unquote
from .bgp_stats import fetch_bgp_summary_all_routers
from django.contrib.auth.decorators import login_required
from netmiko import ConnectHandler
from psycopg2.extras import RealDictCursor
import ipaddress

def get_routes(request):
    try:
        fetch_bgp_summary_all_routers()
        conn = database_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)

        query = """
        WITH latest_configured_routes AS (
            SELECT DISTINCT ON (sb.network_with_mask, sb.router_id)
                sb.router_id,
                sb.network_with_mask AS prefix,
                sb.next_hop,
                sb.path AS asn_path,
                sb.rpki_status,
                sb."timestamp",
                CASE 
                    WHEN sb.rpki_status = 'I' THEN 'hijacked'
                    WHEN sb.rpki_status = 'N' THEN 'suspect'
                    ELSE 'ok'
                END AS status
            FROM 
                bgpmonsec_project.sh_bgp_ip sb
            JOIN 
                bgpmonsec_project.rpki_router_connection_config rc
            ON 
                sb.router_id = rc.router_id
            WHERE 
                rc.config_status = 'Configured'
            ORDER BY sb.network_with_mask, sb.router_id, sb."timestamp" DESC
        ),
        latest_timestamp AS (
            SELECT MAX("timestamp") AS latest_timestamp
            FROM latest_configured_routes
        )
        SELECT 
            lcr.*, 
            COALESCE(brm.status_actions, 
                CASE 
                    WHEN lcr.rpki_status = 'V' THEN 'installed'
                    WHEN lcr.rpki_status = 'N' THEN 'no action'
                    ELSE 'no action'
                END
            ) AS status_actions
        FROM 
            latest_configured_routes lcr
        LEFT JOIN 
            bgpmonsec_project.bgp_route_monitor brm
        ON 
            lcr.prefix = brm.prefix
        WHERE 
            lcr."timestamp" = (SELECT latest_timestamp FROM latest_timestamp)
        ORDER BY lcr."timestamp" DESC;

        """
        cursor.execute(query)
        db_routes = cursor.fetchall()
     
        # Pasul 2: Procesăm rutele cu `rpki_status = 'N'`
        for route in db_routes:
            if route['rpki_status'] == 'N':
                try:
                    
                    try:
                        # Verificăm dacă ruta este deja `installed` în baza de date
                        cursor.execute("""
                            SELECT * 
                            FROM bgpmonsec_project.bgp_route_monitor
                            WHERE prefix = %s AND router_id = %s
                        """, (route['prefix'], route['router_id']))
                        installed_route = cursor.fetchone()
                    except Exception as e:
                        print(f"Eroare la SELECT: {e}")

                    # Dacă ruta este deja `installed`, o sărim
                    if installed_route:
                        print(f"Ruta {route['prefix']} este deja `installed`. Sar peste configurare.")
                        continue
                    # Inserăm ruta în baza de date
                    cursor.execute("""
                        INSERT INTO bgpmonsec_project.bgp_route_monitor 
                        (prefix, "next_hop", asn_path, rpki_status, status_actions, configured_in_router, router_id, "timestamp")
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                        ON CONFLICT (prefix)
                        DO UPDATE SET 
                            "next_hop" = EXCLUDED."next_hop",
                            asn_path = EXCLUDED.asn_path,
                            rpki_status = EXCLUDED.rpki_status,
                            status_actions = EXCLUDED.status_actions,
                            configured_in_router = EXCLUDED.configured_in_router,
                            "timestamp" = EXCLUDED."timestamp";
                    """, (
                        route['prefix'], route['next_hop'], route['asn_path'], 
                        route['rpki_status'], 'deny', False, 
                        route['router_id'], route['timestamp']
                    ))
                    
                    conn.commit()
                except Exception as e:
                    print(f"Eroare la INSERT: {e}")
                
                configure_router(route['router_id'], route['prefix'])

        
        # Pasul 3: Adăugăm rutele din tabela bgp_route_monitor în răspuns
        query_db_routes = """
        SELECT * FROM bgpmonsec_project.bgp_route_monitor
        """
        cursor.execute(query_db_routes)
        additional_routes = cursor.fetchall()

        # Filtrăm rutele din `db_routes` care nu se regăsesc deja în `additional_routes`
        # Creăm un set cu toate prefixurile din baza de date
        db_prefixes = {route['prefix'] for route in additional_routes}

        # Eliminăm rutele duplicat din `db_routes`
        filtered_db_routes = [route for route in db_routes if route['prefix'] not in db_prefixes]

        # Combinăm rutele filtrate din `db_routes` și cele din baza de date
        combined_routes = filtered_db_routes + additional_routes


        #combined_routes=db_routes
        # Procesăm alertele
        for route in db_routes:
            if route['status'] in ['hijacked', 'suspect']:  # Verificăm doar pentru rute invalide sau suspecte
                # Verificăm dacă alerta există deja necitită
                check_alert_query = """
                SELECT * 
                FROM bgpmonsec_project.alerts 
                WHERE router_id = %s AND alert_name = %s AND was_readed = 'false';
                """
                cursor.execute(check_alert_query, (route['router_id'], route['prefix']))
                existing_alert = cursor.fetchone()

                if existing_alert:
                    # Actualizăm timestamp-ul alertei existente
                    update_alert_query = """
                    UPDATE bgpmonsec_project.alerts
                    SET "timestamp" = NOW()
                    WHERE "ID" = %s;
                    """
                    cursor.execute(update_alert_query, (existing_alert['ID'],))
                else:
                    # Inserăm o nouă alertă
                    insert_alert_query = """
                    INSERT INTO bgpmonsec_project.alerts (router_id, alert_type, alert_name, description, "timestamp", was_readed)
                    VALUES (%s, %s, %s, %s, NOW(), 'false');
                    """
                    alert_type = 'Invalid Route' if route['status'] == 'hijacked' else 'Unknown Route'
                    alert_description = f"Route {route['prefix']} is {route['status']}."
                    cursor.execute(insert_alert_query, (route['router_id'], alert_type, route['prefix'], alert_description))

        conn.commit()
        return JsonResponse({'status': 'success', 'routes': combined_routes})
    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})

    
def get_rpki_trends(request):
    try:
        # Obține și decodează parametrii din request
        start_time_str = request.GET.get('start_time')
        end_time_str = request.GET.get('end_time')
        # Debugging pentru a verifica parametrii primiți

        # Decodificare URL
        if start_time_str:
            start_time_str = unquote(start_time_str)
        if end_time_str:
            end_time_str = unquote(end_time_str)



        # Validare existență parametri
        if not start_time_str or not end_time_str:
            return JsonResponse({
                'status': 'error',
                'message': 'Start time and end time are required.'
            })

        # Conversie în obiecte datetime
        try:
            start_time = datetime.strptime(start_time_str, '%Y-%m-%dT%H:%M')
            end_time = datetime.strptime(end_time_str, '%Y-%m-%dT%H:%M')
        except ValueError as e:
            return JsonResponse({
                'status': 'error',
                'message': f'Invalid date format: {str(e)}'
            })

        # Verificare validitate interval
        if start_time >= end_time:
            return JsonResponse({
                'status': 'error',
                'message': 'Start time must be before end time.'
            })

        conn = database_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)

        query = f"""
                WITH filtered_routes AS (
    SELECT 
        sb.network_with_mask AS prefix,
        sb.rpki_status,
        sb."timestamp"
    FROM 
        bgpmonsec_project.sh_bgp_ip sb
    JOIN 
        bgpmonsec_project.rpki_router_connection_config rc
    ON 
        sb.router_id = rc.router_id
    WHERE 
        rc.config_status = 'Configured'
        AND sb."timestamp" BETWEEN %s AND %s
),
rpki_counts AS (
    SELECT 
        "timestamp",
        COUNT(*) FILTER (WHERE rpki_status = 'I') AS invalid_count,
        COUNT(*) FILTER (WHERE rpki_status = 'V') AS valid_count,
        COUNT(*) FILTER (WHERE rpki_status = 'N') AS not_found_count
    FROM 
        filtered_routes
    GROUP BY "timestamp"
    ORDER BY "timestamp"
)
SELECT 
    "timestamp",
    invalid_count,
    valid_count,
    not_found_count
FROM rpki_counts
ORDER BY "timestamp";

        """
        cursor.execute(query, (start_time, end_time))
        results = cursor.fetchall()
        conn.close()

        # Prelucrează rezultatele pentru JSON
        timestamps = [row['timestamp'].strftime('%Y-%m-%d %H:%M:%S') for row in results]
        invalid_counts = [row['invalid_count'] for row in results]
        valid_counts = [row['valid_count'] for row in results]
        not_found_counts = [row['not_found_count'] for row in results]
        a=JsonResponse({
            'status': 'success',
            'timestamps': timestamps,
            'invalid_counts': invalid_counts,
            'valid_counts': valid_counts,
            'not_found_counts': not_found_counts
        })
        
        return a

    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})
    




def save_bgp_route(prefix, next_hop, asn_path, rpki_status, status_actions, router_id):
    """
    Salvează sau actualizează o rută în tabela bgp_route_monitor.
    """
    conn = database_connection()
    cursor = conn.cursor()
    try:
        # Verifică dacă ruta există
        cursor.execute('''
            SELECT "ID" FROM bgpmonsec_project.bgp_route_monitor
            WHERE prefix = %s AND asn_path = %s
        ''', (prefix, asn_path))
        existing_route = cursor.fetchone()

        if existing_route:
            # Actualizăm statusul rutei existente
            cursor.execute('''
                UPDATE bgpmonsec_project.bgp_route_monitor
                SET status_actions = %s, rpki_status = %s, "next_hop" = %s, router_id = %s
                WHERE "ID" = %s
            ''', (status_actions, rpki_status, next_hop, router_id, existing_route[0]))
        else:
            # Inserăm ruta nouă
            cursor.execute('''
                INSERT INTO bgpmonsec_project.bgp_route_monitor 
                (prefix, "next_hop", asn_path, rpki_status, status_actions, router_id)
                VALUES (%s, %s, %s, %s, %s, %s)
            ''', (prefix, next_hop, asn_path, rpki_status, status_actions, router_id))
        conn.commit()
    except Exception as e:
        print(f"Error saving BGP route: {e}")
    finally:
        cursor.close()
        conn.close()



def update_bgp_route_status(route_id, status_actions):
    """
    Actualizează statusul unei rute în tabela bgp_route_monitor.
    """
    conn = database_connection()
    cursor = conn.cursor()
    try:
        cursor.execute('''
            UPDATE bgpmonsec_project.bgp_route_monitor
            SET status_actions = %s
            WHERE router_id = %s
        ''', (status_actions, route_id))
        conn.commit()
    except Exception as e:
        print(f"Error updating BGP route status: {e}")
    finally:
        cursor.close()
        conn.close()

def parse_bgp_output(bgp_output):
    """
    Parsează ieșirea comenzii `show ip bgp` și returnează o listă de rute, inclusiv prefix, rpki_status, next_hop și ASN.
    """
    routes = []
    for line in bgp_output.splitlines():
        parts = line.split()
        if len(parts) > 6:  # Presupunem o linie validă de rută
            try:
                # Extragem informațiile relevante
                rpki_status = parts[0]  # Statusul RPKI
                prefix = parts[1]       # Prefixul
                next_hop = parts[2]     # Next-hop
                asn_path = " ".join(parts[6:])  # ASN Path

                # Adăugăm ruta în listă
                routes.append({
                    'prefix': prefix,
                    'rpki_status': rpki_status,
                    'next_hop': next_hop,
                    'asn_path': asn_path
                })
            except IndexError:
                print(f"Linie ignorată: {line}")  # Linie invalidă
    return routes



# def configure_prefix_list_and_route_map(net_connect, prefix):
#     """
#     Configurează prefix-list și route-map pe router pentru prefixuri unknown.
#     """
#     # Verificăm prefix-list-ul
#     prefix_list_output = net_connect.send_command("show ip prefix-list ALLOW_UNKNOWN")
#     seq_numbers = [int(line.split()[2]) for line in prefix_list_output.splitlines() if "seq" in line]
#     next_seq = max(seq_numbers) + 5 if seq_numbers else 5

#     # Adăugăm regula deny dacă nu există deja
#     if f"deny {prefix}" not in prefix_list_output:
#         net_connect.send_config_set([f"ip prefix-list ALLOW_UNKNOWN seq {next_seq} deny {prefix}"])

#     # Verificăm route-map-ul
#     route_map_output = net_connect.send_command("show run | s route-map RPKI_POLICY")
#     if f"route-map RPKI_POLICY deny 5" not in route_map_output:
#         net_connect.send_config_set([
#             "route-map RPKI_POLICY deny 5",
#             " match ip address prefix-list ALLOW_UNKNOWN"
#         ])
#         net_connect.save_config()






# def configure_bgp_neighbors(router_ip, username, password, bgp_as):
#     """
#     Verifică și configurează vecinii BGP cu route-map RPKI_POLICY in.
#     """
#     cisco_device = {
#         'device_type': 'cisco_ios',
#         'host': router_ip,
#         'username': username,
#         'password': password,
#         'secret': password
#     }

#     try:
#         net_connect = ConnectHandler(**cisco_device)
#         net_connect.enable()

#         # Verificăm vecinii existenți în routerul BGP
#         bgp_output = net_connect.send_command(f"show run | s router bgp {bgp_as}")
#         neighbors = []
#         for line in bgp_output.splitlines():
#             if "neighbor" in line and "remote-as" in line:
#                 parts = line.split()
#                 neighbor_ip = parts[1]
#                 neighbors.append(neighbor_ip)

#         # Configurăm route-map pentru fiecare neighbor
#         commands = []
#         for neighbor in neighbors:
#             neighbor_config = f"neighbor {neighbor} route-map RPKI_POLICY in"
#             if neighbor_config not in bgp_output:
#                 print(commands)
#                 commands.append(neighbor_config)
#                 print(f"Adding route-map for neighbor {neighbor}.")

#         if commands:
#             net_connect.send_config_set(commands)
#             net_connect.save_config()
#             print("Neighbors configured successfully.")
#         else:
#             print("All neighbors are already configured.")

#         return "configured"

#     except Exception as e:
#         print(f"Error configuring BGP neighbors: {e}")
#         return "error"

#     finally:
#         net_connect.disconnect()


from netmiko import ConnectHandler

# def configure_router(router_id, prefix):
#     """
#     Configurează vecinii, prefix-list și route-map pentru un prefix, conectându-se pe baza router_id.
#     """
#     try:
#         # Obține detaliile routerului din baza de date
#         conn = database_connection()
#         cursor = conn.cursor()
#         cursor.execute('''
#             SELECT "IP", username, password
#             FROM public."ROUTERS_INPUT"
#             WHERE router_id = %s
#         ''', (router_id,))
#         router_details = cursor.fetchone()

#         if not router_details:
#             print(f"Router {router_id} not found in database.")
#             return "error"

#         router_ip, username, password = router_details

#         # Creează conexiunea Netmiko
#         cisco_device = {
#             'device_type': 'cisco_ios',
#             'host': router_ip,
#             'username': username,
#             'password': password,
#             'secret': password,
#             'timeout': 60
#         }

#         # Conexiune Netmiko
#         with ConnectHandler(**cisco_device) as net_connect:
#             net_connect.enable()

#             # Verificăm vecinii și configurarea lor cu route-map
#             bgp_config_output = net_connect.send_command("show run | s router bgp")
#             neighbors = []

#             # Extragem vecinii din configurație
#             for line in bgp_config_output.splitlines():
#                 if "neighbor" in line and "remote-as" in line:
#                     neighbor_ip = line.split()[1]
#                     print(f"Vecin detectat: {neighbor_ip}")
#                     neighbors.append(neighbor_ip)

#             #configurăm Access-List (BLOCK_PREFIXES)
#             acl_name = "BLOCK_PREFIXES"
#             acl_output = net_connect.send_command(f"show run | s access-list {acl_name}")

#             if not acl_output or f"ip access-list extended {acl_name}" not in acl_output:
#                 print(f"Access-list {acl_name} nu există. Creăm o nouă access-list.")
#                 cursor.execute("""
#                     SELECT prefix FROM bgpmonsec_project.bgp_route_monitor WHERE rpki_status = 'N'
#                 """)
#                 prefixes = cursor.fetchall()

#                 acl_commands = [f"ip access-list extended {acl_name}"]
#                 for entry in prefixes:
#                     acl_commands.append(f"permit ip {entry['prefix']} any")

#                 # Adăugăm o regulă finală pentru permit la restul traficului
#                 acl_commands.append("permit ip any any")
#                 net_connect.send_config_set(acl_commands)
#                 print(f"Access-list {acl_name} a fost configurată.")

#             else:
#                 print(f"Access-list {acl_name} există deja.")
#             # Configurăm route-map pentru fiecare vecin
#             commands = []
#             for neighbor in neighbors:
#                 commands.append(f"router bgp 10")
#                 commands.append(f"neighbor {neighbor} route-map RPKI_POLICY in")

#             # Aplicați configurările pe vecini dacă lipsesc
#             if commands:
#                 net_connect.send_config_set(commands)
#                 print("Vecinii au fost configurați cu route-map RPKI_POLICY.")

            
#            # 2. Configurare Route-Map
#             route_map_output = net_connect.send_command("show run | s route-map RPKI_POLICY")
#             if f"route-map RPKI_POLICY deny 5" not in route_map_output:
#                 route_map_commands = [
#                     "route-map RPKI_POLICY deny 5",
#                     f" match ip address {acl_name}",
#                     "route-map RPKI_POLICY permit 10",
#                     " match rpki valid",
#                     " set local-preference 200",
#                     "route-map RPKI_POLICY permit 20",
#                     " match rpki not-found",
#                     "route-map RPKI_POLICY permit 100"
#                 ]
#                 net_connect.send_config_set(route_map_commands)
#                 print("Route-map RPKI_POLICY configurat cu regulile necesare.")
#             # Salvăm configurația
#             net_connect.save_config()
#             print(f"Prefix {prefix} configurat pe router.")

#         return "configured"

#     except Exception as e:
#         print(f"Error configuring router {router_id} for prefix {prefix}: {e}")
#         return "error"


from netmiko import ConnectHandler

def configure_router(router_id, prefix):
    """
    Configurează vecinii, route-map și access-list pentru un prefix, conectându-se pe baza router_id.
    """
    try:
        # Obține detaliile routerului din baza de date
        conn = database_connection()
        cursor = conn.cursor()
        cursor.execute('''
            SELECT "IP", username, password
            FROM public."ROUTERS_INPUT"
            WHERE router_id = %s
        ''', (router_id,))
        router_details = cursor.fetchone()

        if not router_details:
            print(f"Router {router_id} not found in database.")
            return "error"

        router_ip, username, password = router_details

        # Creează conexiunea Netmiko
        cisco_device = {
            'device_type': 'cisco_ios',
            'host': router_ip,
            'username': username,
            'password': password,
            'secret': password,
            'timeout': 60
        }

        # Conexiune Netmiko
        with ConnectHandler(**cisco_device) as net_connect:
            net_connect.enable()

            # 1. Configurăm vecinii cu route-map dacă nu există
            bgp_config_output = net_connect.send_command("show run | s router bgp")
            neighbors = []

            # Extragem vecinii din configurație
            for line in bgp_config_output.splitlines():
                if "neighbor" in line and "remote-as" in line:
                    neighbor_ip = line.split()[1]
                    neighbors.append(neighbor_ip)

            commands = []
            for neighbor in neighbors:
                neighbor_command = f"neighbor {neighbor} route-map RPKI_POLICY in"
                if neighbor_command not in bgp_config_output:
                    commands.append(f"router bgp 10")
                    commands.append(neighbor_command)

            if commands:
                net_connect.send_config_set(commands)
                print("Vecinii au fost configurați cu route-map RPKI_POLICY.")

            # 2. Configurăm route-map-ul dacă nu există
            route_map_output = net_connect.send_command("show run | s route-map RPKI_POLICY")
            if "route-map RPKI_POLICY deny 5" not in route_map_output:
                route_map_commands = [
                    "route-map RPKI_POLICY deny 5",
                    " match ip address BLOCK_PREFIXES",
                    "route-map RPKI_POLICY permit 10",
                    " match rpki valid",
                    " set local-preference 200",
                    "route-map RPKI_POLICY permit 20",
                    " match rpki not-found",
                    "route-map RPKI_POLICY permit 100"
                ]
                net_connect.send_config_set(route_map_commands)
                net_connect.save_config()
                print("Route-map RPKI_POLICY configurat.")

            # 3. Configurăm access-list-ul (BLOCK_PREFIXES)
            acl_name = "BLOCK_PREFIXES"
            acl_output = net_connect.send_command(f"show run | s access-list extended {acl_name}")
            print(acl_output)
            
            if not acl_output or f"ip access-list extended {acl_name}" not in acl_output:
                print(f"Access-list {acl_name} nu există. Creăm o nouă access-list.")
                cursor.execute("""
                    SELECT prefix 
                    FROM bgpmonsec_project.bgp_route_monitor 
                    WHERE rpki_status = 'N'
                """)
                prefixes = cursor.fetchall()
                print('baaaaaaaaaaaa')
                print(f"ip access-list extended {acl_name}")
                print(prefixes)

                acl_commands = [f"ip access-list extended {acl_name}"]
                for entry in prefixes:
                    # Obține prefixul din tuple și transformă-l în format wildcard
                    prefix = entry[0]
                    ip_network = ipaddress.IPv4Network(prefix, strict=False)
                    wildcard = str(ip_network.network_address) + " " + str(ip_network.hostmask)
                    acl_commands.append(f"permit ip {wildcard} any")

                # Adăugăm regulă finală pentru permit la restul traficului
                net_connect.send_config_set(acl_commands)
                net_connect.save_config()
                print(f"Access-list {acl_name} a fost configurată.")
            else:
                print(f"Access-list {acl_name} există deja. Adăugăm prefixul curent.")
                if f"permit ip {prefix} any" not in acl_output:
                    # Transformăm prefixul curent în wildcard
                    ip_network = ipaddress.IPv4Network(prefix, strict=False)
                    wildcard = str(ip_network.network_address) + " " + str(ip_network.hostmask)
                    acl_commands = [
                        f"ip access-list extended {acl_name}",  # Prima comandă pentru a intra în contextul ACL
                        f"permit ip {wildcard} any"            # A doua comandă pentru a adăuga regula
                    ]

                    # Trimite comenzile către router
                    net_connect.send_config_set(acl_commands)
                    print(f"Prefix {prefix} adăugat în access-list {acl_name}.")
                    net_connect.save_config()
                    return "configured"

    except Exception as e:
        print(f"Error configuring router {router_id} for prefix {prefix}: {e}")
        return "error"



