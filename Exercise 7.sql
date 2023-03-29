use sakila;

SELECT country_id, country 
FROM country 
WHERE country IN ('China', 'Bangladesh', 'India');

SELECT * 
FROM actor
WHERE last_name LIKE '%OD%' 
ORDER BY last_name, first_name;

ALTER TABLE actor ADD COLUMN middle_name VARCHAR(50) AFTER first_name;


SELECT last_name, COUNT(*) AS actor_count
FROM actor
GROUP BY last_name
HAVING actor_count > 1;

SELECT staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address ON staff.address_id = address.address_id;

SELECT * FROM inventory;

SELECT COUNT(*) AS num_copies
FROM inventory
WHERE film_id = (
    SELECT film_id FROM film WHERE title = 'Hunchback Impossible'
);

SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY rental_count DESC;

SELECT store.store_id, city.city, country.country
FROM store
INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id;

SELECT * FROM address;
SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM store;

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id FROM film_actor WHERE film_id = (
        SELECT film_id FROM film WHERE title = 'Alone Trip'
    )
);

