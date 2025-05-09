-- Stored Procedures
/* 
Stored procedures are precompiled SQL statements that are stored in the database 
and can be executed as a single unit. SQL Stored Procedures are a powerful feature in 
database management systems (DBMS) that allow developers to encapsulate SQL code and business logic.
When executed, they can accept input parameters and return output, acting as a reusable unit of work 
that can be invoked multiple times by users, applications, or other procedures.

*/

-- 1) Simple stored procedure for count all customers:
DELIMITER $$
CREATE PROCEDURE all_customer_count()
BEGIN
    SELECT COUNT(*) as [Total records] FROM customer;
END$$
DELIMITER ;

-- Call stored procedure:
CALL all_customer_count();

-- Output:
/*
# Total records
1001
*/
-----------------------------------------------------------------------------------------------------------------

-- 2) With single parameter:
DELIMITER $$
CREATE PROCEDURE get_customer_by_country(IN country VARCHAR(255))
BEGIN
    SELECT customer_id, first_name, last_name, city, country
    FROM customer
    WHERE country=country;
END$$
DELIMITER ;

-- Call stored procedure:
CALL get_customer_by_country('China');

-- Output:
/*
customer_id	first_name	last_name	city	country
1	Alfie	Brazer	Huangrangping	China
2	Vitia	Bunclark	Mikhaylovka	China
3	Dell	Rumke	Logon	China
4	Ashli	Ponnsett	Hernández	China
5	Katha	Hatter	Akron	China
6	Rhianon	Shimwall	Mirsk	China
7	Jo-ann	Spragge	Rantīs	China
8	Stesha	Lazer	Juripiranga	China
9	Aidan	Stapells	Vrtojba	China
10	Waneta	Parades	Pajannangger	China
11	Pru	Havile	Qinhong	China
12	Jean	Blade	Xin’an	China
13	Lynne	Langhor	Pupiales	China
14	Wendeline	Jellard	Platagata	China
*/
-----------------------------------------------------------------------------------------------------------------

-- 3) Add Customer
DELIMITER //
CREATE PROCEDURE AddCustomer (
	IN customer_id INT,
	IN first_name VARCHAR(50),
	IN last_name VARCHAR(50),
	IN email VARCHAR(50),
	IN phone_number VARCHAR(50),
	IN birthdate DATE,
	IN address VARCHAR(50),
	IN city VARCHAR(50),
	IN country VARCHAR(50),
	IN postal_code VARCHAR(50)
)
BEGIN
    INSERT INTO customer (
	    customer_id, first_name, last_name, email, phone_number, 
        birthdate, address, city, country, postal_code
    )
    VALUES (
		customer_id, first_name, last_name, email, phone_number, 
        birthdate, address, city, country, postal_code
    );
END //
DELIMITER ;

-- Call stored procedure:
CALL AddCustomer(
    1002, 'Vivek', 'Lad', 'Vivek.lad@example.com', '222-154-3766', 
    '1996-08-29', '90 Starling Avenue', 'Mumbai', 'India', '400012'
);
-----------------------------------------------------------------------------------------------------------------

-- 4) Search customers by name or email.
DELIMITER //
CREATE PROCEDURE SearchCustomers (
    IN name_or_email VARCHAR(100)
)
BEGIN
    SELECT * FROM customer
    WHERE
        first_name LIKE CONCAT('%', name_or_email, '%') OR
        last_name LIKE CONCAT('%', name_or_email, '%') OR
        email LIKE CONCAT('%', name_or_email, '%');
END //
DELIMITER ;

-- Call stored procedure:
CALL SearchCustomers('Vivek');

-- Output:
/*
# customer_id	first_name	last_name	email	phone_number	birthdate	address	city	country	postal_code
1001	Vivek	Lad	Vivek.lad@newsvine.com	222-154-3766	1996-08-29	90 Starling Avenue	Mumbai	India	400012
1002	Vivek	Lad	Vivek.lad@example.com	222-154-3766	1996-08-29	90 Starling Avenue	Mumbai	India	400012
*/
-----------------------------------------------------------------------------------------------------------------

-- 5) Get customer by customer_id as a string.
DELIMITER //
CREATE PROCEDURE GetCustomerByStringId (
    IN str_id VARCHAR(10)
)
BEGIN
    DECLARE id INT;
    SET id = CAST(str_id AS UNSIGNED);
    SELECT * FROM customer WHERE customer_id = id;
