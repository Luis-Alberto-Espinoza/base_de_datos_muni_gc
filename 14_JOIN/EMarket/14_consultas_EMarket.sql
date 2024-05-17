-- Consignas
-- Clientes
-- 1.¿Cuántos clientes existen?
SELECT COUNT(*) AS cantidad_clientes FROM Clientes;

-- 2.¿Cuántos clientes hay por ciudad?
SELECT COUNT(*), Ciudad FROM Clientes 
GROUP BY Ciudad;

-- Facturas
-- 1.¿Cuál es el total de transporte?
SELECT ROUND(SUM(transporte), 2) AS total_transporte FROM Facturas;
-- 2.¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
SELECT EnvioVia, SUM(Transporte) AS TransporteTotal
FROM Facturas
GROUP BY EnvioVia;
-- 3.Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.
SELECT ClienteID,COUNT(FacturaID) AS Cantidad_de_facturas FROM Facturas
GROUP BY ClienteID
ORDER BY Cantidad_de_facturas DESC;

-- 4.Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
SELECT ClienteID,COUNT(FacturaID) AS Cantidad_de_facturas FROM Facturas
GROUP BY ClienteID
ORDER BY Cantidad_de_facturas DESC
LIMIT 5;

-- 5.¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
SELECT PaisEnvio, COUNT(FacturaID) cantidad_envio FROM Facturas
GROUP BY PaisEnvio
ORDER BY cantidad_envio
LIMIT 1;
-- 6.Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?
SELECT EmpleadoID, COUNT(FacturaID) AS Cantidad_Ventas FROM Facturas
GROUP BY EmpleadoID
ORDER BY Cantidad_Ventas DESC
LIMIT 1;

-- Factura detalle
-- 1.¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
SELECT ProductoID, COUNT(*) AS Cantidad FROM FacturaDetalle
GROUP BY ProductoID
ORDER BY cantidad DESC
LIMIT 1;

SELECT p.ProductoNombre, fd.ProductoID, COUNT(*) AS MasAparece
FROM FacturaDetalle fd
JOIN Productos p ON fd.ProductoID = p.ProductoID
GROUP BY fd.ProductoID, p.ProductoNombre
ORDER BY MasAparece DESC
LIMIT 1;

-- 2.¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario.
SELECT SUM(Cantidad*PrecioUnitario) AS TotalFacturado
FROM FacturaDetalle;
-- 
-- 3.¿Cuál es el total facturado para los productos ID entre 30 y 50?
SELECT ProductoID, ROUND(SUM(Cantidad*PrecioUnitario), 2) AS TotalFacturado
FROM FacturaDetalle
WHERE ProductoID Between 30 AND 50
GROUP BY ProductoID;
-- 4.¿Cuál es el precio unitario promedio de cada producto?
SELECT ProductoID, ROUND(AVG(PrecioUnitario),3) AS Promedio From FacturaDetalle
GROUP BY ProductoID;
-- 5.¿Cuál es el precio unitario máximo?
SELECT ProductoID, PrecioUnitario
FROM FacturaDetalle
ORDER BY PrecioUnitario DESC
LIMIT 1;

-- Consultas queries XL parte II - JOIN


-- Generar un listado de todas las facturas del empleado 'Buchanan'. 
SELECT f.FacturaID, f.EmpleadoID FROM Facturas AS f
INNER JOIN Empleados AS e 
ON e.EmpleadoID = f.EmpleadoID
WHERE e.Apellido = 'Buchanan';



-- Generar un listado con todos los campos de las facturas del correo 'Speedy Express'.
SELECT Compania FROM Correos;
SELECT * FROM Facturas AS f 
INNER JOIN Correos AS c 
ON c.CorreoID = f.EnvioVia
WHERE c.Compania = "Speedy Express";


