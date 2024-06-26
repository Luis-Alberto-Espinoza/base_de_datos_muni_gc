-- # Consultas
-- ## SUBQUERIES Y TABLE REFERENCE

-- Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
select  title from series;

SELECT series.genre_id as ID, title, 
        (SELECT name FROM genres 
        WHERE genres.id = series.id) AS nombre_genero
FROM series;

-- Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
select id, title from episodes;
-- select episode_id, actor_id from actor_episode
-- group by episode_id;
SELECT title,
    (SELECT GROUP_CONCAT(CONCAT(first_name, ' ', last_name)) 
        FROM actors 
        WHERE actors.id IN 
            (SELECT actor_id 
             FROM actor_episode 
             WHERE episode_id = episodes.id)
    ) AS nombres_actores
FROM episodes;

-- Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias.
/*construccion de la query*/
-- Obtener los id de las peliculas solicitadas
SELECT m.id
FROM movies m
WHERE m.title LIKE '%La Guerra de las galaxias%';

-- se busca los id de los actores de los id de peliculas de la subconsulta
SELECT am.actor_id
FROM actor_movie am 
WHERE am.movie_id IN (
    SELECT m.id
    FROM movies m
    WHERE m.title LIKE '%La Guerra de las galaxias'
);

SELECT a.id AS actor_id, a.first_name, a.last_name, am.movie_id, 
    (SELECT m.title 
     FROM movies m 
     WHERE m.id = am.movie_id) AS movie_title
FROM actors a, actor_movie am
WHERE a.id = am.actor_id AND am.movie_id IN (
        SELECT m.id
        FROM movies m
        WHERE m.title LIKE '%La Guerra de las galaxias%'
);

-- Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
SELECT g.name AS genero,
    (SELECT COUNT(*) 
        FROM movies m
        WHERE m.genre_id = g.id
    ) AS cantidad_de_peliculas
FROM genres g;
