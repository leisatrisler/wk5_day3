select *
from actor;

select *
from film;

select *
from film_actor;

-- Join the actor table to the film_actor via the actor_id
select *
from actor a
join film_actor fa 
on a.actor_id = fa.actor_id;

-- Join the film table to the film_actor via the film_id
select *
from film_actor fa 
join film f
on f.film_id = fa.film_id;

-- Multi Join 
select f.title, f.release_year, f.film_id, fa.film_id, a.actor_id, a.first_name, a.last_name
from film_actor fa 
join actor a 
on fa.actor_id = a.actor_id 
join film f
on fa.film_id = f.film_id;

select a.first_name, a.last_name, MAX(f.release_year)
from film_actor fa 
join actor a 
on fa.actor_id = a.actor_id 
join film f
on fa.film_id = f.film_id
group by a.first_name, a.last_name;

-- Display customer name and film they rented -- customer -> rental -> inventory -> film
select *
from rental;

SELECT r.rental_id, r.rental_date, r.customer_id, c.customer_id, c.first_name, c.last_name, r.inventory_id, i.inventory_id, i.film_id, f.film_id, f.title
FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id 
JOIN inventory i 
ON i.inventory_id = r.inventory_id 
JOIN film f
ON i.film_id = f.film_id;

select *
from inventory;

-- SUBQUERIES!!!
-- Subqueries are queries that happen within another query

-- Ex. Which films have exactly 12 actors in them ?

-- Step 1. Get the ID's of the films that have exactly 12 actors

select film_id, COUNT(*)
from film_actor
group by film_id
having COUNT(*) = 12;

--film_id|count|
---------+-----+
--    529|   12|
--    802|   12|
--     34|   12|
--    892|   12|
--    414|   12|
--    517|   12|

-- Step 2. Get the films from the film table that have those IDs
select *
from film 
where film_id in (
	529,
	802,
	34,
	892,
	414,
	517
);

-- Create a subquery: Combine the two steps into one query. The query that you want to execute FIRST
-- is the subquery. ** Subquery must return only ONE column ** *unless used in a FROM clause 

SELECT *
FROM film 
WHERE film_id IN (
	SELECT film_id
	FROM film_actor
	GROUP BY film_id
	HAVING COUNT(*) = 12
);

-- What employee sold the most rentals (use the rental table)
select *
from staff 
where staff_id = (
	select staff_id
	from rental 
	group by staff_id
	order by COUNT(*) desc 
	limit 1
);

-- Show the employee and the number of rentals
select first_name, last_name, COUNT(*)
from staff
join rental
on staff.staff_id = rental.staff_id 
group by first_name, last_name
order by COUNT(*)
limit 1;

-- Use subqueries for calculations
-- List out all of the payments that are more than the average payment amount
select *
from payment 
where amount > (
	select AVG(amount) 
	from payment
);

-- Subqueries with the FROM clause
-- *Subquery in FROM must have an alias*

-- Find the aaverage number of rentals per customer.

-- Step 1. Get the count of customer rentals
select customer_id, COUNT(*) as num_rentals
from rental
group by customer_id;

-- Step2. Use the temp table from step 1 as a subquery to query from
select AVG(num_rentals)
from (
	select customer_id, COUNT(*) as num_rentals
	from rental 
	group by customer_id
) as customer_rental_totals;



-- Setup for Example - Add loyalty_member column to customer table
alter table customer 
add column loyalty_member BOOLEAN;

update customer 
set loyalty_number = false;

-- Using subqueries in DML Statements

-- Update all customers who have made 25 or more rentals to be a loyalty member 

-- Step 1. Find all customer ids of the customers who have made 25 or more rentals
select customer_id, COUNT(*)
from rental 
group by customer_id
having COUNT(*) >= 25;


-- Step 2. Update the customer table by setting loyalty member = true if a customer is in the above subquery result 
update customer 
set loyalty_member = true 
where customer_id in (
	select customer_id
	from rental 
	group by customer_id
	having count(*) >= 25
);

-- Confirm update loyalty member status
select *



-- Multi Query

-- customers who have rented more than average
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM rental 
	GROUP BY customer_id 
	HAVING COUNT(*) > (
		SELECT AVG(num_rentals)
		FROM (
			SELECT customer_id, COUNT(*) AS num_rentals
			FROM rental
			GROUP BY customer_id
		) AS customer_rental_totals
	)
);

where scustomer_id
from rental r
join customer c 
on c.customer_id = r.customer_id 
group by c.first_name, c.last_name
having count(*) > (
	select avg(num_rentals)
	from (
		select customer_id, COUNT(*) as num_rentals
		from rental 
		group by customer_id
	) as customer_rental_totals
)
















