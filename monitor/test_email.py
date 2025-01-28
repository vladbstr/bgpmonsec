import os
import base64
from email.mime.text import MIMEText
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from requests import Request

# Scopuri (permisiuni) necesare pentru Gmail API
SCOPES = ['https://www.googleapis.com/auth/gmail.send']

def authenticate_gmail():
    """Autentificare și returnarea unui serviciu Gmail."""
    creds = None
    # Dacă există un token anterior, îl încărcăm
    if os.path.exists('token.json'):
        creds = Credentials.from_authorized_user_file('token.json', SCOPES)
    # Dacă nu există token, inițiem autentificarea
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(
                'credentials.json', SCOPES)
            creds = flow.run_local_server(port=0)
        # Salvăm token-ul pentru utilizare ulterioară
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

if __name__ == '__main__':
    # 1. Autentificare Gmail
    gmail_service = authenticate_gmail()

    # 2. Trimiterea unui email de test
    destinatari = "vlad_bstr@yahoo.com"
    subiect = "Test Gmail API2"
    mesaj = "Acesta este un email trimis folosind Gmail API și Python."
    
    send_email(gmail_service, destinatari, subiect, mesaj)
