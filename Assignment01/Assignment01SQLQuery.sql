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
SELECT * FROM customer
WHERE grade = 200;

/* Q11. */
SELECT * FROM salesman
WHERE commission > 0.12;

/* Q12. */
SELECT * FROM orders
WHERE purch_amt < 2000;

/* Q13. */
ALTER TABLE customer DROP COLUMN country;