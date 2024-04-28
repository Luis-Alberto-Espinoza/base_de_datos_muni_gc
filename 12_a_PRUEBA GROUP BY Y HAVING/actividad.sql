-- # ¿Ponemos a prueba lo aprendido utilizando la base Musimundos?

-- ## Base de Datos Musimundos


-- El área de estrategia de Musimundos está analizando cómo implementar una acción de marketing, en la cual tiene que destinar un presupuesto acorde a la cantidad de clientes que tenga cada país. Por esto te piden que los ayudemos a identificar la cantidad de clientes que son de Brazil. Seleccioná el número que obtuviste.
-- opciones(05, 02, 10, 07)
SELECT COUNT(*) AS 'Cantidad clientes de brazil' FROM clientes
WHERE pais = "Brazil";
-- respuesta = 5'

-- En Musimundos estamos muy atentos a que nuestros usuarios encuentren una cantidad apropiada de canciones del estilo que quieran escuchar. Es por eso que en esta oportunidad nos están solicitando una lista de cuantas canciones tenemos por género. Para esto, hacé una consulta a la base de datos que traiga el id del género y la cantidad de canciones que posee. Seleccioná el número que te dio como resultado de la cantidad de canciones del género con id = 6.
SELECT COUNT(*) AS 'cantidad de canciones del genero 6' FROM canciones
WHERE id_genero = 6;

-- opciones(332, 48, 81, 01)'
-- respuesta 81

-- Es época de balances, y en Musimundos queremos saber cuánto dinero llevan gastados los clientes en nuestra empresa. Seleccioná el número que obtuviste. 
SELECT SUM(total) AS total_general
FROM facturas;
-- opciones(2130.60, 4855.60, 2328.60, 2330.60)
-- respuesta 2328,60

-- En el sitio web de Musimundos, queremos informar la duración promedio en milisegundos de cada álbum. Obtiene una lista de todos los álbumes y su duración (milisegundos) promedio. Inserta el número del promedio que obtuviste para el álbum "Let There Be Rock"
SELECT * FROM albumes
WHERE titulo ="Let There Be Rock";
SELECT * FROM canciones
WHERE id_album = 4;
SELECT SUM(milisegundos) FROM canciones
WHERE id_album = 4;
-- opciones(298517.1050, 326547.9050, 306657.3750, 305547.6050)
-- respuesta 2453259

-- En el equipo de desarrollo están mudando de servidor a nuestra aplicación, y quieren saber cuál es el peso (bytes) de cada archivo de canciones para buscar un servidor adecuado con capacidad suficiente. Hace una consulta a la base de datos para saber cuál es el archivo con menor peso en bytes. Seleccioná el número que obtuviste.
SELECT min(bytes) FROM canciones;
-- opciones(32717, 36787, 38747, 30727)
-- respuesta 38747

-- En el salón de Musimundos, estamos ofreciendo un descuento para todos aquellos clientes que tengan un total de facturación mayor a 45. Hacé una consulta a la base de datos que nos traiga por id_cliente la suma total de sus facturas. Filtra aquellos que la suma del total sea 45. ¿Cuál es la suma total del cliente con id = 6? Por último, seleccioná el número que obtuviste.
SELECT SUM(total) FROM facturas
WHERE id_cliente = 6;
-- opciones(43.12, 50.62, 49.62, 47.72)
-- respuesta 49,62