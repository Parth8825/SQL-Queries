/* Q1. */
CREATE DATABASE Inventory;

/* Q2. */
CREATE TABLE salesman (
	salesman_id INT PRIMARY KEY,
	name VARCHAR(255),
	city VARCHAR(255),
	commission DECIMAL(3,2)
);

/* Q3. */
CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
	cust_name VARCHAR(255),
	city VARCHAR(255),
	grade INT,
	salesman_id INT FOREIGN KEY REFERENCES salesman(salesman_id)
);

/* Q4. */
CREATE TABLE orders(
	order_no INT PRIMARY KEY,
	purch_amt DECIMAL(6,2),
	ord_date DATE,
	customer_id INT FOREIGN KEY REFERENCES customer(customer_id),
	salesman_id INT FOREIGN KEY REFERENCES salesman(salesman_id)
);	
