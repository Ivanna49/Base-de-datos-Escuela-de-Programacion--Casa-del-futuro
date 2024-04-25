#Parte1
#Queremos tener un listado de todas las categorías
SELECT * from categorias;

#Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion.
select CategoriaNombre, descripcion from categorias;

#Obtener un listado de los productos.
SELECT * from productos;

#Obtener un listado de los productos.  (Discontinuado = 1)
SELECT * from productos WHERE discontinuado = 1; 

#Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
select * from productos where proveedorid = 8;

#Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
SELECT * from productos where preciounitario BETWEEN 10 and 22 ORDER BY preciounitario DESC;

#Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
SELECT * from productos where UnidadesStock < NivelReorden;

#Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.
SELECT * from productos where UnidadesStock < NivelReorden and UnidadesPedidas = 0;

#Clientes
#Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
SELECT Contacto, Compania, Titulo, Pais from clientes ORDER BY pais;

#Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT * from clientes where titulo = "Owner";

#El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?
SELECT * from clientes where Contacto like "C%";

#Facturas
#Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
SELECT * from facturas ORDER BY FechaFactura;

#Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
SELECT * from facturas where PaisEnvio like "USA" and EnvioVia != 3;

#¿El cliente 'GOURL' realizó algún pedido?
SELECT * from facturas WHERE ClienteID = 'gourl';

#Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
SELECT * from facturas WHERE EmpleadoID in (2, 3, 5, 8, 9);

#Parte 2
#Productos
#Obtener el listado de todos los productos ordenados descendentemente por precio unitario.
SELECT * FROM productos
ORDER BY PrecioUnitario DESC;

#Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.
SELECT ProductoNombre, PrecioUnitario
FROM Productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

#Obtener un top 10 de los productos con más unidades en stock.
SELECT ProductoNombre, UnidadesStock
FROM Productos
ORDER BY UnidadesStock DESC
LIMIT 10;

#Factura detalle
#Obtener un listado de FacturaID, ProductoID, Cantidad.
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle;

#Ordenar el listado anterior por cantidad descendentemente.
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle
ORDER BY cantidad DESC;

#Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle
WHERE Cantidad BETWEEN 50 AND 100;

#En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).
SELECT FacturaID AS NroFactura, ProductoID AS Producto,
PrecioUnitario * Cantidad AS Total
FROM facturadetalle;

#Extras
#Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”. 
SELECT *
FROM clientes
WHERE Pais = "Brazil" OR Pais = "Mexico"  OR Titulo LIKE "Sales%";

#Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".
SELECT *
FROM clientes
WHERE Compania LIKE 'A%';

#Obtener un listado con los datos: Ciudad, Contacto y renombrarlo como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid".
SELECT Ciudad AS Ciudad,
Contacto  AS "Apellido y Nombre",
Titulo AS Puesto
FROM clientes
WHERE Ciudad = 'Madrid';

#Obtener un listado de todas las facturas con ID entre 10000 y 10500
SELECT *
FROM facturas
WHERE FacturaID BETWEEN 10000 AND 10500;

#Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”
SELECT *
FROM facturas
WHERE FacturaID BETWEEN 10000 AND 10500
OR ClienteID LIKE 'B%';

#¿Existen facturas que la ciudad de envío sea “Vancouver” o que utilicen el correo 3?
SELECT *
FROM facturas
WHERE CiudadEnvio = 'Vancouver'
OR EnvioVia = '3';

#¿Cuál es el ID de empleado de “Buchanan”?
SELECT EmpleadoID
FROM empleados
WHERE Apellido = 'Buchanan';

#¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas)
SELECT COUNT(*)
FROM facturas
WHERE EmpleadoID = 5;