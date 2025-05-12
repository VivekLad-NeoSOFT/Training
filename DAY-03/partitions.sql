/*
Partitioning in MySQL is a powerful feature that helps manage large tables by dividing them into smaller, 
more manageable pieces, called partitions. 
These partitions are stored and accessed separately, which can improve performance and maintenance.

1) RANGE: Divides data into partitions based on the specified range of the column values.
2) LIST: Divides data into the partitions based on discrete values of the specified column.
3) HASH: Distributes data across partitions based on a hash function applied to one or more columns.
4) KEY: Similar to hash partitioning the partitioning function is based on the hash of the primary key or a unique key column.


Tips on Partitioning:

    1) Don't over-partition — test performance before and after.

    2) Use it only when:

        - You're working with millions of rows.

        - You're querying by the partition key very frequently.

        - You're doing regular archival or deletion by date/region/etc.

    3) Always include the partition column in the primary or unique keys.
*/

-- 1) Partition the orders table so that each partition holds orders for a specific year:
CREATE TABLE orders_partitioned (
    order_id SMALLINT NOT NULL,
    customer_id CHAR(5),
    employee_id SMALLINT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    ship_via SMALLINT,
    freight DECIMAL(10,2),
    ship_name VARCHAR(40),
    ship_address VARCHAR(60),
    ship_city VARCHAR(15),
    ship_region VARCHAR(15),
    ship_postal_code VARCHAR(10),
    ship_country VARCHAR(15),
    PRIMARY KEY (order_id, order_date)
)
PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- Check data:
SELECT * FROM orders_partitioned
WHERE order_date BETWEEN '1996-01-01' AND '1996-12-31';

-- Output:
/*
# order_id	customer_id	employee_id	order_date	required_date	shipped_date	ship_via	freight	ship_name	ship_address	ship_city	ship_region	ship_postal_code	ship_country
10248	VINET	5	1996-07-04	1996-08-01	1996-07-16	3	32.38	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims		51100	France
10249	TOMSP	6	1996-07-05	1996-08-16	1996-07-10	1	11.61	Toms Spezialitäten	Luisenstr. 48	Münster		44087	Germany
10250	HANAR	4	1996-07-08	1996-08-05	1996-07-12	2	65.83	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10251	VICTE	3	1996-07-08	1996-08-05	1996-07-15	1	41.34	Victuailles en stock	2, rue du Commerce	Lyon		69004	France
10252	SUPRD	4	1996-07-09	1996-08-06	1996-07-11	2	51.30	Suprêmes délices	Boulevard Tirou, 255	Charleroi		B-6000	Belgium
10253	HANAR	3	1996-07-10	1996-07-24	1996-07-16	2	58.17	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10254	CHOPS	5	1996-07-11	1996-08-08	1996-07-23	2	22.98	Chop-suey Chinese	Hauptstr. 31	Bern		3012	Switzerland
10255	RICSU	9	1996-07-12	1996-08-09	1996-07-15	3	148.33	Richter Supermarkt	Starenweg 5	Genève		1204	Switzerland
10256	WELLI	3	1996-07-15	1996-08-12	1996-07-17	2	13.97	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10257	HILAA	4	1996-07-16	1996-08-13	1996-07-22	3	81.91	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
*/


-- 2) Group customers into regions (e.g., USA, UK, Others):
CREATE TABLE customers_partitioned (
    customer_id CHAR(5) NOT NULL,
    company_name VARCHAR(40) NOT NULL,
    country VARCHAR(15),
    PRIMARY KEY (customer_id, country)
)
PARTITION BY LIST COLUMNS (country) (
    PARTITION p_usa VALUES IN ('USA'),
    PARTITION p_uk VALUES IN ('UK'),
    PARTITION p_others VALUES IN ('Germany', 'Mexico', 'Canada', 'France')
);


-- 3) Split large volume of orders across 4 partitions using a hash of the customer ID:
CREATE TABLE orders_hashed (
    order_id SMALLINT NOT NULL,
    customer_id CHAR(5),
    order_date DATE,
    freight DECIMAL(10,2),
    PRIMARY KEY (order_id, customer_id)
)
PARTITION BY HASH(customer_id) PARTITIONS 4;


-- 4) Products table is partitioned by the product_id column using MySQL's internal key function:
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
)
PARTITION BY KEY(product_id) PARTITIONS 4;