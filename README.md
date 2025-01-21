BGPMONSEC

Description

BGPMONSEC is an advanced system for monitoring, securing, and managing Border Gateway Protocol (BGP) communications. It integrates powerful features for analysis, alerts, and management, enhancing the security of user networks.

Key Features

BGP Monitoring: Real-time visualization and analysis of BGP sessions.

RPKI Security Management: Easy implementation and configuration of RPKI servers.

Advanced Alerts: Notification system for critical events.

Detailed Statistics: Graphs and data on BGP performance.

Flexibility and Extensibility: Customizable APIs and structures.

Technologies Used

Backend: Python (Flask) for application logic.

Frontend: HTML, CSS, Bootstrap for user interface.

Database: PostgreSQL for secure data storage.

Others: Asyncio for asynchronous tasks like monitoring and notifications.

System Requirements

Python 3.8+

PostgreSQL 12+

pipenv (or equivalent dependency management tool)

Installation

Clone the repository:

git clone https://github.com/vladbstr/bgpmonsec.git
cd bgpmonsec

Install dependencies:

pip install -r requirements.txt

Set up the database:

Create a PostgreSQL database.

Update the application configuration to include database connection details.

Run the application:

python run.py

Access the application in your browser at http://localhost:5000.

Note: The application can be configured to run on the secure port 443 using an SSL/TLS certificate issued by a certification authority. Configuration should be performed using a Python virtual environment (venv), and the server must be set up to support HTTPS.

Configuration

The application can be configured using environment variables. Examples of settings include:

DATABASE_URL: The database connection URL.

DEBUG_MODE: Enable or disable debug mode.

Key Functionalities

1. Monitoring

Real-time BGP sessions: View all active sessions.

Statistics: Data on uptime, latency, and other relevant metrics.

2. RPKI Security

Configure and validate prefixes using RPKI servers.

Alerts for detected anomalies.

3. Alerts

Configure and manage custom alerts.

Support for notifications via email and webhooks.

