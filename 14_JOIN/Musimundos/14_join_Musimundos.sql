-- Consultas
-- SELECT, GROUP BY y JOIN
-- 1 Listar las canciones cuya duración sea mayor a 2 minutos.
SELECT id, (milisegundos/60000) AS Minutos_duracion FROM canciones
WHERE milisegundos > 120000;
SELECT id, FLOOR((milisegundos % 3600000) / 60000) AS Minutos,
           FLOOR(((milisegundos % 3600000) % 60000) / 1000) AS Segundos 
FROM canciones
WHERE milisegundos > 120000;

-- 2.Listar las canciones cuyo nombre comience con una vocal.
SELECT nombre AS titulo FROM canciones
WHERE LEFT(nombre, 1) in ("A", "E", "I", "O", "U");

-- 3.Canciones
-- a.Listar las canciones ordenadas por compositor en forma descendente.
-- b.Luego, por nombre en forma ascendente. Incluir únicamente aquellas canciones que tengan compositor.
SELECT nombre, compositor FROM canciones
WHERE compositor != ""
ORDER BY compositor DESC;

-- 4. Canciones
-- a. Listar la cantidad de canciones de cada compositor.
-- b. Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones.
 SELECT compositor , count(nombre)  AS canciones
 FROM canciones 
 WHERE compositor != ""
 GROUP BY compositor 
 HAVING canciones > 10;


-- 5.Facturas
-- a.Listar el total facturado agrupado por ciudad.
SELECT ciudad_de_facturacion AS ciudad, sum(total) AS total_facturado 
FROM facturas
GROUP BY ciudad_de_facturacion;
-- b.Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.

SELECT ciudad_de_facturacion AS ciudad, pais_de_facturacion AS pais, sum(total) AS total_facturado 
FROM facturas
WHERE pais_de_facturacion = "Canada"
GROUP BY ciudad_de_facturacion, pais_de_facturacion;
-- c.Modificar el listado del punto (a) mostrando únicamente las ciudades con una facturación mayor a 38.
SELECT ciudad_de_facturacion AS ciudad, sum(total) AS total_facturado 
FROM facturas
GROUP BY ciudad_de_facturacion
HAVING total_facturado > 38;
-- d.Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.

SELECT ciudad_de_facturacion AS ciudad, pais_de_facturacion AS pais, sum(total) AS total_facturado 
FROM facturas
GROUP BY ciudad_de_facturacion, pais_de_facturacion;
-- 6.Canciones / Géneros
-- a.Listar la duración mínima, máxima y promedio de las canciones.
SELECT min(milisegundos) AS minimo, max(milisegundos) AS maimo, avg(milisegundos) AS promedio
FROM canciones;

-- b.Modificar el punto (a) mostrando la información agrupada por género.
SELECT g.nombre, min(milisegundos) AS minimo, max(milisegundos) AS maximo, avg(milisegundos) AS promedio
FROM canciones AS c
Inner join generos AS g
on c.id_genero = g.id
GROUP BY g.nombre;