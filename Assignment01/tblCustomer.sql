/* Assignment 1 */
/* Q1. Create a Database Named "Inventory" */
CREATE DATABASE Inventory;



/* Q3. Create customer table*/
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
