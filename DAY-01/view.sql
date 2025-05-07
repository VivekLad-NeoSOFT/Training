/*
In SQL, a view is a virtual table based on the result-set of an SQL statement.
A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.
You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.
*/

-- 1) Creating a View:
CREATE VIEW customer_basic_info AS
SELECT 
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email
FROM customer;

-- Use view:
SELECT * FROM customer_basic_info;

-- Output:
/*
# customer_id	full_name	email
1	Alfie Brazer	abrazer0@newsvine.com
2	Vitia Bunclark	vbunclark1@jimdo.com
3	Dell Rumke	drumke2@latimes.com
4	Ashli Ponnsett	aponnsett3@jigsy.com
5	Katha Hatter	khatter4@webeden.co.uk
6	Rhianon Shimwall	rshimwall5@upenn.edu
7	Jo-ann Spragge	jspragge6@nymag.com
8	Stesha Lazer	slazer7@biglobe.ne.jp
9	Aidan Stapells	astapells8@scientificamerican.com
10	Waneta Parades	wparades9@printfriendly.com
*/
-----------------------------------------------------------------------------------------------------------------

-- 2) Updating a View:
DROP VIEW IF EXISTS customer_basic_info;

CREATE VIEW customer_basic_info AS
SELECT 
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email,
    city
FROM customer;

-- Output:
/*
# customer_id	full_name	email	city
1	Alfie Brazer	abrazer0@newsvine.com	Huangrangping
2	Vitia Bunclark	vbunclark1@jimdo.com	Mikhaylovka
3	Dell Rumke	drumke2@latimes.com	Logon
4	Ashli Ponnsett	aponnsett3@jigsy.com	Hernández
5	Katha Hatter	khatter4@webeden.co.uk	Akron
6	Rhianon Shimwall	rshimwall5@upenn.edu	Mirsk
7	Jo-ann Spragge	jspragge6@nymag.com	Rantīs
8	Stesha Lazer	slazer7@biglobe.ne.jp	Juripiranga
9	Aidan Stapells	astapells8@scientificamerican.com	Vrtojba
10	Waneta Parades	wparades9@printfriendly.com	Pajannangger
*/
-----------------------------------------------------------------------------------------------------------------

-- 3) Dropping a View:
DROP VIEW IF EXISTS customer_basic_info;
-----------------------------------------------------------------------------------------------------------------

-- 4) Updatable Views*
/*
Some views are updatable, meaning you can INSERT, UPDATE, or DELETE from them. A view is updatable only if:

    It selects from one table.

    It doesn't use DISTINCT, GROUP BY, HAVING, UNION, subqueries, or aggregates.

    It includes all primary key columns.
*/

CREATE VIEW editable_customers AS
SELECT customer_id, first_name, last_name, email
FROM customer;

UPDATE editable_customers
SET email = 'new@example.com'
WHERE customer_id = 1;

-----------------------------------------------------------------------------------------------------------------

-- 5) Check View Definition:
SHOW CREATE VIEW view_name;

-- Output:
/*
# View	Create View	character_set_client	collation_connection
editable_customers	CREATE ALGORITHM=UNDEFINED DEFINER=`your_user`@`localhost` SQL SECURITY DEFINER VIEW `editable_customers` AS select `customer`.`customer_id` AS `customer_id`,`customer`.`first_name` AS `first_name`,`customer`.`last_name` AS `last_name`,`customer`.`email` AS `email` from `customer`	utf8mb4	utf8mb4_0900_ai_ci
*/
-----------------------------------------------------------------------------------------------------------------

-- 6) List all views:
SHOW FULL TABLES IN training WHERE TABLE_TYPE = 'VIEW';

-- Output:
/*
# Tables_in_training	Table_type
editable_customers	VIEW
*/
-----------------------------------------------------------------------------------------------------------------
