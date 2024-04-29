-- # Consultas
-- ## SUBQUERIES Y TABLE REFERENCE

-- Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
select title from series;
SELECT title, 
        (SELECT name FROM genres 
        WHERE genres.id = series.id) AS nombre_genero
FROM series;

-- Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
select id, title from episodes;
-- select episode_id, actor_id from actor_episode
-- group by episode_id;
SELECT 
    title,
    (
        SELECT GROUP_CONCAT(CONCAT(first_name, ' ', last_name)) 
        FROM actors 
        WHERE actors.id IN 
            (SELECT actor_id 
             FROM actor_episode 
             WHERE episode_id = episodes.id)
    ) AS nombres_actores
FROM 
    episodes;


/*
SELECT 
    title,
    (
        SELECT CONCAT(first_name, ' ', last_name) 
        FROM actors 
        WHERE actors.id IN 
            (SELECT actor_id 
             FROM actor_episode 
             WHERE episode_id = episodes.id)
    ) AS nombre_apellido_actor
FROM 
    episodes;


-- Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias.

-- Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
*/