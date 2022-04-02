use orders
-- 1. Write a SQL query to calculate average purchase amount of all orders. Return average purchase amount

select avg(ord_amount)
from orders

-- 2. Write a SQL query to find the highest grade of the customers for each of the city. Return city, maximum grade
select cust_city, max(grade)
from customer
group by cust_city;

-- 3. Write a SQL query to find the lowest commission of agent in city London
select working_area, agent_name, MIN(commission)
from agents
where working_area = 'London'

-- 4. Find all customers that had agents. Select customer name, agent name and agent phone number. 
select c.cust_name, a.AGENT_NAME, a.PHONE_NO
from agents as a
inner join customer as c
on a.agent_code = c. agent_code

-- 5. Write a SQL query (from table orders) to find highest order (purchase) amount by each customer in a particular order date. 
select max(ORD_AMOUNT), ORD_DATE, CUST_CODE
from orders 
group by ORD_DATE, CUST_CODE

-- Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.
select max(ORD_AMOUNT), ORD_DATE, CUST_CODE
from orders 
group by ORD_DATE, CUST_CODE
having max(ORD_AMOUNT) > 2000

-- 6. Write a SQL query to find those orders where order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city
select o.ord_num, o.ord_amount, c.cust_name, c.cust_city
from orders as o
inner join customer as c
on o.cust_code = c.cust_code
where ord_amount BETWEEN 500 AND 2000

-- 7. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order 
-- according to the order date to find that either any of the existing customers have placed no order or placed one or more orders
SELECT c.cust_name, c.cust_city, o.ORD_NUM, o.ORD_DATE,  
o.ORD_AMOUNT AS "Order Amount" 
FROM customer AS c 
LEFT OUTER JOIN orders AS o 
ON c.CUST_CODE = o.CUST_CODE
ORDER BY o.ord_date ASC;

-- 8. From tables customer and orders, write a SQL query to find all the orders issued by the salesman 'Martin'. 
-- Return ord_no, purch_amt, ord_date, customer_id and salesman_id
-- 1 -- ORD_NUM, ORD_AMOUNT, CUST_CODE, CUST_NAME
select * 
from orders
where cust_code = (
select distinct cust_name from customer
where cust_name = 'Martin'
)
-- 2.
select o.ORD_NUM, o.ORD_AMOUNT, c.CUST_CODE, c.CUST_NAME
from orders as o
join customer as c
on o.cust_code = c.cust_code
where c.cust_name = 'Martin'

-- 9. Find average ord_amount by customer country. Show case a list of all customer names, country, their ord_amount 
-- together with average ord_amount by customer country.

WITH average_order_amount AS 
(
select c.CUST_COUNTRY,avg(ORD_AMOUNT) AS average_order_amount
from orders as o
inner join customer as c
on o.cust_code = c.cust_code
group by c.CUST_COUNTRY
)
select 
c.CUST_COUNTRY, 
c.CUST_NAME,
o.ORD_AMOUNT,
av.average_order_amount
from customer as c
inner join average_order_amount as av
on c.CUST_COUNTRY = av.CUST_COUNTRY
inner join orders as o
on c.cust_code = o.cust_code
order by 1