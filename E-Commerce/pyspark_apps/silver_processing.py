from pyspark.sql import SparkSession
from pyspark.sql.functions import col, to_timestamp, lower, trim
import sys


def process_orders_to_silver(
        spark: SparkSession,
        bronze_base_path: str,
        silver_base_path: str,
        processing_date_str: str
):
    """Cleans and transforms raw orders data to the Silver layer."""
    year, month, day = processing_date_str.split('-')
    raw_orders_path = f"{bronze_base_path}/mysql/orders/{year}/{month}/{day}"
    silver_orders_path = f"{silver_base_path}/orders_cleaned/processed_date={processing_date_str}"

    print(f"Reading raw orders from: {raw_orders_path}")
    try:
        df_orders = spark.read.parquet(raw_orders_path)

        # Example Transformations:
        df_orders_cleaned = df_orders.withColumn("order_date", to_timestamp(col("order_date"))) \
                                     .withColumn("status", lower(trim(col("status")))) \
                                     .withColumn("total_amount", col("total_amount").cast("decimal(10,2)"))

        # Handle missing values (example: fill 'shipping_address' with 'N/A')
        df_orders_cleaned = df_orders_cleaned.fillna(
            {"shipping_address": "N/A"})

        # Schema Enforcement (select and cast)
        df_orders_silver = df_orders_cleaned.select(
            col("order_id").cast("int"),
            col("customer_id").cast("int"),
            col("order_date"),
            col("status").cast("string"),
            col("total_amount"),
            col("shipping_address").cast("string")
            # Add other relevant columns
        )

        print(f"Writing cleaned orders to: {silver_orders_path}")
        df_orders_silver.write.mode("overwrite").parquet(silver_orders_path)
        print(f"Successfully processed orders to Silver: {silver_orders_path}")

    except Exception as e:
        print(f"Error processing orders to Silver: {e}")
        raise

# Add similar functions for customers (e.g., process_customers_to_silver)
# and products (e.g., process_products_to_silver)


if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: silver_processing.py <bronze_base_path> <silver_base_path> <processing_date YYYY-MM-DD>")
        sys.exit(-1)

    bronze_path_arg = sys.argv[1]  # e.g., /opt/ecommerce_data_lake/bronze
    silver_path_arg = sys.argv[2]  # e.g., /opt/ecommerce_data_lake/silver
    date_arg = sys.argv[3]        # e.g., {{ ds }} from Airflow

    spark = SparkSession.builder.appName(
        "SilverProcessing").getOrCreate()

    process_orders_to_silver(
        spark,
        bronze_path_arg,
        silver_path_arg,
        date_arg
    )
    # Call other processing functions here for customers, products etc.

    spark.stop()
