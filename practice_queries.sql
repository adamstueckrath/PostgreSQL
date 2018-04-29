/* BASIC SYNTAX */
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

/* GROUP BY, HAVING, ORDER BY*/

/* 
HAVING Syntax 
SELECT column_1, aggregate_function(column_2)
FROM table_name
GROUP BY column_1
HAVING condition;

The HAVING clause sets the condition for group rows created by the GROUP BY Clause after the GROUP BY clause applies while the WHERE clause sets the condition for individual rows before GROUP BY clause applies.
This is the main difference between the HAVING and WHERE clauses.
*/
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

/* LIKE */
select COUNT(title)
from film
where title like 'J%';

select customer_id, first_name, last_name
from customer
where first_name like 'E%' and address_id <500
order by customer_id desc
limit 1;

/* JOIN */
SELECT film.film_id, film.title, inventory.inventory_id
FROM film 
LEFT JOIN inventory on inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL;

/* EXTRACT */
SELECT extract(month from payment_date) as month
FROM payment;

SELECT SUM(amount), extract(month from payment_date) as month
FROM payment
GROUP BY month
ORDER BY SUM(amount) DESC;


/* ASSESSMENT 2 */
/* 1. How can you retrieve all the information from the cd.facilities table? */
SELECT * 
FROM cd.facilities;

/* 2. You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs? */
SELECT name, membercost, guestcost
FROM cd.facilities;

/* 3. How can you produce a list of facilities that charge a fee to members? */
SELECT name, membercost
FROM cd.facilities
WHERE membercost >0;

/* 4. How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question. */
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
where membercost < (monthlymaintenance*1/50) AND membercost > 0;

/* 5. How can you produce a list of all facilities with the word 'Tennis' in their name? */
SELECT name 
FROM cd.facilities
WHERE name LIKE '%Tennis%';

/* 6. How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator. */
SELECT facid, name 
FROM cd.facilities
WHERE facid BETWEEN 1 AND 5;

/* 7. How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question. */
SELECT memid, surname, firstname, joindate 
FROM cd.members
WHERE joindate > '2012-09-01';


/* 8. How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates. */
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname
LIMIT 10;

/* 9. You'd like to get the signup date of your last member. How can you retrieve this information? */
SELECT memid, surname, firstname, joindate 
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

/* 10. Produce a count of the number of facilities that have a cost to guests of 10 or more.*/
SELECT COUNT(name) 
FROM cd.facilities 
WHERE guestcost > 10;

/* 11. Skip this one, no question for #11.*/
/* 12. Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots. */
SELECT f.name, SUM(b.slots)
FROM cd.bookings as b 
JOIN cd.facilities as f on f.facid = b.facid
WHERE b.starttime BETWEEN '2012-09-01' AND '2012-09-30'
GROUP BY f.name
ORDER BY SUM(b.slots) DESC;

/* 13. Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id. */
SELECT f.facid, SUM(b.slots)
FROM cd.bookings as b 
JOIN cd.facilities as f on f.facid = b.facid
GROUP BY f.facid
HAVING SUM(b.slots) > 1000
ORDER BY facid DESC; 

/* 14. How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time. */
SELECT b.starttime, f.name
FROM cd.bookings as b 
JOIN cd.facilities as f on f.facid = b.facid
WHERE f.name LIKE 'Tennis Court%' AND date(b.starttime) = '2012-09-21'
ORDER BY b.starttime;

/* 15. How can you produce a list of the start times for bookings by members named 'David Farrell'? */
SELECT b.starttime, TRIM(CONCAT(m.firstname, ' ', m.surname))
FROM cd.bookings as b 
JOIN cd.members as m on m.memid = b.memid
where TRIM(CONCAT(m.firstname, ' ', m.surname)) like 'David Farrell';































