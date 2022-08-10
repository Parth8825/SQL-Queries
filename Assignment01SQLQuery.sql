/* Q1. */
CREATE DATABASE Inventory;

/* Q2. */
CREATE TABLE salesman (
	salesman_id INT PRIMARY KEY,
	name VARCHAR(255),
	city VARCHAR(255),
	commission DECIMAL(3,2)
);
INSERT INTO salesman VAlUES(5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesman VAlUES(5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesman VAlUES(5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesman VAlUES(5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesman VAlUES(5003, 'Lauson Hen', '', 0.12);
INSERT INTO salesman VAlUES(5007, 'Paul Adam', 'Rome', 0.13);

/* Q3. */
CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
	cust_name VARCHAR(255),
	city VARCHAR(255),
	grade INT,
	salesman_id INT FOREIGN KEY REFERENCES salesman(salesman_id)
);
INSERT INTO customer VAlUES(3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customer VAlUES(3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customer VAlUES(3001, 'Brad Guzan', 'London', '', 5005);
INSERT INTO customer VAlUES(3004, 'Fabian Johns', 'Paris', 300, 5006);
INSERT INTO customer VAlUES(3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customer VAlUES(3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO customer VAlUES(3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO customer VAlUES(3003, 'Jozy Altidor', 'Moscow', 200, 5007);

/* Q4. */
CREATE TABLE orders(
	order_no INT PRIMARY KEY,
	purch_amt DECIMAL(6,2),
	ord_date DATE,
	customer_id INT FOREIGN KEY REFERENCES customer(customer_id),
	salesman_id INT FOREIGN KEY REFERENCES salesman(salesman_id)
);	
INSERT INTO orders VAlUES(70001, 150.5, '2012-10-05', 3005, 5002);
INSERT INTO orders VAlUES(70009, 270.65, '2012-09-10', 3001, 5005);
INSERT INTO orders VAlUES(70002, 65.26, '2012-10-05', 3002, 5001);
INSERT INTO orders VAlUES(70004, 110.5, '2012-08-17', 3009, 5003);
INSERT INTO orders VAlUES(70007, 948.5, '2012-09-10', 3005, 5002);
INSERT INTO orders VAlUES(70005, 2400.6, '2012-07-27', 3007, 5001);
INSERT INTO orders VAlUES(70008, 5760, '2012-09-10', 3002, 5001);
INSERT INTO orders VAlUES(70010, 1983.43, '2012-10-10', 3004, 5006);
INSERT INTO orders VAlUES(70003, 2480.4, '2012-10-10', 3009, 5003);
INSERT INTO orders VAlUES(70012, 250.45, '2012-06-27', 3008, 5002);
INSERT INTO orders VAlUES(70011, 75.29, '2012-08-17', 3003, 5007);
INSERT INTO orders VAlUES(70013, 3045.6, '2012-04-25', 3002, 5001);

/* Q5. */
ALTER TABLE customer
ADD country VARCHAR(255);

/* Q6. */
UPDATE customer SET country = 'UK' where customer_id = 3001;
UPDATE customer SET country = 'USA' where customer_id = 3002;
UPDATE customer SET country = 'Russia' where customer_id = 3003;
UPDATE customer SET country = 'France' where customer_id = 3004;
UPDATE customer SET country = 'USA' where customer_id = 3005;
UPDATE customer SET country = 'USA' where customer_id = 3007;
UPDATE customer SET country = 'UK' where customer_id = 3008;
UPDATE customer SET country = 'Germany' where customer_id = 3009;

/* Q7. */
SELECT * FROM salesman;

/* Q8. */
SELECT name, commission
FROM salesman;

/* Q9. */
SELECT * FROM customer
WHERE country = 'USA';

/* Q10. */

/* Q11. */

/* Q12. */

/* Q13. */