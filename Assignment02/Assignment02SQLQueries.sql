--JOINS --
-- Q14 Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city. 

SELECT name AS salesman_name,
cust_name, c.city 
FROM salesman s,customer c 
WHERE s.city=c.city;

-- Q15 Write a SQL statement to make a list with order no, purchase amount, customer name and their cities for those orders which order amount between 500 and 2000

SELECT order_no, purch_amt, cust_name, city
FROM orders o
JOIN customer c
ON o.customer_id = c.customer_id
WHERE purch_amt BETWEEN 500 AND 2000;

-- Q16 Write a SQL statement to know which salesman are working for which customer(all cust with salman)

SELECT name AS salesman_name, cust_name 
FROM customer c 
JOIN salesman s 
ON c.salesman_id = s.salesman_id;

-- Q17 Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%

SELECT cust_name
FROM customer c
JOIN salesman s
ON c.salesman_id = s.salesman_id
WHERE (commission * 100) > 12;

-- Q18 Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own.

SELECT cust_name,grade, 
name AS salesman_name 
FROM customer c 
JOIN salesman s 
ON c.salesman_id=s.salesman_id 
WHERE grade<300 
ORDER BY customer_id;

-- Q19 Write a query to display all customers with a grade above 100

SELECT *
FROM Inventory.dbo.customer
WHERE grade > 100;

-- Q20 Write a query statement to display all customers in New York who have a grade value above 100.  

SELECT *
FROM Inventory.dbo.customer
WHERE city = 'New York' AND grade > 100;

-- Q21  Write a SQL statement to display all customers, who are either belongs to the city New York or had a grade above 100.

SELECT *
FROM Inventory.dbo.customer
WHERE city = 'New York' OR grade > 100;

-- Q22 Write a SQL statement to display either those orders which are not issued on date 2012-09-10 and issued by the salesman whose ID is 505 and below or those orders which purchase amount is 1000.00 and below.

SELECT * 
FROM  Inventory.dbo.orders 
WHERE (NOT ord_date = '2012-09-10' AND salesman_id <= 5005) OR purch_amt <= 1000.00;

-- Q23  Display all in reverse, where order dates are 2012-08-17 or customer id greater than 3005 and purchase amount is below 1000.

SELECT * 
FROM  Inventory.dbo.orders 
WHERE ord_date = '2012-08-17' OR (customer_id > 3005 AND purch_amt < 1000);

--AGGREGATE --
-- Q24 Write a SQL statement to find the total purchase amount of all orders

SELECT SUM(purch_amt) 
FROM Inventory.dbo.orders;

-- Q25 Write a SQL statement to find the average purchase amount of all orders

SELECT AVG(purch_amt) 
FROM Inventory.dbo.orders;

-- Q26 Write a SQL statement to find the number of salesmen currently listing for all of their customers

SELECT COUNT(DISTINCT salesman_id) 
FROM Inventory.dbo.customer;

-- Q27 Write a SQL statement know how many customer have listed their names

SELECT COUNT(*) 
FROM Inventory.dbo.customer;

-- Q28 Write a SQL statement to get the maximum purchase amount of all the orders

SELECT MAX(purch_amt)
FROM Inventory.dbo.orders;

-- Q29  Write a SQL statement to get the minimum purchase amount of all the orders

SELECT MIN(purch_amt)
FROM Inventory.dbo.orders;

-- Q30 Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount

SELECT customer_id, MAX(purch_amt) AS highest_purchase_amount
FROM Inventory.dbo.orders 
GROUP BY customer_id
ORDER BY MAX(purch_amt) DESC;

-- Q31 Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher purchase amount in a day is within the range 2000 and 6000.

SELECT customer_id,ord_date,MAX(purch_amt) AS highest_purchase_amount
FROM Inventory.dbo.orders 
GROUP BY customer_id,ord_date 
HAVING MAX(purch_amt) BETWEEN 2000 AND 6000;

-- Q32 Write a query that counts the number of salesmen with their order date and ID registering orders for each day.

SELECT ord_date,salesman_id,COUNT(*) AS numberOfSalesman 
FROM Inventory.dbo.orders 
GROUP BY ord_date,salesman_id;

-- Q33 Write a query to display the orders according to the order number arranged by ascending order. 

SELECT * 
FROM Inventory.dbo.orders 
ORDER BY order_no;

-- Q34 Write a SQL statement to arrange the orders according to the order date in such a manner that the latest date will come first then previous dates

SELECT * 
FROM Inventory.dbo.orders 
ORDER BY ord_date DESC;

-- Q35 Write a SQL statement to display the orders with all information in such a manner that, the older order date will come first and the highest purchase amount of same day will come first

SELECT * 
FROM Inventory.dbo.orders 
ORDER BY ord_date, purch_amt DESC;

-- VIEW --
-- Q36 Create a view that has following information, customer_id, cust_name, city, grade, salesman_id, salesman_name, Commission, Ord_no, purch_amt and ord_date

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
-- Q37 Create a Procedure to display the order information with the customer details to each order

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

-- Q38 Create a parameterised stored procedure which will take the customer_id as variable and will return all the information about that customer including salesman detail associate with that customer

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

-- Q39 Create a stored procedure that will return all the information about customer.

DROP PROCEDURE IF EXISTS SP_CustomerInfo
GO
CREATE PROCEDURE SP_CustomerInfo
AS
	SELECT *
	FROM customer;
-- To Execute Stored Procedure
EXEC SP_CustomerInfo;

-- Q40 Create a stored procedure that will accept 1 parameter which is for salesmanid and display all the records for that salesman

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

-- Q41 Create Stored procedure that will accept 2 parameter, first City and second customerid. Update the table with provided value as city for the provided customer id in table

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
-- Q42 Display only Year from orderdate from Order table

SELECT YEAR(ord_date) AS YearsOnly
FROM orders;

-- Q43 Display order date in DDMMYYYY formate in order table

SELECT FORMAT (ord_date, 'dd-MM-yy') as ord_date
FROM orders;

-- Q44 Display only order that were made in January month only

SELECT *
FROM orders
WHERE MONTH(ord_date) = '01';

-- Q45 Display Order that were made between 15 to 30th date of any month from order table

SELECT *
FROM orders
WHERE DAY(ord_date) BETWEEN '15' AND '30';

-- USER DEFINED FUNCTION --
-- Q46 Create Userdefined function which takes customerid as input and gives us total amount that customer spent in orders.

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

-- Q47 Create userdefined function which takes salesmanid as input and returns how much commission he is getting.

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

-- Q48 create userdefined function which takes orderid as input and returns who placed this order.

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
