show tables;
-- Consignas

-- Categorías y productos
show columns FROM Categorias;
-- 1. Queremos tener un listado de todas las categorías.
 SELECT CategoriaNombre AS Nombre_de_categorias  FROM Categorias;
-- 2. Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion.
SELECT CategoriaNombre Nombre_categoria, Descripcion FROM Categorias;   

-- 3. Obtener un listado de los productos.
SELECT * FROM Productos;

-- 4. ¿Existen productos discontinuados? (Discontinuado = 1).
SELECT * FROM Productos
WHERE Discontinuado = 1;

-- 5. Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
SELECT Productonombre nombre, ProductoID ID FROM Productos WHERE ProveedorID = 8;


-- 6. Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
SELECT ProductoNombre Nombre, PrecioUnitario Precio 
FROM Productos
WHERE PrecioUnitario BETWEEN 10 AND 22
ORDER BY PrecioUnitario ASC;

-- 7. Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
SELECT ProveedorID,ProductoID ID_producto,ProductoNombre nombre, NivelreOrden, UnidadesStock 
FROM Productos
WHERE NivelreOrden > UnidadesStock
ORDER BY ProveedorID;

-- 8. 8. Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.
SELECT  ProveedorID,ProductoID ID_producto,ProductoNombre nombre,UnidadesPedidas, NivelreOrden, UnidadesStock 
FROM Productos
WHERE UnidadesPedidas = 0
ORDER BY UnidadesStock;

-- Clientes

-- 1. Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
SELECT ClienteID, Contacto, Compania, Titulo, Pais 
FROM Clientes
ORDER BY Pais;

-- 2. Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT ClienteID, Compania, Titulo 
FROM Clientes
WHERE Titulo = ("Owner");

-- 3. El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?
SELECT Contacto, ClienteID, Telefono 
FROM Clientes
WHERE Contacto LIKE ("C%");

-- Facturas

-- 1. Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
SELECT * FROM Facturas
ORDER BY FechaFactura ASC;

-- 2. Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
SELECT * 
FROM Facturas
WHERE PaisEnvio = "USA" AND EnvioVia =3;

-- 3. ¿El cliente 'GOURL' realizó algún pedido?
SELECT *
FROM Facturas
WHERE ClienteID = "GOURL";

-- 4. Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
SELECT * 
FROM Facturas
WHERE EmpleadoID in ("2", "3", "5", "8", "9")
ORDER BY EmpleadoID;


/*
Consultas queries ML - Parte II
*/

-- Productos

-- 1. Obtener el listado de todos los productos ordenados DESCendentemente por precio unitario.
SELECT ProductoID, ProductoNombre, PrecioUnitario 
FROM Productos
ORDER BY PrecioUnitario DESC
LIMIT 15;

-- 2. Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.
SELECT PrecioUnitario, ProductoNombre, ProductoID 
FROM Productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

-- 3. Obtener un top 10 de los productos con más unidades en stock.
SELECT UnidadesStock, ProductoNombre, ProductoID 
FROM Productos
ORDER BY UnidadesStock DESC
LIMIT 10;

-- FacturaDetalle
-- 0. Cantidad de registros para la tabla FacturaDetalle
SELECT COUNT(*) AS total_registros
FROM FacturaDetalle;

-- 1. Obtener un listado de FacturaID, ProductoID, Cantidad.
SELECT FacturaID, ProductoID, Cantidad 
FROM FacturaDetalle;

-- 2. Ordenar el listado anterior por cantidad DESCendentemente.
SELECT Cantidad, FacturaID, ProductoID
FROM FacturaDetalle
ORDER BY Cantidad DESC;

-- 3. Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.
SELECT Cantidad, FacturaID, ProductoID
FROM FacturaDetalle
ORDER BY Cantidad DESC
LIMIT 100 OFFSET 50;

-- 4. En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).
SELECT FacturaID, ProductoID,PrecioUnitario, Cantidad, (PrecioUnitario*Cantidad) AS Total
FROM FacturaDetalle;

/*
¡Extras!
*/
-- 1. Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”.
SELECT ClienteID, Titulo, Pais 
FROM Clientes
WHERE Pais = "Brazil" OR Pais = "mexico" OR Titulo LIKE "Sales%";

-- 2. Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".
SELECT ClienteID, Compania
FROM Clientes
WHERE Compania LIKE "A%";

-- 3. Obtener un listado con los datos: Ciudad, Contacto y renombrarlo como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid".
SELECT Contacto AS 'Nombre y Apellido', Ciudad, Titulo AS Puesto 
FROM Clientes
WHERE Ciudad = "Madrid";

-- 4. Obtener un listado de todas las facturas con ID entre 10000 y 10500
SELECT FacturaID
FROM Facturas
WHERE FacturaID BETWEEN 10000 AND 10500;

-- 5. Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”.
SELECT FacturaID, ClienteID
FROM Facturas
WHERE FacturaID BETWEEN 10000 AND 10500 OR ClienteID LIKE "B%";

-- 6. ¿Existen facturas que la ciudad de envío sea “Vancouver” o que utilicen el correo 3?
SELECT CiudadEnvio, EnvioVia AS Correo
FROM Facturas
WHERE CiudadEnvio = 'Vancouver' OR EnvioVia = 3;

-- 7. ¿Cuál es el ID del empleado de **APELLIDO** “Buchanan”?
SELECT EmpleadoID, Nombre, Apellido, Ciudad
FROM Empleados
WHERE Apellido ='Buchanan';

-- 8. ¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas)
SELECT FacturaID , EmpleadoID
FROM Facturas
WHERE EmpleadoID = 5;

SELECT count(FacturaID) AS 'Cantidad de Facturas' , EmpleadoID
FROM Facturas
WHERE EmpleadoID = 5;
