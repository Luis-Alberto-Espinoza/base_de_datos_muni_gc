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



