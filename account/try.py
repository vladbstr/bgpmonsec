import psycopg2
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
cursor.execute('SELECT ("IP", description, r_state,router_id) FROM public."ROUTERS_INPUT" ORDER BY id DESC')

varr=cursor.fetchall()
# Salvează modificările
conn.commit()
print(varr)
data_routere = [{'IP': row[0].split(',')[0],'description': row[0].split(',')[1], 'r_state': row[0].split(',')[2]} for row in varr]
# Închide cursorul și conexiunea
cursor.close()
conn.close()