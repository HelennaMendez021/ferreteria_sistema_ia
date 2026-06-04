 # Ferretería Inteligente - Sistema de Gestión con IA

Una plataforma integral de gestión para ferreterías que utiliza **Inteligencia Artificial y Machine Learning** para transformar datos históricos en decisiones estratégicas. Este proyecto combina una arquitectura web robusta con modelos predictivos para optimizar ventas y almacén.

## Características Principales

*   **Segmentación de Clientes (IA):** Algoritmo **K-Means** que clasifica automáticamente a los usuarios en Clientes Premium, Ocasionales e Inactivos basándose en su gasto y frecuencia.
*   **Predicción de Demanda:** Modelo de **Regresión Lineal** para proyectar ventas futuras y detectar tendencias de crecimiento en tiempo real.
*   **Dashboard "Empresa" (BI):** Tablero de control de alto nivel con indicadores financieros, tasas de conversión y visualización de categorías clave.
*   **Monitoreo de Almacén:** Sistema de semáforo inteligente para stock (Crítico, Aceptable, Saludable) y detección de productos de baja rotación.
*   **Gestión de Resurtido:** Flujo transaccional para compra de mercancía con generación automática de **Tickets PDF**.

## Stack Tecnológico

*   **Backend:** Python 3.12 / Django
*   **Base de Datos:** MySQL
*   **IA/Analítica:** Scikit-Learn, Pandas, Numpy
*   **Visualización:** Matplotlib
*   **Reportes:** ReportLab (Generación de PDF)
*   **Frontend:** Django Templates + Tailwind CSS

## Instalación y Configuración

Sigue estos pasos para replicar el entorno de desarrollo:

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/TU_USUARIO/ferreteria-ia-ml.git
   cd ferreteria-ia-ml
   ```

2. **Configurar el entorno virtual:**
   ```bash
   python -m venv venv
   source venv/bin/activate  # En Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```

3. **Configurar variables de entorno:**
   Crea un archivo `.env` en la raíz del proyecto con la siguiente estructura:
   ```env
   SECRET_KEY=tu_secret_key_django
   DB_NAME=ferreteria
   DB_USER=root
   DB_PASSWORD=tu_password_mysql
   DB_HOST=localhost
   DB_PORT=3306
   ```

4. **Preparar la base de datos:**
   Crea la base de datos `ferreteria` en tu gestor MySQL y luego ejecuta:
   ```bash
   python manage.py migrate
   python manage.py loaddata datos_ferreteria.json
   ```

5. **Iniciar el servidor:**
   ```bash
   python manage.py runserver
   ```

## Acceso Administrativo
Para visualizar los dashboards de IA y reportes de empresa, debes iniciar sesión con el usuario con username **`admin`**.

---
*Desarrollado como proyecto integrador de Inteligencia Artificial en Negocios Digitales.*
