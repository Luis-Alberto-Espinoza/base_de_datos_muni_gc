**Ejercitación consultas - Bases de datos

Consultando la base de datos de e-Market

Introducción

Para ahorrar algunos pasos, preparamos la base de datos de un e-Market con el objetivo de que ya contemos con una fuente de datos. Podemos descargar el script haciendo [clic acá](https://drive.google.com/file/d/1pAB31evH6Lfx_rDju29Db6lp69bGKDqo/view?usp=drive_link), recordemos que va a ser necesario que lo importemos y ejecutemos en Workbench.

E-Market es un e-commerce de venta de productos “deli” a través de Internet.

Para un mejor entendimiento de la base te proporcionamos una referencia de

qué contiene cada tabla:

Existen 13 tablas:

* Categorías: categorías de productos.
* Clientes: maestro de clientes.
* ClientesDemo
* ClientesDemografia
* Correos: empresas transportistas.
* Empleados: empleado responsable de la venta.
* EmpleadosUbicaciones
* FacturaDetalle: detalle de qué se compró en cada factura.
* Facturas: encabezado de la factura.
* Productos: maestro de productos que se venden en la empresa.
* Proveedores: maestro de proveedores que proporcionan los productos para la venta.
* Regiones: regiones de las ubicaciones.
* Ubicaciones: maestro geográfico de ubicaciones.

Objetivo

Vamos a validar lo aprendido. Te proponemos el siguiente desafío para que lo intenten resolver en equipos repasemos y validemos cómo lo resolvieron.

¡Empecemos! 😎👍✨

Consultas queries ML - Parte I

Vamos a practicar sobre consultas SELECT, enfocándonos en SELECT, WHERE, operadores de condición como AND, OR, BETWEEN, LIKE, IN, entre otros.

Tips:

* Cada enunciado se corresponde con una consulta SELECT.
* Recordá ir guardando las consultas SQL.

Consignas

Categorías y productos

1. Queremos tener un listado de todas las categorías.
2. Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion.
3. Obtener un listado de los productos.
4. ¿Existen productos discontinuados? (Discontinuado = 1).
5. Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
6. Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
7. Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
8. 8. Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.

Clientes

1. Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
2. Queremos conocer a todos los clientes que tengan un título “Owner”.
3. El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?

Facturas

1. Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
2. Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
3. ¿El cliente 'GOURL' realizó algún pedido?
   1. Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.

Consultas queries ML - Parte II

En esta segunda parte vamos a intensificar la práctica de consultas SELECT, añadiendo ALIAS, LIMIT y OFFSET.

Productos

1. Obtener el listado de todos los productos ordenados descendentemente por precio unitario.
2. Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.
3. Obtener un top 10 de los productos con más unidades en stock.

FacturaDetalle

1. Obtener un listado de FacturaID, ProductoID, Cantidad.
2. Ordenar el listado anterior por cantidad descendentemente.
3. Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.
4. En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).

¡Extras!

¿Te sobró tiempo? ¿Querés seguir practicando?

Te dejamos unos ejercicios extras a partir de la misma base:

1. Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”.
2. Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".
3. Obtener un listado con los datos: Ciudad, Contacto y renombrarlo como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid".
4. Obtener un listado de todas las facturas con ID entre 10000 y 10500
5. Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”.
6. ¿Existen facturas que la ciudad de envío sea “Vancouver” o que utilicen el correo 3?
7. ¿Cuál es el ID de empleado de “Buchanan”?
8. ¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas)

**
