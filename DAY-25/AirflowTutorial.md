# Airflow tutorial - 3.0.2 Python 3.12

## Installation & setup

1. Create Python virtual environment & activate
2. Install Apache Airflow

   ```
   pip install "apache-airflow[celery]==3.0.2" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-3.0.2/constraints-3.12.txt"
   ```

3. Migrate database

   `airflow db migrate`

4. Create `dags` folder and store DAG files in it.

5. For devlopment start standalone instance

   `airflow standalone`

6. Open Web UI [http://0.0.0.0:8080/](http://0.0.0.0:8080/)

7. Login with **admin**
