use sakila;
select * from actor;
select actor_id, first_name, last_name from actor where first_name="Joe";

select * from address;
select address,district,city_id from address where 
district="California" or
district="Alberta" or
district="Mekka" ;

select * from payment;
SELECT customer_id, SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id;

select * from actor;
INSERT INTO actor (first_name, last_name)
VALUES
    ('ADAM', 'DAVIS'),
    ('JEREMY', 'DAVIS'),
    ('CRAIG', 'DAVIS'),
    ('STEVE', 'DAVIS');
   
   SELECT COUNT(*) as num_actors
FROM actor
WHERE last_name = 'DAVIS';

SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(*) AS num_films
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY num_films DESC
LIMIT 10;

SELECT title, description, length, rating
FROM film
WHERE special_features LIKE '%Deleted Scenes%' AND special_features LIKE '%Behind the Scenes%'
ORDER BY length DESC;

SELECT * FROM film;

SELECT country.country, COUNT(*) AS inactive_customers
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE customer.active = 0
GROUP BY country.country
ORDER BY inactive_customers DESC;



    