/*EJERCITACION DQL*/
-- Consultas
-- SELECT
-- Mostrar todos los registros de la tabla de movies.
SELECT * FROM movies;

-- Mostrar el nombre, apellido y rating de todos los actores.
SELECT first_name,last_name,rating FROM movies_db.actors;

-- Mostrar el título de todas las series.
SELECT title  FROM series;

-- Mostrar el título, rating y duración de la tabla movies.
SELECT title, rating, length FROM movies;

-- WHERE Y ORDER BY
-- Mostrar el nombre y apellido de los actores cuyo rating sea mayor a 7,5.
SELECT first_name, last_name, rating FROM actors
WHERE rating >= 7.5;

-- Mostrar el título de las películas, el rating y los premios de las películas con un rating mayor a 7,5 y con más de dos premios.
SELECT title, rating, awards FROM movies
WHERE rating >= 7.5;

-- Mostrar el título de las películas y el rating ordenadas por rating en forma ascendente.
SELECT title, rating FROM movies 
ORDER BY  rating ASC;

-- Mostrar actores cuyo rating se encuentre entre 4.0 y 10.0.
SELECT last_name, first_name, rating FROM actors
WHERE rating BETWEEN 3.9 AND 10.1
ORDER BY rating ASC;

-- Muestra los títulos y las fechas de lanzamiento de las películas cuya duración sea más de 150 minutos.
SELECT title, release_date, length FROM movies
WHERE length > 150
ORDER BY length ASC;
