from typing import Any
from pyspark.sql import SparkSession
import sys
from datetime import datetime


def ingest_table_to_bronze(
        spark: SparkSession,
        jdbc_url: str,
        connection_properties: dict[str, Any],
        table_name: str,
        bronze_base_path: str
):
    """Ingests a MySQL table to the Bronze layer, partitioned by ingestion date."""
    print(f"Starting ingestion for table: {table_name}")
    try:
        df = spark.read.jdbc(
            url=jdbc_url,
            table=table_name,
            properties=connection_properties
        )

        # Add ingestion date for partitioning
        today = datetime.today()
        year = today.strftime("%Y")
        month = today.strftime("%m")
        day = today.strftime("%d")

        output_path = f"{bronze_base_path}/mysql/{table_name}/{year}/{month}/{day}"

        print(f"Writing data for {table_name} to: {output_path}")
        df.write.mode("overwrite").parquet(output_path)
        print(f"Successfully ingested {table_name} to {output_path}")

    except Exception as e:
        print(f"Error ingesting table {table_name}: {e}")
        raise


if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: bronze_ingestion.py <jdbc_url> <user> <password> <table_name> <bronze_base_path>")
        sys.exit(-1)

    jdbc_url_arg = sys.argv[1]
    user_arg = sys.argv[2]
    password_arg = sys.argv[3]
    table_name_arg = sys.argv[4]
    bronze_base_path_arg = sys.argv[5]  # e.g., /opt/ecommerce_data_lake/bronze

    spark = SparkSession.builder.appName(
        f"BronzeIngestion_{table_name_arg}").getOrCreate()

    db_connection_properties = {
        "user": user_arg,
        "password": password_arg,
        # Ensure MySQL JDBC driver is available to Spark
        "driver": "com.mysql.cj.jdbc.Driver"
    }

    # You might need to add the MySQL JDBC driver to Spark's jars.
    # For bitnami/spark, you might need to download and place it in spark/jars or use --packages in spark-submit.
    # Example: spark-submit --packages mysql:mysql-connector-java:8.0.28 ... your_script.py

    ingest_table_to_bronze(
        spark,
        jdbc_url_arg,
        db_connection_properties,
        table_name_arg,
        bronze_base_path_arg
    )

    spark.stop()
