/*
Database triggers are specialized procedures that automatically respond to certain events on a table or view.
These events include actions such as INSERT, UPDATE, or DELETE. Triggers can be used to enforce complex business rules, maintain audit trails, or synchronize data across tables.
In MySQL, triggers are useful concepts for automating and making sure of the integrity of database operations.

The CREATE TRIGGER statement in MySQL is used to create a new trigger in the database.

Syntax:
    CREATE TRIGGER trigger_name
    {BEFORE | AFTER} {INSERT | UPDATE | DELETE}
    ON table_name 
    FOR EACH ROW
    BEGIN
        -- SQL statements
    END;

Parameters:
    trigger_name: The name of the trigger.

    {BEFORE | AFTER}: Specifies whether the trigger action should happen before or after the triggering event.
    
    {INSERT | UPDATE | DELETE}: Specifies the event that will activate the trigger.
    
    table_name: The name of the table to which the trigger is attached.
    
    FOR EACH ROW: Specifies that the trigger will be executed once for each row affected by the triggering event.
    
    BEGIN & END: The block of SQL statements to be executed when the trigger is activated.
*/

-- 1) Log every new order inserted into a custom orders_audit table:
-- Step 1: Create an audit table:
CREATE TABLE orders_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id SMALLINT,
    customer_id CHAR(5),
    action_time DATETIME,
    action_type VARCHAR(10)
);

-- Step 2: Create the trigger:
DELIMITER //
CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO orders_audit (order_id, customer_id, action_time, action_type)
    VALUES (NEW.order_id, NEW.customer_id, NOW(), 'INSERT');
END;

-- Step 3: Insert new record
INSERT INTO orders VALUES(
    11078, 'VINET', 5, '1996-07-05', '1996-08-06', 
    '1996-07-20', 3, 32.38, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 
    'Reims', NULL, '51100', 'France'
)

-- Output:
/*
# audit_id	order_id    customer_id	action_time	action_type
1	11078	VINET	    2025-05-09  16:12:25	INSERT
*/

-- 2) Prevent Changing Product Price Above a Limit:
-- Prevent updating a product's price above 1000:
DELIMITER //
CREATE TRIGGER before_product_price_update
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF NEW.unit_price > 1000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Unit price cannot exceed 1000';
    END IF;
END;

-- Try to update one record:
UPDATE products
SET unit_price = 2000
WHERE product_id = 20;

-- Output:
/*
Error Code: 1644. Unit price cannot exceed 1000
*/

-- 3) Track Deleted Customers:
-- Keep a record of deleted customers in a separate table:

-- Step 1: Create a backup table:
CREATE TABLE deleted_customers (
    customer_id CHAR(5),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    deleted_at DATETIME
);

-- Step 2: Create the trigger:
DELIMITER //
CREATE TRIGGER after_customer_delete
AFTER DELETE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO deleted_customers (customer_id, first_name, last_name, deleted_at)
    VALUES (OLD.customer_id, OLD.first_name, OLD.last_name, NOW());
END;

-- Step 3: Delete a record:
DELETE FROM customer WHERE customer_id = 1;

-- Output:
/*
# customer_id	first_name	last_name	deleted_at
1	            Alfie	    Brazer	    2025-05-09 17:15:16
*/

