USE sakila;

-- 1 Select all the actors with the first name ‘Scarlett’.

SELECT * FROM sakila.actor
WHERE first_name= 'Scarlett';

-- 2 How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(film_id) FROM sakila.film;
SELECT * FROM sakila.film;
SELECT COUNT(rental_rate ) FROM sakila.film
WHERE rental_rate >0;

-- 3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT max(length) as max_duration, min(length) as min_duration
FROM sakila.film;

-- 4 What's the average movie duration expressed in format (hours, minutes)?

SELECT * FROM sakila.film;

SElECT round(avg(length)/60,2) as average
FROM sakila.film;

-- 5 How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
FROM sakila.actor;

-- 6 Since how many days has the company been operating (check DATEDIFF() function)?
-- I didn´t undertand which table to use....

SELECT rental_date, last_update, DATEDIFF(rental_date, last_update) as datediff
FROM sakila.rental;

-- 7 Show rental info with additional columns month and weekday. Get 20 results.

SELECT * FROM sakila.rental;
SELECT *, date_format(rental_date, '%d-%m-%Y') AS 'date' 
FROM sakila.rental;
SELECT *, date_format(rental_date, '%M') AS 'month'
FROM sakila.rental;

-- 8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, 
case when weekday(rental_date) in (5,6) then 'weekend'
else 'workday' end as day_type
from rental;


-- 9 Get release years.

SELECT release_year FROM sakila.film;

-- 10 Get all films with ARMAGEDDON in the title.

SELECT *
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';


-- 11 Get all films which title ends with APOLLO.

SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO';


-- 12 Get 10 the longest films.

SELECT title , length FROM film
ORDER BY length DESC
LIMIT 10;


-- 13 How many films include Behind the Scenes content?

SELECT film_id, title as "Films with Behind the Scenes" , special_features FROM sakila.film
WHERE (special_features = 'Behind the Scenes');

