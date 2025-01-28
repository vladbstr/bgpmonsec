
from requests import Request
from email.mime.text import MIMEText
from psycopg2.extras import RealDictCursor
from django.http import JsonResponse
import random
from datetime import datetime
from .connections import database_connection
import json
from google_auth_oauthlib.flow import InstalledAppFlow
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
import os
import base64
from email.mime.text import MIMEText
from psycopg2.extras import RealDictCursor


def generate_unique_user_id():
    """
    Generează un ID unic pentru utilizator bazat pe data curentă și 5 numere random.
    """
    current_time = datetime.now().strftime("%d%m%Y%H%M%S")  # zi, lună, an, oră, minut, secundă
    random_number = ''.join([str(random.randint(0, 9)) for _ in range(5)])  # 5 cifre random
    return f"{current_time}{random_number}"



def add_user_alert_email(request):
    if request.method == 'POST':
        try:
            # Decodifică JSON-ul din request.body
            data = json.loads(request.body)

            first_name = data.get('first_name')
            last_name = data.get('last_name')
            email = data.get('email')
            alert_router_down = data.get('alert_router_down', False)
            alert_route_n = data.get('alert_route_n', False)
            alert_rpki_down = data.get('alert_rpki_down', False)

            # Creează un user_id unic
            user_id = generate_unique_user_id()

            # Conectare la baza de date și salvare utilizator
            conn = database_connection()
            cursor = conn.cursor()
            cursor.execute("""
                INSERT INTO bgpmonsec_project.alert_user_email (
                    first_name, "last_name ", email, alert_router_down,
                    alert_route_n, alert_rpki_down, user_id
                ) VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (first_name, last_name, email, alert_router_down, alert_route_n, alert_rpki_down, user_id))
            conn.commit()

            return JsonResponse({'status': 'success', 'message': 'User added successfully.'})

        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

    return JsonResponse({'status': 'error', 'message': 'Invalid request method.'}, status=405)



from django.http import JsonResponse
from .connections import database_connection

def get_alert_users(request):
    """Returnează lista utilizatorilor pentru alerte email."""
    try:
        conn = database_connection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT 
                "ID", first_name, "last_name ", email, 
                alert_router_down, alert_route_n, alert_rpki_down
            FROM bgpmonsec_project.alert_user_email
        """)
        users = cursor.fetchall()

        # Convertim rezultatul într-un format JSON-friendly
        user_list = []
        for user in users:
            user_list.append({
                'id': user[0],
                'first_name': user[1],
                'last_name': user[2],
                'email': user[3],
                'alert_router_down': user[4] == 'true',
                'alert_route_n': user[5] == 'true',
                'alert_rpki_down': user[6] == 'true'
            })

        return JsonResponse({'status': 'success', 'users': user_list})

    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})


def delete_alert_user(request, user_id):
    """Șterge un utilizator din tabela alert_user_email."""
    try:
        conn = database_connection()
        cursor = conn.cursor()
        cursor.execute("""
            DELETE FROM bgpmonsec_project.alert_user_email WHERE "ID" = %s
        """, (user_id,))
        conn.commit()
        return JsonResponse({'status': 'success', 'message': 'User deleted successfully.'})
    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})


def modify_alert_user(request):
    """Modifică alertele unui utilizator existent."""
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            user_id = data.get('id')
            first_name = data.get('first_name')
            last_name = data.get('last_name')
            email=data.get('email')
            alert_router_down = 'true' if data.get('alert_router_down') else 'false'
            alert_route_n = 'true' if data.get('alert_route_n') else 'false'
            alert_rpki_down = 'true' if data.get('alert_rpki_down') else 'false'

            conn = database_connection()
            cursor = conn.cursor()
            cursor.execute("""
               UPDATE bgpmonsec_project.alert_user_email
                SET alert_router_down = %s, alert_route_n = %s, alert_rpki_down = %s, first_name = %s, "last_name " = %s, email = %s
                WHERE "ID" = %s
            """, (alert_router_down, alert_route_n, alert_rpki_down,first_name,last_name,email, user_id))
            conn.commit()

            return JsonResponse({'status': 'success', 'message': 'User modified successfully.'})

        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

    return JsonResponse({'status': 'error', 'message': 'Invalid request method.'}, status=405)




