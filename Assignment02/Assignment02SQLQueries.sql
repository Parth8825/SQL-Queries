--JOINS
-- Q14
SELECT name AS salesman_name,
cust_name, c.city 
FROM salesman s,customer c 
WHERE s.city=c.city;

-- Q15
SELECT order_no, purch_amt, cust_name, city
FROM orders o
JOIN customer c
ON o.customer_id = c.customer_id
WHERE purch_amt BETWEEN 500 AND 2000;

-- Q16
SELECT name AS salesman_name, cust_name 
FROM customer c 
JOIN salesman s 
ON c.salesman_id = s.salesman_id;

-- Q17
SELECT cust_name
FROM customer c
JOIN salesman s
ON c.salesman_id = s.salesman_id
WHERE (commission * 100) > 12;

-- Q18
SELECT cust_name,grade, 
name AS salesman_name 
FROM customer c 
JOIN salesman s 
ON c.salesman_id=s.salesman_id 
WHERE grade<300 
ORDER BY customer_id;

-- Q19
SELECT *
FROM customer
WHERE grade > 100;

-- Q20
SELECT *
FROM customer
WHERE city = 'New York' AND grade > 100;

-- Q21
SELECT *
FROM customer
WHERE city = 'New York' OR grade > 100;

-- Q22
SELECT * 
FROM  orders 
WHERE (NOT ord_date = '2012-09-10' AND salesman_id <= 5005) OR purch_amt <= 1000.00;

-- Q23
SELECT * 
FROM  orders 
WHERE ord_date = '2012-08-17' OR (customer_id > 3005 AND purch_amt < 1000);

--AGGREGATE
-- Q24
SELECT SUM(purch_amt) 
FROM orders;

-- Q25
SELECT AVG(purch_amt) 
FROM orders;

-- Q26
SELECT COUNT(DISTINCT salesman_id) 
FROM customer;

-- Q27
SELECT COUNT(*) 
FROM customer;

-- Q28
SELECT MAX(purch_amt)
FROM orders;

-- Q29
SELECT MIN(purch_amt)
FROM orders;

-- Q30
SELECT customer_id, MAX(purch_amt) AS highest_purchase_amount
FROM orders 
GROUP BY customer_id
ORDER BY MAX(purch_amt) DESC;

-- Q31
SELECT customer_id,ord_date,MAX(purch_amt) AS highest_purchase_amount
FROM orders 
GROUP BY customer_id,ord_date 
HAVING MAX(purch_amt) BETWEEN 2000 AND 6000;

-- Q32
SELECT ord_date,salesman_id,COUNT(*) AS numberOfSalesman 
FROM orders 
GROUP BY ord_date,salesman_id;

-- Q33
SELECT * 
FROM orders 
ORDER BY order_no;

-- Q34
SELECT * 
FROM orders 
ORDER BY ord_date DESC;

-- Q35
SELECT * 
FROM orders 
ORDER BY ord_date, purch_amt DESC;