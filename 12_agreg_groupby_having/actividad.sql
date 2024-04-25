/*Funciones de agregación, GROUP BY y HAVING*/

-- ¿Cuántas películas hay?
SELECT * FROM movies;

SELECT COUNT(*) 'Cantidad_de_peliculas'  
FROM movies;

-- ¿Cuántas películas tienen entre 3 y 7 premios?
SELECT COUNT(*) AS Cantidad_de_peliculas
FROM movies
WHERE awards BETWEEN 3 AND 7;


-- ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
SELECT id, rating, awards
FROM movies
WHERE awards BETWEEN 3 AND 7 AND rating > 7;

SELECT COUNT(id) 'Cantidad_de_ppeliculas'
FROM movies
WHERE awards BETWEEN 3 AND 7 AND rating > 7;

-- Encuentra la cantidad de actores en cada película.
SHOW TABLES;
SELECT * FROM actor_movie;

SELECT movie_id, COUNT(actor_id) AS cantidad_actores
FROM actor_movie
GROUP BY movie_id;

-- Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por id. de género.
SELECT * FROM movies;

SELECT genre_id, COUNT(genre_id) AS Cantidad_de_peliculas
FROM movies
GROUP BY genre_id;

-- De la consulta anterior, listar sólo aquellos géneros que tengan como suma de premios un número mayor a 5.
SELECT genre_id, SUM(awards) AS Suma_de_premios
FROM movies
GROUP BY genre_id
HAVING SUM(awards) > 5;

-- Encuentra los géneros que tienen las películas con un promedio de calificación mayor a 6.0.
SELECT genre_id, AVG(rating) AS Promedio_de_calificacion
FROM movies
GROUP BY genre_id
HAVING AVG(rating) > 6.0;

-- Encuentra los géneros que tienen al menos 3 películas.
SELECT genre_id, SUM(movie_id) AS Cantidad_de_peliculas
FROM movies
GROUP BY genre_id
HAVING SUM(movie_id) > 3;