##########################################################


SCOPES = ['https://www.googleapis.com/auth/gmail.send']

def authenticate_gmail():
    """Autentificare și returnarea unui serviciu Gmail."""
    creds = None
    if os.path.exists('token.json'):
        creds = Credentials.from_authorized_user_file('token.json', SCOPES)
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(
                'credentials.json', SCOPES)
            creds = flow.run_local_server(port=0)
        with open('token.json', 'w') as token:
            token.write(creds.to_json())
    return build('gmail', 'v1', credentials=creds)

def send_email(service, to, subject, body):
    """Trimite un email folosind Gmail API."""
    try:
        message = MIMEText(body)
        message['to'] = to
        message['subject'] = subject
        encoded_message = base64.urlsafe_b64encode(message.as_bytes()).decode()
        send_message = {'raw': encoded_message}
        service.users().messages().send(userId="me", body=send_message).execute()
        print(f"Email trimis către {to}.")
    except Exception as e:
        print(f"Eroare la trimiterea emailului: {e}")

def send_email_alerts_view(request):
    """Apelată când utilizatorul apasă pe butonul de trimitere alerte email."""
    if request.method == "POST":
        send_email_alerts()
        return JsonResponse({"status": "success", "message": "Email alerts sent successfully."})
    return JsonResponse({"status": "error", "message": "Invalid request."}, status=400)

def send_email_alerts():
    """Funcție care verifică alertele necitite, trimite email-uri și le marchează ca citite."""
    conn = database_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)

    # Selectăm alertele necitite
    cursor.execute("""
        SELECT router_id, alert_type, alert_name, description, MIN(timestamp) as first_seen
        FROM bgpmonsec_project.alerts
        WHERE was_readed = 'false'
        GROUP BY router_id, alert_type, alert_name, description
        ORDER BY first_seen ASC;
    """)
    alerts = cursor.fetchall()

    if not alerts:
        print("✅ Nu sunt alerte noi de trimis.")
        return

    # Obținem utilizatorii pentru alerte
    cursor.execute("""
        SELECT first_name, "last_name ", email, alert_router_down, alert_route_n, alert_rpki_down
        FROM bgpmonsec_project.alert_user_email;
    """)
    users = cursor.fetchall()

    gmail_service = authenticate_gmail()

    # Trimitem emailuri pe baza alertelor
    for alert in alerts:
        affected_users = []
        for user in users:
            # Verificăm ce tip de alertă să trimitem
            if (alert["alert_name"] == "Unknown Route" and user["alert_route_n"] == "true") or \
               (alert["alert_name"] == "Router Down" and user["alert_router_down"] == "true") or \
               (alert["alert_name"] == "RPKI Server Disconnected" and user["alert_rpki_down"] == "true"):
                affected_users.append(user["email"])

        if not affected_users:
            continue  # Nimeni nu trebuie notificat

        # Construim email-ul
        subject = f"[{alert['alert_type']}] {alert['alert_name']}"
        body = f"""
        Alertă nouă detectată:
        
        - Router ID: {alert['router_id']}
        - Alert Type: {alert['alert_type']}
        - Alert Name: {alert['alert_name']}
        - Description: {alert['description']}
        - First Seen: {alert['first_seen']}

        Aceasta este o alertă automată. Vă rugăm să verificați situația.
        """
        for email in affected_users:
            send_email(gmail_service, email, subject, body)

        # Marcăm alerta ca citită
        cursor.execute("""
            UPDATE bgpmonsec_project.alerts
            SET was_readed = true
            WHERE router_id = %s AND alert_type = %s AND alert_name = %s AND description = %s;
        """, (alert["router_id"], alert["alert_type"], alert["alert_name"], alert["description"]))
        conn.commit()

    print(f"✅ {len(alerts)} alerte trimise cu succes.")
    conn.close()