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
    SELECT COUNT(*) FROM customer;
END$$
DELIMITER ;

-- Call stored procedure:
CALL all_customer_count();

-- 2) Stored procedure with parameter:
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