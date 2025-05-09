/*
MySQL Window Functions are advanced SQL capabilities that enable expensive calculations across sets of rows related to the current row.
Unlike aggregate functions which return a single value for a group of rows, window functions return a result for each row in the result set
These functions are highly useful for tasks such as ranking, calculating running totals, and finding moving averages while still retaining individual row details.
*/

-- 1) ROW_NUMBER() - This function is used to assigns a unique sequential integer to rows within a partition.
SELECT 
    customer_id,
    order_id,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
FROM orders;

-- Output:
/*
# customer_id	order_id	row_num
ALFKI	10643	1
ALFKI	10692	2
ALFKI	10702	3
ALFKI	10835	4
ALFKI	10952	5
ALFKI	11011	6
ANATR	10308	1
ANATR	10625	2
ANATR	10759	3
ANATR	10926	4
ANTON	10365	1
ANTON	10507	2
ANTON	10535	3
ANTON	10573	4
ANTON	10677	5
ANTON	10682	6
ANTON	10856	7
AROUT	10355	1
AROUT	10383	2
AROUT	10453	3
AROUT	10558	4
AROUT	10707	5
AROUT	10741	6
*/

-- 2) RANK() and DENSE_RANK() - The use of this function to leave gaps in the ranking when they are ties and also assigns a ranking within a partition.

SELECT 
    customer_id,
    order_id,
    freight,
    RANK() OVER (PARTITION BY customer_id ORDER BY freight DESC) AS rank_freight,
    DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY freight DESC) AS dense_rank_freight
FROM orders;

-- Output:
/*
# customer_id	order_id	freight	rank_freight	dense_rank_freight
ALFKI	10835	69.53	1	1
ALFKI	10692	61.02	2	2
ALFKI	10952	40.42	3	3
ALFKI	10643	29.46	4	4
ALFKI	10702	23.94	5	5
ALFKI	11011	1.21	6	6
*/

-- 3) FIRST_VALUE() and LAST_VALUE()
SELECT 
    customer_id,
    order_id,
    order_date,
    FIRST_VALUE(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS first_order_date,
    LAST_VALUE(order_date) OVER (PARTITION BY customer_id ORDER BY order_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_order_date
FROM orders;

-- Output:
/*
# customer_id	order_id	order_date	first_order_date	last_order_date
ALFKI	10702	1997-10-13	1997-08-25	1998-04-09
ALFKI	10835	1998-01-15	1997-08-25	1998-04-09
ALFKI	10952	1998-03-16	1997-08-25	1998-04-09
ALFKI	11011	1998-04-09	1997-08-25	1998-04-09
ANATR	10308	1996-09-18	1996-09-18	1998-03-04
ANATR	10625	1997-08-08	1996-09-18	1998-03-04
ANATR	10759	1997-11-28	1996-09-18	1998-03-04
*/

-- 4) NTH_VALUE()
-- Get the 2nd order date for each customer:
SELECT 
    customer_id,
    order_id,
    order_date,
    NTH_VALUE(order_date, 2) OVER (PARTITION BY customer_id ORDER BY order_date) AS second_order_date
FROM orders;

-- Output:
/*
# customer_id	order_id	order_date	second_order_date
ALFKI	10643	1997-08-25	
ALFKI	10692	1997-10-03	1997-10-03
ALFKI	10702	1997-10-13	1997-10-03
ALFKI	10835	1998-01-15	1997-10-03
ALFKI	10952	1998-03-16	1997-10-03
ALFKI	11011	1998-04-09	1997-10-03
ANATR	10308	1996-09-18	
ANATR	10625	1997-08-08	1997-08-08
*/


-- 5) LEAD() and LAG():
-- Compare current and next order date:
SELECT 
    customer_id,
    order_id,
    order_date,
    LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_order_date,
    LEAD(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_date
FROM orders;

-- Output:
/*
# customer_id	order_id	order_date	prev_order_date	next_order_date
ALFKI	10643	1997-08-25		1997-10-03
ALFKI	10692	1997-10-03	1997-08-25	1997-10-13
ALFKI	10702	1997-10-13	1997-10-03	1998-01-15
ALFKI	10835	1998-01-15	1997-10-13	1998-03-16
ALFKI	10952	1998-03-16	1998-01-15	1998-04-09
ALFKI	11011	1998-04-09	1998-03-16	
ANATR	10308	1996-09-18		1997-08-08
*/

-- 6) NTILE(n) - Divide rows into n roughly equal groups:
SELECT 
    customer_id,
    order_id,
    order_date,
    NTILE(4) OVER (PARTITION BY customer_id ORDER BY order_date) AS quartile
FROM orders;

-- Output:
/*
# customer_id	order_id	order_date	quartile
ALFKI	10643	1997-08-25	1
ALFKI	10692	1997-10-03	1
ALFKI	10702	1997-10-13	2
ALFKI	10835	1998-01-15	2
ALFKI	10952	1998-03-16	3
ALFKI	11011	1998-04-09	4
*/

-- All at once:
/*
Rank their orders by date.

Calculate how many orders they've placed.

Show the first and last order date.

Show the previous and next order.

Identify their most expensive order.
*/

SELECT 
    customer_id,
    order_id,
    order_date,
    freight,

    -- Ranking by order date
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_sequence,

    -- Total number of orders per customer
    COUNT(*) OVER (PARTITION BY customer_id) AS total_orders,

    -- Running total of freight
    SUM(freight) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_freight,

    -- First and last order date
    FIRST_VALUE(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS first_order_date,
    LAST_VALUE(order_date) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_order_date,

    -- Previous and next orders
    LAG(order_id) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_id,
    LEAD(order_id) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_id,

    -- Highest freight (most expensive order)
    MAX(freight) OVER (PARTITION BY customer_id) AS max_freight

FROM orders
ORDER BY customer_id, order_date;

-- Output:
/*
# customer_id	order_id	order_date	freight	order_sequence	total_orders	running_freight	first_order_date	last_order_date	previous_order_id	next_order_id	max_freight
ALFKI	10643	1997-08-25	29.46	1	6	29.46	1997-08-25	1998-04-09		10692	69.53
ALFKI	10692	1997-10-03	61.02	2	6	90.48	1997-08-25	1998-04-09	10643	10702	69.53
ALFKI	10702	1997-10-13	23.94	3	6	114.42	1997-08-25	1998-04-09	10692	10835	69.53
ALFKI	10835	1998-01-15	69.53	4	6	183.95	1997-08-25	1998-04-09	10702	10952	69.53
ALFKI	10952	1998-03-16	40.42	5	6	224.37	1997-08-25	1998-04-09	10835	11011	69.53
ALFKI	11011	1998-04-09	1.21	6	6	225.58	1997-08-25	1998-04-09	10952		69.53
ANATR	10308	1996-09-18	1.61	1	4	1.61	1996-09-18	1998-03-04		10625	43.90
ANATR	10625	1997-08-08	43.90	2	4	45.51	1996-09-18	1998-03-04	10308	10759	43.90
*/