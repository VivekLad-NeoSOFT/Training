/*
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

1) INNER JOIN: The INNER JOIN keyword selects records that have matching values in both tables.
2) LEFT JOIN: The LEFT JOIN keyword returns all records from the left table, and the matching records (if any) from the right table.
3) RIGHT JOIN: The RIGHT JOIN keyword returns all records from the right table, and the matching records (if any) from the left table.
4) CROSS JOIN: The CROSS JOIN keyword returns all records from both tables.
5) SELF JOIN: A self join is a regular join, but the table is joined with itself.

6) Semi-Join: A semi-join returns rows from the left table where a match exists in the right table, 
but doesn't return columns from the right table.
7) Anti-Join: An anti-join returns rows from the left table where no match exists in the right table.

*/
-- Dataset -> Northwind Traders dataset.

-- 1) Inner join (INNER JOIN):
-- Get all orders with customer and employee names:
SELECT 
    o.order_id,
    c.company_name AS customer,
    e.first_name,
    e.last_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN employees e ON o.employee_id = e.employee_id;

-- Output
/*
# order_id	customer	first_name	last_name
10258	Ernst Handel	Nancy	Davolio
10270	Wartian Herkku	Nancy	Davolio
10275	Magazzini Alimentari Riuniti	Nancy	Davolio
10285	QUICK-Stop	Nancy	Davolio
10292	Tradição Hipermercados	Nancy	Davolio
10293	Tortuga Restaurante	Nancy	Davolio
10304	Tortuga Restaurante	Nancy	Davolio
10306	Romero y tomillo	Nancy	Davolio
10311	Du monde entier	Nancy	Davolio
10314	Rattlesnake Canyon Grocery	Nancy	Davolio
10316	Rattlesnake Canyon Grocery	Nancy	Davolio
10325	Königlich Essen	Nancy	Davolio
10340	Bon app'	Nancy	Davolio
10351	Ernst Handel	Nancy	Davolio
10357	LILA-Supermercado	Nancy	Davolio
10361	QUICK-Stop	Nancy	Davolio
10364	Eastern Connection	Nancy	Davolio
10371	La maison d'Asie	Nancy	Davolio
10374	Wolski  Zajazd	Nancy	Davolio
10376	Mère Paillarde	Nancy	Davolio
10377	Seven Seas Imports	Nancy	Davolio
*/

-- 2) Left join (LEFT JOIN):
-- List all customers and their orders:
SELECT 
    c.customer_id,
    c.company_name,
    o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Output
/*
# customer_id	company_name	order_id
ALFKI	Alfreds Futterkiste	10643
ALFKI	Alfreds Futterkiste	10692
ALFKI	Alfreds Futterkiste	10702
ALFKI	Alfreds Futterkiste	10835
ALFKI	Alfreds Futterkiste	10952
ALFKI	Alfreds Futterkiste	11011
ANATR	Ana Trujillo Emparedados y helados	10308
ANATR	Ana Trujillo Emparedados y helados	10625
ANATR	Ana Trujillo Emparedados y helados	10759
ANATR	Ana Trujillo Emparedados y helados	10926
ANTON	Antonio Moreno Taquería	10365
ANTON	Antonio Moreno Taquería	10507
*/

-- 3) Right join (RIGHT JOIN):
-- List all orders and include customer information:
SELECT 
    o.order_id,
    o.customer_id,
    c.company_name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;

-- Output:
/*
# order_id	customer_id	company_name
10414	FAMIA	Familia Arquibaldo
10512	FAMIA	Familia Arquibaldo
10581	FAMIA	Familia Arquibaldo
10650	FAMIA	Familia Arquibaldo
10725	FAMIA	Familia Arquibaldo
		FISSA Fabrica Inter. Salchichas S.A.
10408	FOLIG	Folies gourmandes
10480	FOLIG	Folies gourmandes
10634	FOLIG	Folies gourmandes
*/


-- 4) Cross join (CROSS JOIN):
-- Get a combination of all categories and all suppliers:
SELECT 
    c.category_name,
    s.company_name AS supplier
FROM categories c
CROSS JOIN suppliers s;

-- Output
/*
# category_name	supplier
Seafood	Exotic Liquids
Produce	Exotic Liquids
Meat/Poultry	Exotic Liquids
Grains/Cereals	Exotic Liquids
Dairy Products	Exotic Liquids
Confections	Exotic Liquids
Condiments	Exotic Liquids
Beverages	Exotic Liquids
Seafood	New Orleans Cajun Delights
Produce	New Orleans Cajun Delights
*/

-- 5) Self join (SELF JOIN):
-- List employees and their managers using the reports_to column:
SELECT 
    e1.employee_id AS employee_id,
    e1.first_name AS employee_name,
    e2.first_name AS manager_name
FROM employees e1
LEFT JOIN employees e2 ON e1.reports_to = e2.employee_id;

-- Output
/*
# employee_id	employee_name	manager_name
1	Nancy	Andrew
2	Andrew	
3	Janet	Andrew
4	Margaret	Andrew
5	Steven	Andrew
6	Michael	Steven
7	Robert	Steven
8	Laura	Andrew
9	Anne	Steven
*/

-- 6) List all customers who have placed at least one order:
SELECT customer_id, company_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Output:
/*
# customer_id	company_name
ALFKI	Alfreds Futterkiste
ANATR	Ana Trujillo Emparedados y helados
ANTON	Antonio Moreno Taquería
AROUT	Around the Horn
BSBEV	B's Beverages
BERGS	Berglunds snabbköp
BLAUS	Blauer See Delikatessen
BLONP	Blondesddsl père et fils
*/

-- 7) List customers who have never placed an order:
SELECT customer_id, company_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Output:
/*
# customer_id	company_name
FISSA	FISSA Fabrica Inter. Salchichas S.A.
PARIS	Paris spécialités
*/

/*
The UNION operator is used to combine the result-set of two or more SELECT statements,
    Rules:
        1) Every SELECT statement within UNION must have the same number of columns
        2) The columns must also have similar data types
        3) The columns in every SELECT statement must also be in the same order

1) UNION: The UNION operator selects only distinct values by default.
2) UNION ALL: The UNION ALL operator selects duplicate values also.
*/

-- 1) UNION:
-- List all distinct company names from both customers and suppliers:

SELECT company_name FROM customers
UNION
SELECT company_name FROM suppliers;


-- Output
/*
# company_name
Alfreds Futterkiste
Ana Trujillo Emparedados y helados
Antonio Moreno Taquería
Around the Horn
Berglunds snabbköp
Blauer See Delikatessen
Blondesddsl père et fils
Bólido Comidas preparadas
Bon app'
Bottom-Dollar Markets
B's Beverages
Cactus Comidas para llevar
Centro comercial Moctezuma
Chop-suey Chinese
Comércio Mineiro
Consolidated Holdings
Drachenblut Delikatessen
Du monde entier
Eastern Connection
Ernst Handel
*/

-- 2) UNION ALL:
-- List all company names from both customers and suppliers, including duplicates:

SELECT company_name FROM customers
UNION ALL
SELECT company_name FROM suppliers;

-- Output:
/*
# company_name
Alfreds Futterkiste
Ana Trujillo Emparedados y helados
Antonio Moreno Taquería
Around the Horn
Berglunds snabbköp
Blauer See Delikatessen
Blondesddsl père et fils
Bólido Comidas preparadas
Bon app'
Bottom-Dollar Markets
B's Beverages
Cactus Comidas para llevar
Centro comercial Moctezuma
Around the Horn
Berglunds snabbköp
Blauer See Delikatessen
Blondesddsl père et fils
*/