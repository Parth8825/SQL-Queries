/* Q5. Update customer table to add column Called "Country". */
ALTER TABLE customer
ADD country VARCHAR(255);

/* Q6. Insert the values of country to the newly addded column in the customer table */
UPDATE customer SET country = 'UK' where customer_id = 3001;
UPDATE customer SET country = 'USA' where customer_id = 3002;
UPDATE customer SET country = 'Russia' where customer_id = 3003;
UPDATE customer SET country = 'France' where customer_id = 3004;
UPDATE customer SET country = 'USA' where customer_id = 3005;
UPDATE customer SET country = 'USA' where customer_id = 3007;
UPDATE customer SET country = 'UK' where customer_id = 3008;
UPDATE customer SET country = 'Germany' where customer_id = 3009;

/* Q7. Write a sql statement to display all the information of all salesman */
SELECT * FROM Inventory.dbo.salesman;

/* Q8. Write a sql statement to display specific columns like name and commission for all the salesmen */
SELECT name, commission
FROM Inventory.dbo.salesman;

/* Q9. Write a sql statement to display all the information of customer who lives in USA. */
SELECT * FROM Inventory.dbo.customer
WHERE country = 'USA';

/* Q10. Write a sql statement to display all the information of those customers with a grade of 200. */
SELECT * FROM Inventory.dbo.customer
WHERE grade = 200;

/* Q11. write a sql statement to display information of salesman whose commission is greater than 0.12 */
SELECT * FROM Inventory.dbo.salesman
WHERE commission > 0.12;

/* Q12. write a sql statement to display order information where purchase amount is below 2000 */
SELECT * FROM Inventory.dbo.orders
WHERE purch_amt < 2000;

/* Q13. Update customer table to remove the column called Country. */
ALTER TABLE Inventory.dbo.customer DROP COLUMN country;
