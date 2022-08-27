-- Assignment 3: Views, Stored Procedure, and Trigger

-- Q1
CREATE TABLE TotalSalesByCustomer(
	customer_id INT,
	total_purch_amt DECIMAL(6,2)
);
INSERT INTO TotalSalesByCustomer(customer_id, total_purch_amt)
SELECT DISTINCT(customer_id), SUM(purch_amt)
FROM  orders 
GROUP BY customer_id;

SELECT * FROM TotalSalesByCustomer;

-- Q2
DROP TRIGGER IF EXISTS tr_OrderTbl
GO
CREATE TRIGGER tr_OrderTbl
ON Orders
AFTER INSERT
AS
UPDATE TotalSalesByCustomer
SET total_purch_amt = total_purch_amt + 
	(SELECT SUM(purch_amt) 
	 FROM inserted
	 WHERE TotalSalesByCustomer.customer_id = inserted.customer_id)
WHERE TotalSalesByCustomer.Customer_id IN (SELECT inserted.customer_id FROM inserted);

-- Q3
DROP PROCEDURE IF EXISTS pr_CustomerHasTwoOrMoreOrders
GO
CREATE PROCEDURE pr_CustomerHasTwoOrMoreOrders
AS
	SELECT DISTINCT o.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
	FROM orders o 
	JOIN customer c
	ON o.customer_id = c.customer_id
	GROUP BY o.customer_id,  c.cust_name, c.city,c.city,c.grade,c.salesman_id
	HAVING COUNT(order_no) >=2;
-- To execute procedure
EXEC pr_CustomerHasTwoOrMoreOrders;

-- Q4
DROP PROCEDURE IF EXISTS pr_OrderAndCustomer
GO
CREATE PROCEDURE pr_OrderAndCustomer (@order_id INT)
AS
SELECT c.customer_id, cust_name, city, grade, order_no, purch_amt ,ord_date, c.salesman_id
FROM orders o 
JOIN customer c
ON o.customer_id = c.customer_id
WHERE o.order_no = @order_id;
--To execute procedure
EXEC pr_OrderAndCustomer @order_id = 70007;

-- Q5
DROP FUNCTION IF EXISTS fn_ACustomerName
GO
CREATE FUNCTION fn_ACustomerName(@customer_id INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @customer_name NVARCHAR(MAX)
	SELECT @customer_name  = cust_name
	FROM customer
	WHERE customer_id = @customer_id
	IF(@customer_name  IS NULL)
	SET @customer_name  = 'Customer name does not exist'
	RETURN @customer_name 
END
--To execute function 
SELECT customer_id, dbo.fn_ACustomerName(customer_id) AS Customer_Name
FROM customer
WHERE customer_id = 3003;
