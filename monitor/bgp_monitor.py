from django.http import JsonResponse
from datetime import datetime
from psycopg2.extras import RealDictCursor
import psycopg2
from .connections import database_connection
from datetime import datetime, timedelta
from urllib.parse import unquote
from .bgp_stats import fetch_bgp_summary_all_routers
from django.contrib.auth.decorators import login_required

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
    SELECT *
    FROM latest_configured_routes
    WHERE "timestamp" = (SELECT latest_timestamp FROM latest_timestamp)
    ORDER BY "timestamp" DESC;

        """
        cursor.execute(query)
        routes = cursor.fetchall()
        print(routes)
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
        print(a)
        return a

    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})