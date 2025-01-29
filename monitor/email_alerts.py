
from google.auth.transport.requests import Request
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
GMAIL_AUTH_PATH = "D:\\MASTER\\Proiect_disertatie\\credentials"

def authenticate_gmail():
    """Autentificare și returnarea unui serviciu Gmail."""
    creds = None
    token_path = os.path.join(GMAIL_AUTH_PATH, "token.json")
    credentials_path = os.path.join(GMAIL_AUTH_PATH, "credentials.json")

    # Verificăm dacă există token.json
    if os.path.exists(token_path):
        creds = Credentials.from_authorized_user_file(token_path, SCOPES)

    # Dacă nu există token.json, inițiem autentificarea
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(credentials_path, SCOPES)
            creds = flow.run_local_server(port=0)

        # Salvăm token-ul în noul folder
        with open(token_path, 'w') as token:
            token.write(creds.to_json())

    return build('gmail', 'v1', credentials=creds)

def send_email(service, to, subject, body):
    """Trimite un email folosind Gmail API."""
    try:
        message = MIMEText(body, 'html')
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
    """Funcție care verifică alertele necitite, grupează alertele și trimite un singur email per utilizator."""
    
    # 1️⃣ Conectare la baza de date
    conn = database_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)

    # 2️⃣ Selectăm toate alertele necitite și netrimise prin email
    cursor.execute("""
        SELECT router_id, alert_type, alert_name, description, MIN(timestamp) as first_seen
        FROM bgpmonsec_project.alerts
        WHERE was_readed = 'false' AND email_send = 'false'
        GROUP BY router_id, alert_type, alert_name, description
        ORDER BY first_seen ASC;
    """)
    alerts = cursor.fetchall()

    if not alerts:
        print("✅ Nu sunt alerte noi de trimis.")
        return

    # 3️⃣ Obținem utilizatorii pentru alerte
    cursor.execute("""
        SELECT first_name, "last_name ", email, alert_router_down, alert_route_n, alert_rpki_down
        FROM bgpmonsec_project.alert_user_email;
    """)
    users = cursor.fetchall()

    gmail_service = authenticate_gmail()

    # 4️⃣ Grupăm alertele pe utilizator
    user_alerts = {user["email"]: [] for user in users}

    for alert in alerts:
        for user in users:
            if (alert["alert_name"] in ["Unknown Route", "Invalid Route"] and user["alert_route_n"] == "true") or \
               (alert["alert_name"] == "Router Down" and user["alert_router_down"] == "true") or \
               (alert["alert_name"] == "RPKI Server Disconnected" and user["alert_rpki_down"] == "true"):
                user_alerts[user["email"]].append(alert)

    # 5️⃣ Construim și trimitem emailurile
    for email, user_alert_list in user_alerts.items():
        if not user_alert_list:
            continue  # Dacă utilizatorul nu are alerte relevante, trecem la următorul

        subject = f"🚨 CRITICAL ALERTS: Immediate Action Required!"
        
        # 🏆 **Construim HTML pentru email**
        email_body = f"""
        <html>
        <head>
            <style>
                body {{ font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; }}
                .container {{ max-width: 600px; margin: 20px auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); }}
                h2 {{ background-color: #d9534f; color: white; text-align: center; padding: 10px; border-radius: 4px; }}
                table {{ width: 100%; border-collapse: collapse; margin-top: 10px; }}
                th, td {{ border: 1px solid #ddd; padding: 10px; text-align: left; }}
                th {{ background-color: #333; color: white; }}
                .critical {{ background-color: #d9534f; color: white; }}
                .warning {{ background-color: #f0ad4e; color: white; }}
                .info {{ background-color: #5bc0de; color: white; }}
                .footer {{ margin-top: 20px; text-align: center; font-size: 12px; color: #777; }}
            </style>
        </head>
        <body>
            <div class="container">
                <h2>🚨 WARNING EVENT - PLEASE REVIEW IMMEDIATELY</h2>
                <p>Dear Network Administrator,</p>
                <p>The following alerts require your immediate attention:</p>
                
                <table>
                    <tr>
                        <th>Alert Type</th>
                        <th>Router ID</th>
                        <th>Description</th>
                        <th>First Seen</th>
                    </tr>
        """
        
        for alert in user_alert_list:
            alert_class = "critical" if "Invalid" in alert["alert_name"] else "warning" if "Unknown" in alert["alert_name"] else "info"
            email_body += f"""
            <tr class="{alert_class}">
                <td><b>{alert['alert_name']}</b></td>
                <td>{alert['router_id']}</td>
                <td>{alert['description']}</td>
                <td>{alert['first_seen']}</td>
            </tr>
            """

        email_body += """
                </table>
                <p>Please log into the BGPMONSEC System for further details and resolution.</p>
                <p class="footer">This is an automated message from BGPMONSEC System. Do not reply.</p>
            </div>
        </body>
        </html>
        """

        send_email(gmail_service, email, subject, email_body)
    # 6️⃣ Marcăm TOATE alertele ca trimise
    cursor.execute("""
        UPDATE bgpmonsec_project.alerts
        SET email_send = true
        WHERE was_readed = 'false' AND email_send = 'false';
    """)
    conn.commit()
    
    print(f"✅ Emailuri trimise către {len(user_alerts)} utilizatori.")
    conn.close()
