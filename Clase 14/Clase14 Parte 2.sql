#Consultas queries XL parte II - JOIN

#Generar un listado de todas las facturas del empleado 'Buchanan'. 
SELECT e.apellido, f.FacturaID FROM facturas AS f
INNER JOIN empleados AS e
ON f.EmpleadoID = e.EmpleadoID
WHERE e.Apellido = 'Buchanan';

#Generar un listado con todos los campos de las facturas del correo 'Speedy Express'. f.EnvioVia, c.CorreoID, c.Compania
SELECT * FROM facturas AS f
INNER JOIN correos AS c
ON f.EnvioVia = c.CorreoID
WHERE c.Compania = 'Speedy Express';

#Generar un listado de todas las facturas con el nombre y apellido de los empleados.
SELECT e.Apellido, e.Nombre, f.FacturaID
FROM empleados AS e
INNER JOIN facturas AS f
ON f.EmpleadoID = e.EmpleadoID; 

#Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío “USA”.
SELECT  f.FacturaID, c.titulo AS titulo_cliente, f.PaisEnvio
FROM facturas AS f 
INNER JOIN clientes c ON c.ClienteID = f.ClienteID 
WHERE c.titulo = 'Owner' AND f.PaisEnvio = 'USA';

#Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” o que incluyan el producto id = “42”
SELECT * FROM facturas AS f
INNER JOIN empleados e ON e.EmpleadoID = f.EmpleadoID
INNER JOIN facturadetalle fd ON f.FacturaID = fd.FacturaID
WHERE e.Apellido = 'Leverling' OR fd.ProductoID = 42;

#Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” y que incluya los producto id = “80” o ”42”
SELECT * FROM facturas AS f
INNER JOIN empleados e ON e.EmpleadoID = f.EmpleadoID
INNER JOIN facturadetalle fd ON f.FacturaID = fd.FacturaID
WHERE e.Apellido = 'Leverling' OR fd.ProductoID IN (42,80);

#Generar un listado con los cinco mejores clientes, según sus importes de compras total (PrecioUnitario * Cantidad)
SELECT c.ClienteID, c.Compania, c.Contacto, 
SUM(fd.Cantidad * fd.PrecioUnitario - fd.Descuento) AS ComprasTotal
FROM clientes c
INNER JOIN facturas f ON c.ClienteID = f.ClienteID
INNER JOIN facturadetalle fd ON f.FacturaID = fd.FacturaID
GROUP BY c.ClienteID, c.Compania, c.Contacto
ORDER BY ComprasTotal DESC
LIMIT 5;

#Generar un listado de facturas, con los campos id, nombre y apellido del cliente, fecha de factura, país de envío, Total, ordenado de manera descendente por fecha de factura y limitado a 10 filas
SELECT f.FacturaID, c.Contacto, f.FechaFactura, f.PaisEnvio,
SUM(fd.Cantidad*fd.PrecioUnitario-fd.Descuento) AS total
FROM facturas f
INNER JOIN clientes c ON f.ClienteID = c.ClienteID
INNER JOIN facturadetalle fd ON f.FacturaID = fd.FacturaID
GROUP BY f.FacturaID, c.Contacto, f.FechaFactura, f.PaisEnvio
ORDER BY f.FechaFactura DESC
LIMIT 10;