-- Generar un listado de todas las facturas con el nombre y apellido de los empleados.
SELECT f.FacturaID, f.EmpleadoID, e.Nombre AS nombre_Empleado, e.Apellido AS Apellido_Empleado  
FROM Facturas AS f 
INNER JOIN Empleados AS e 
ON e.EmpleadoID = f.EmpleadoID;

-- Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío “USA”.
-- owner esta en titulo de Clientes
SELECT * FROM Clientes
WHERE titulo = "Owner" AND Pais = "USA";
SELECT f.FacturaID, c.ClienteID, c.Titulo, c.Pais FROM Facturas f 
INNER JOIN Clientes c 
ON c.ClienteID = f.clienteID
WHERE c.titulo = "Owner" AND c.Pais = "USA";

-- Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” o que incluyan el producto id = “42”.
SELECT Nombre, Apellido, EmpleadoID FROM Empleados
WHERE Apellido = "Leverling";
SELECT * FROM FacturaDetalle
WHERE ProductoID = 42;
SELECT * FROM Productos 
WHERE ProductoID = 42;

SELECT * FROM Facturas f 
INNER JOIN Empleados  e 
ON e.EmpleadoID = f.EmpleadoID
WHERE e.Apellido = "Leverling";

SELECT fd.* FROM Facturas f 
INNER JOIN FacturaDetalle  fd 
ON fd.FacturaID = f.FacturaID
WHERE fd.ProductoID =42;

SELECT f.FacturaID, e.EmpleadoID, e.Apellido, p.ProductoID
FROM Facturas f
INNER JOIN Empleados e ON f.EmpleadoID = e.EmpleadoID
INNER JOIN FacturaDetalle fd ON f.FacturaID = fd.FacturaID
INNER JOIN Productos p ON fd.ProductoID = p.ProductoID
WHERE Apellido = 'Leverling' OR p.ProductoID = 42;


-- Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” y que incluya los producto id = “80” o ”42”.
SELECT count(*) FROM Productos
WHERE ProductoID = 42;

SELECT count(*) FROM Productos
WHERE ProductoID = 80;

SELECT f.FacturaID, e.EmpleadoID, e.Apellido, p.ProductoID
FROM Facturas f
INNER JOIN Empleados e ON f.EmpleadoID = e.EmpleadoID
INNER JOIN FacturaDetalle fd ON f.FacturaID = fd.FacturaID
INNER JOIN Productos p ON fd.ProductoID = p.ProductoID
WHERE Apellido = 'Leverling' OR (p.ProductoID = 80 OR p.ProductoID = 42);

-- Generar un listado con los cinco mejores clientes, según sus importes de compras total (PrecioUnitario * Cantidad).
SELECT * FROM Clientes;
SELECT * FROM Facturas;
SELECT * FROM FacturaDetalle;

SELECT c.ClienteID, ROUND(SUM(fd.PrecioUnitario*fd.Cantidad), 2) AS Total_DE_Compras 
FROM Facturas f 
INNER JOIN Clientes AS c 
ON c.ClienteID = f.ClienteID 
INNER JOIN FacturaDetalle AS fd 
ON fd.FacturaID = f.FacturaID
GROUP BY c.ClienteID
ORDER BY Total_DE_Compras desc
LIMIT 5;

-- Generar un listado de facturas, con los campos id, nombre y apellido del cliente, 
-- fecha de factura, país de envío, Total, ordenado de manera descendente por fecha de factura y limitado a 10 filas.
SELECT f.FacturaID, c.ClienteID, c.Compania, f.FechaFactura, f.PaisEnvio, ROUND(SUM(fd.PrecioUnitario*fd.Cantidad), 2) AS Total_DE_Compras  FROM Facturas f
INNER JOIN Clientes AS c 
ON c.ClienteID = f.ClienteID 
INNER JOIN FacturaDetalle AS fd 
ON fd.FacturaID = f.FacturaID
GROUP BY f.FacturaID
ORDER BY f.FechaFactura DESC
LIMIT 10;
