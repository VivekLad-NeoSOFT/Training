CREATE DATABASE airflow_metadata;
GRANT ALL PRIVILEGES ON DATABASE airflow_metadata TO admin;

CREATE SCHEMA IF NOT EXISTS dimensions;
CREATE SCHEMA IF NOT EXISTS facts;


CREATE TABLE IF NOT EXISTS dimensions.dim_customer (
    customer_sk SERIAL PRIMARY KEY,      
    customer_id INT,                      
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(50),
    city VARCHAR(50),
    postal_code VARCHAR(50),
    country VARCHAR(50),
    date_of_birth DATE,
    created_at TIMESTAMP,
    effective_from TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    effective_to TIMESTAMP,               
    is_current BOOLEAN DEFAULT TRUE       
);


CREATE TABLE IF NOT EXISTS dimensions.dim_product (
    product_sk SERIAL PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(6,2),
    description TEXT,
    stock_quantity INT,
    created_at TIMESTAMP,
    effective_from TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    effective_to TIMESTAMP,
    is_current BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS facts.fact_orders (
    order_sk SERIAL PRIMARY KEY,
    customer_sk INT,
    product_sk INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_sk) REFERENCES dimensions.dim_customer(customer_sk),
    FOREIGN KEY (product_sk) REFERENCES dimensions.dim_product(product_sk)
);

CREATE TABLE IF NOT EXISTS facts.fact_sales_summary (
    sale_date DATE PRIMARY KEY,
    total_revenue NUMERIC(12, 2),
    total_orders INT,
    average_order_value NUMERIC(12, 2)
);
