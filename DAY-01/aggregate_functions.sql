/*
An aggregate function is a function that performs a calculation on a set of values, and returns a single value.

Aggregate functions are often used with the GROUP BY clause of the SELECT statement. 
The GROUP BY clause splits the result-set into groups of values and the aggregate 
function can be used to return a single value for each group.

The most commonly used SQL aggregate functions are:

    MIN() - returns the smallest value within the selected column
    MAX() - returns the largest value within the selected column
    COUNT() - returns the number of rows in a set
    SUM() - returns the total sum of a numerical column
    AVG() - returns the average value of a numerical column

Aggregate functions ignore null values (except for COUNT()).
*/

-- 1) MIN()
SELECT MIN(customer_id) as 'First Customer' FROM customer;

-- Output:
/*
# First Customer
1
*/
-----------------------------------------------------------------------------------------------------------------

-- 2) MAX()
SELECT MAX(customer_id) as 'Last Customer' FROM customer;

-- Output:
/*
# Last Customer
1002
*/
-----------------------------------------------------------------------------------------------------------------

-- 3.1) COUNT()
SELECT COUNT(customer_id) as 'Total Customers' FROM customer;

-- Output:
/*
# Total Customers
1002
*/

-- 3.2) Count Customers by Country
SELECT country, COUNT(*) AS total_customers
FROM customer
GROUP BY country;

-- Output:
/*
# country	total_customers
China	182
Russia	61
Philippines	61
Argentina	10
United States	18
Poland	39
*/

-- 3.3) Count Customers in Age Brackets
SELECT
    CASE
        WHEN TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) < 18 THEN 'Under 18'
        WHEN TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) BETWEEN 18 AND 35 THEN '18-35'
        WHEN TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) BETWEEN 36 AND 60 THEN '36-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers
FROM customer
GROUP BY age_group;

-- Output:
/*
# age_group	total_customers
60+	283
36-60	437
18-35	282
*/
-----------------------------------------------------------------------------------------------------------------

-- 4) SUM()
SELECT SUM(postal_code) as 'Weird Total' FROM customer;

-- Output:
/*
# Weird Total
39135276
*/
-----------------------------------------------------------------------------------------------------------------

-- 5.1) AVG()
SELECT AVG(postal_code) as 'Weird Average' FROM customer;

-- Output:
/*
# Weird Average
80525.25925925926
*/

-- 5.2) Average Age of Customers by Country
SELECT country, AVG(TIMESTAMPDIFF(YEAR, birthdate, CURDATE())) AS average_age
FROM customer
GROUP BY country;

-- Output:
/*
# country	average_age
China	47.9945
Russia	50.0164
Philippines	44.7377
Argentina	40.1000
United States	48.4444
Poland	45.9487
Palestinian Territory	46.2000
Brazil	42.4545
*/
