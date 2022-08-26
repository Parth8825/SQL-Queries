--JOINS --
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

--AGGREGATE --
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

-- VIEW --
-- Q36
DROP VIEW IF EXISTS displayAllInfo
GO
CREATE VIEW displayAllInfo AS
SELECT c.customer_id, cust_name, c.city, grade, 
	c.salesman_id, name AS salesman_name, commission, 
	order_no, purch_amt, ord_date 
FROM (customer c
	  JOIN orders o
	  ON c.customer_id = o.customer_id)
JOIN salesman s
ON c.salesman_id = s.salesman_id;

-- STORED PROCEDURE
-- Q37
DROP PROCEDURE IF EXISTS SP_OrderInfoWithCustomer
GO
CREATE PROCEDURE SP_OrderInfoWithCustomer
AS
SELECT c.customer_id, 
	   c.cust_name, 
	   c.city, 
	   c.grade,
	   o.order_no, 
	   o.purch_amt, 
	   o.ord_date
FROM customer AS c 
JOIN orders AS o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;
-- To Execute Stored Procedure
EXEC SP_OrderInfoWithCustomer;

-- Q38
DROP PROCEDURE IF EXISTS SP_CustomerInfoWithSalesman
GO
CREATE PROCEDURE SP_CustomerInfoWithSalesman
			@CustomerId INT
AS
SELECT c.customer_id,
	   c.cust_name, 
	   c.city, 
	   c.grade ,
	   s.name AS salesman_name, 
	   s.city, 
	   s.commission
FROM customer AS c 
JOIN salesman AS s
ON c.salesman_id = s.salesman_id
WHERE @CustomerId = c.customer_id;
-- To Execute Stored Procedure
EXEC SP_CustomerInfoWithSalesman @CustomerId = 3005;

-- Q39
DROP PROCEDURE IF EXISTS SP_CustomerInfo
GO
CREATE PROCEDURE SP_CustomerInfo
AS
	SELECT *
	FROM customer;
-- To Execute Stored Procedure
EXEC SP_CustomerInfo;

-- Q40
DROP PROCEDURE IF EXISTS SP_SalesmanInfo
GO
CREATE PROCEDURE SP_SalesmanInfo
			@SalesmanId INT
AS
SELECT *
FROM salesman 
WHERE @SalesmanId = salesman_id;
-- To Execute Stored Procedure
EXEC SP_SalesmanInfo @SalesmanId = 5005;

-- Q41
DROP PROCEDURE IF EXISTS SP_ChangeCityFromCustomer
GO
CREATE PROCEDURE SP_ChangeCityFromCustomer
			   	 @City VARCHAR(255),
				 @CustomerId INT
AS
	UPDATE customer
	SET city = @City
	WHERE customer.customer_id = @CustomerID;
-- To execute stored procedure
EXEC SP_ChangeCityFromCustomer @City = 'Paris', @CustomerID = 3001;

-- DATE FUNCTION --
-- Q42
SELECT YEAR(ord_date) AS YearsOnly
FROM orders;

-- Q43
SELECT FORMAT (ord_date, 'dd-MM-yy') as ord_date
FROM orders;

-- Q44
SELECT *
FROM orders
WHERE MONTH(ord_date) = '01';

-- Q45
SELECT *
FROM orders
WHERE DAY(ord_date) BETWEEN '15' AND '30';

-- USER DEFINED FUNCTION --
-- Q46
DROP FUNCTION IF EXISTS fn_CustomerTotalAmount
GO
CREATE FUNCTION fn_CustomerTotalAmount (@CustomerId INT)
RETURNS INT
AS 
BEGIN
	DECLARE @TotalAmount INT;
	SELECT @TotalAmount = SUM(purch_amt) 
	FROM orders
	WHERE customer_id = @CustomerId;
	RETURN @TotalAmount;
END
-- To Execute Function
SELECT dbo.fn_CustomerTotalAmount(3001) AS 'Total Amount' FROM orders;
-- Q47
DROP FUNCTION IF EXISTS fn_SalesmanTotalCommission
GO
CREATE FUNCTION fn_SalesmanTotalCommission (@SalesmanId INT)
RETURNS DECIMAL(3,2)
AS
	BEGIN 
	DECLARE @Commission DECIMAL(3,2);
	SELECT @Commission = commission
	FROM salesman
	WHERE salesman_id = @SalesmanId
	RETURN @Commission
END
-- To Execute Function
SELECT dbo.fn_SalesmanTotalCommission(5001) AS 'Commission' FROM salesman;
-- Q48
DROP FUNCTION IF EXISTS fn_CustomerPlacedOrder 
GO
CREATE FUNCTION fn_CustomerPlacedOrder  (@OrderId INT)
RETURNS TABLE
AS
RETURN
	SELECT c.cust_name, o.purch_amt, o.order_no
	FROM customer c 
	JOIN orders o
	ON c.customer_id = o.customer_id
	WHERE o.order_no = @OrderId;
--To Execute Function
SELECT * FROM fn_CustomerPlacedOrder (70002);