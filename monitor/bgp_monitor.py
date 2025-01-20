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
        routes = cursor.fetchall()

        # Procesăm alertele
        for route in routes:
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
        return JsonResponse({'status': 'success', 'routes': routes})
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
                SET status_actions = %s, rpki_status = %s, "next-hop" = %s, router_id = %s
                WHERE "ID" = %s
            ''', (status_actions, rpki_status, next_hop, router_id, existing_route[0]))
        else:
            # Inserăm ruta nouă
            cursor.execute('''
                INSERT INTO bgpmonsec_project.bgp_route_monitor 
                (prefix, "next-hop", asn_path, rpki_status, status_actions, router_id)
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
            WHERE "router_id" = %s
        ''', (status_actions, route_id))
        conn.commit()
    except Exception as e:
        print(f"Error updating BGP route status: {e}")
    finally:
        cursor.close()
        conn.close()

def configure_router(prefix, router_ip, username, password, action):
    """
    Configurare prefix pe router: permite sau blochează un prefix.
    """
    cisco_device = {
        'device_type': 'cisco_ios',
        'host': router_ip,
        'username': username,
        'password': password,
        'secret': password
    }

    try:
        net_connect = ConnectHandler(**cisco_device)
        net_connect.enable()

        # Verificăm dacă prefixul există deja în route-map
        output = net_connect.send_command("show route-map RPKI_POLICY")
        prefix_rule = f"permit {prefix}" if action == "install" else f"deny {prefix}"

        if prefix_rule in output:
            print(f"Prefix {prefix} already configured with action {action} on router {router_ip}.")
            return "already_configured"

        # Dacă acțiunea este deny, ștergem regula permit existentă
        if action == "deny":
            # Ștergem regula permit dacă există
            delete_commands = [
                f"no ip prefix-list ALLOW_UNKNOWN permit {prefix}"
            ]
            net_connect.send_config_set(delete_commands)
            print(f"Prefix {prefix} removed from permit list on router {router_ip}.")

        # Adăugăm regula corespunzătoare (permit sau deny)
        commands = []
        if action == "install":
            commands = [
                f"ip prefix-list ALLOW_UNKNOWN seq 5 permit {prefix}",
                "route-map RPKI_POLICY permit 5",
                " match ip address prefix-list ALLOW_UNKNOWN",
                " set local-preference 150"
            ]
        elif action == "deny":
            commands = [
                f"ip prefix-list ALLOW_UNKNOWN seq 10 deny {prefix}"
            ]

        net_connect.send_config_set(commands)
        net_connect.save_config()

        print(f"Prefix {prefix} successfully configured with action {action} on router {router_ip}.")
        return "configured"

    except Exception as e:
        print(f"Error configuring router {router_ip}: {e}")
        return "error"

    finally:
        net_connect.disconnect()
