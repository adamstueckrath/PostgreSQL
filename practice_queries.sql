SELECT first_name, last_name
FROM customer
WHERE first_name ILIKE '_her%';

SELECT COUNT(payment_id)
FROM payment
WHERE amount > 5;

SELECT COUNT(*)
FROM actor
WHERE first_name LIKE 'P%';

SELECT COUNT(DISTINCT(district))
FROM address;

SELECT DISTINCT(district)
FROM address;

SELECT COUNT(*)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';

SELECT customer_id, ROUND(SUM(amount),2)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;

SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;

select COUNT(title)
from film
where title like 'J%';

select customer_id, first_name, last_name
from customer
where first_name like 'E%' and address_id <500
order by customer_id desc
limit 1;
