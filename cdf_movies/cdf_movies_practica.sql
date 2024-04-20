/*EJERCITACION DQL*/
-- Consultas
-- SELECT
-- Mostrar todos los registros de la tabla de movies.
SELECT * FROM movies;

-- Mostrar el nombre, apellido y rating de todos los actores.
SELECT first_name AS Nombre,last_name AS Apellido,rating FROM movies_db.actors;

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
WHERE rating >= 7.5 AND awards > 2;

-- Mostrar el título de las películas y el rating ordenadas por rating en forma ascendente.
SELECT title, rating FROM movies 
ORDER BY  rating ASC;

-- Mostrar actores cuyo rating se encuentre entre 4.0 y 10.0.
SELECT last_name, first_name, rating FROM actors
WHERE rating BETWEEN 4 AND 10
ORDER BY rating ASC;

-- Muestra los títulos y las fechas de lanzamiento de las películas cuya duración sea más de 150 minutos.
SELECT title, release_date, length FROM movies
WHERE length > 150
ORDER BY length ASC;

-- BETWEEN y LIKE
-- Mostrar el título y rating de todas las películas cuyo título incluya Toy Story.
SELECT title, rating FROM movies
WHERE title LIKE '%Toy Story%';

-- Mostrar a todos los actores cuyos nombres empiecen con Sam.
SELECT first_name, last_name FROM actors
WHERE first_name LIKE 'sam%';

-- Muestra los nombres y apellidos de los actores ordenados por su rating de forma descendente.
SELECT first_name AS Nombre, last_name AS Apellido, rating AS Ranking FROM actors
WHERE rating
ORDER BY rating DESC;

-- Muestra los títulos y las fechas de lanzamiento de las películas ordenadas por su rating de forma descendente.
SELECT title AS Titulo, release_date AS Lanzamiento, rating AS Ranking FROM movies
WHERE rating
ORDER BY rating DESC;

-- Muestra los nombres y apellidos de los actores cuyos nombres contienen la letra "a".
SELECT first_name AS Nombre, last_name AS Apellido FROM actors 
WHERE first_name LIKE '%a%';

-- Mostrar el título de las películas que salieron entre el ‘2004-01-01’ y ‘2008-12-31’.
SELECT title AS Titulo, DATE_FORMAT(release_date, '%Y-%M-%d') AS Lanzamiento FROM movies
WHERE release_date BETWEEN '2004-01-01' AND '2008-12-31';