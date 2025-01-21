# BGPMONSEC

![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-12%2B-brightgreen)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow)

## Description

**BGPMONSEC** is an advanced system for monitoring, securing, and managing Border Gateway Protocol (BGP) communications. It integrates powerful features for analysis, alerts, and management, enhancing the security of user networks.

## Key Features

- **BGP Monitoring:** Real-time visualization and analysis of BGP sessions.
- **RPKI Security Management:** Easy implementation and configuration of RPKI servers.
- **Advanced Alerts:** Notification system for critical events.
- **Detailed Statistics:** Graphs and data on BGP performance.
- **Flexibility and Extensibility:** Customizable APIs and structures.

## Technologies Used

- **Backend:** Python (Flask) for application logic.
- **Frontend:** HTML, CSS, Bootstrap for user interface.
- **Database:** PostgreSQL for secure data storage.
- **Others:** Asyncio for asynchronous tasks like monitoring and notifications.

## System Requirements

- **Python 3.8+**
- **PostgreSQL 12+**
- **pipenv** (or equivalent dependency management tool)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/vladbstr/bgpmonsec.git
   cd bgpmonsec
2. Create a virtual environment for storing libraries:

    ```bash
   py -m venv env
   ./env/Script/activate
   pip install -r requirements.txt
3. Run the plicaattion:

   
   ```bash
   py manage.py runsslserver 0.0.0.0:443 --certificate certs/bgpmonsec.crt --key certs/bgpmonsec.key
