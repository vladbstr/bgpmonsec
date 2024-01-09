import psycopg2
from pythonping import ping
def check_router_status(idrouter):

    conn = psycopg2.connect(
                        database="bgpmonsec",
                        user="bgpmonsec_user",
                        password="admin",
                        host="127.0.0.1",
                        port="5432"
                    )   

    cursor = conn.cursor()

    #INSERT INTO public."ROUTERS_INPUT" (IP, username, password) VALUES ('192.168.10.1', 'admin', 'admin');
    # Execută comanda SQL folosind parametrii
    cursor.execute('SELECT router_id,"IP" FROM public."ROUTERS_INPUT" where router_id = %s',(idrouter,))
    
    varr=cursor.fetchall()
    # Salvează modificările
    ip_router_add=varr[0][1]
    response_list = ping(ip_router_add, count=2, timeout=1)
    if any(response.success for response in response_list):
        cursor.close()
        conn.close()
        return 200 
    else:
        cursor.close()
        conn.close()
        return 500

        