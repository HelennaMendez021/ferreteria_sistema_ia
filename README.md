# Ferretería IA (Django/MySQL)
Gestión de stock/ventas con Machine Learning.
## Setup
1. `pip install -r requirements.txt`
2. Configura `.env` (DB_NAME, DB_USER, DB_PASSWORD, SECRET_KEY).
3. `python manage.py migrate`
4. `python manage.py loaddata datos_ferreteria.json`
5. `python manage.py runserver`
Acceso dashboards: usuario 'admin'.
