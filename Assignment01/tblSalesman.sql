/* Assignment 1 */
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