END //
DELIMITER ;

-- Call stored procedure:
CALL GetCustomerByStringId('912');

-- Output:
/*
# customer_id	first_name	last_name	email	phone_number	birthdate	address	city	country	postal_code
912	Joyce	Boncore	jboncorepb@issuu.com	763-897-2071	1953-07-15	915 Merchant Point	Nanshao	China	
*/
-----------------------------------------------------------------------------------------------------------------

-- 6) Droppong a stored procedure.
DROP PROCEDURE IF EXISTS all_customer_count;
-----------------------------------------------------------------------------------------------------------------

-- 8) Updating a Stored Procedure.

-- Create new SP
DELIMITER //
CREATE PROCEDURE GetCustomersByCountry(IN p_country VARCHAR(50))
BEGIN
    SELECT * FROM customer WHERE country = p_country;
END;

-- DROP and create new SP with updation
DROP PROCEDURE IF EXISTS GetCustomersByCountry;

DELIMITER //

CREATE PROCEDURE GetCustomersByCountry(
    IN p_country VARCHAR(50),
    IN p_city VARCHAR(50)
)
BEGIN
    SELECT * FROM customer
    WHERE country = p_country AND city = p_city;
END //

DELIMITER ;
-----------------------------------------------------------------------------------------------------------------

-- 9) List All Stored Procedures.
SHOW PROCEDURE STATUS WHERE Db = 'training';

-- Output:
/*
# Db	Name	Type	Definer	Modified	Created	Security_type	Comment	character_set_client	collation_connection	Database Collation
training	AddCustomer	PROCEDURE	your_user@localhost	2025-05-07 12:42:30	2025-05-07 12:42:30	DEFINER		utf8mb4	utf8mb4_0900_ai_ci	utf8mb4_0900_ai_ci
training	all_customer_count	PROCEDURE	your_user@localhost	2025-05-07 14:29:01	2025-05-07 14:29:01	DEFINER		utf8mb4	utf8mb4_0900_ai_ci	utf8mb4_0900_ai_ci
training	GetCustomerByStringId	PROCEDURE	your_user@localhost	2025-05-07 14:09:43	2025-05-07 14:09:43	DEFINER		utf8mb4	utf8mb4_0900_ai_ci	utf8mb4_0900_ai_ci
training	GetCustomersByCountry	PROCEDURE	your_user@localhost	2025-05-07 14:21:31	2025-05-07 14:21:31	DEFINER		utf8mb4	utf8mb4_0900_ai_ci	utf8mb4_0900_ai_ci
training	get_customer_by_country	PROCEDURE	your_user@localhost	2025-05-07 12:21:13	2025-05-07 12:21:13	DEFINER		utf8mb4	utf8mb4_0900_ai_ci	utf8mb4_0900_ai_ci
training	SearchCustomers	PROCEDURE	your_user@localhost	2025-05-07 12:51:13	2025-05-07 12:51:13	DEFINER		utf8mb4	utf8mb4_0900_ai_ci	utf8mb4_0900_ai_ci
*/
-----------------------------------------------------------------------------------------------------------------

-- 10) See SP code.
SHOW CREATE PROCEDURE AddCustomer;

-- Output:
/*
# Procedure	sql_mode	Create Procedure	character_set_client	collation_connection	Database Collation
AddCustomer	ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION	CREATE DEFINER=`your_user`@`localhost` PROCEDURE `AddCustomer`(
	IN customer_id INT,
	IN first_name VARCHAR(50),
	IN last_name VARCHAR(50),
	IN email VARCHAR(50),
	IN phone_number VARCHAR(50),
	IN birthdate DATE,
	IN address VARCHAR(50),
	IN city VARCHAR(50),
	IN country VARCHAR(50),
	IN postal_code VARCHAR(50)
)
BEGIN
    INSERT INTO customer (
	customer_id, first_name, last_name, email, phone_number, birthdate, address, city, country, postal_code
    )
    VALUES (
		customer_id, first_name, last_name, email, phone_number, birthdate, address, city, country, postal_code
    );
END	utf8mb4	utf8mb4_0900_ai_ci	utf8mb4_0900_ai_ci
*/