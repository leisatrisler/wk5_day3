--Week 5 - Wednesday Questions
--
--1. List all customers who live in Texas (use JOINs)
select c.first_name, c.last_name, a.district as State
from customer c
join address a on a.address_id = c.address_id
where a.district  = 'Texas';

--2. List all payments of more than $7.00 with the customer’s first and last name

select c.first_name, c.last_name, p.amount  
from customer c
join payment p on p.customer_id  = c.customer_id 
where p.amount > 7
order by p.amount asc;

--3. Show all customer names who have made over $175 in payments (use
--subqueries)
select c.first_name, c.last_name, p.total_amount
from customer c
inner join ( 
	select customer_id , sum(amount) as total_amount
	from payment
	group by customer_id 
	having sum(amount) > 175 	
) p on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name, p.total_amount;


--4. List all customers that live in Argentina (use the city table)
select c.first_name, c.last_name, cnt.country 
from customer c
join address a on a.address_id  = c.address_id  
join city ct on ct.city_id = a.city_id 
join country cnt on cnt.country_id  = ct.country_id 
where cnt.country = 'Argentina';


--5. Show all the film categories with their count in descending order
select c.category_id, c.name, count(*) as total
from film_category fc
left join category c on fc.category_id  = c.category_id 
group by c.category_id, c.name
order by total desc;

--6. What film had the most actors in it (show film info)?
select f.title, count(*) as total
from film f
left join film_actor fa on fa.film_id  = f.film_id  
group by f.film_id;

--7. Which actor has been in the least movies?
select a.first_name, a.last_name, count(fa.film_id) as total_movies
from actor a
join film_actor fa on a.actor_id  = fa.actor_id 
group by a.actor_id, a.first_name 
order by total_movies ASC
limit 1;

--8. Which country has the most cities?
select cnt.country, count(c.city) as total_cities
from city c
join country cnt on cnt.country_id  = c.country_id
group by cnt.country 
order by total_cities desc;


--9. List the actors who have been in between 20 and 25 films.
select a.first_name, a.last_name, count(*) as total
from film f
left join film_actor fa on fa.film_id  = f.film_id  
join actor a on a.actor_id  = fa.actor_id 
group by a.actor_id
having count(*) between 20 and 25;


