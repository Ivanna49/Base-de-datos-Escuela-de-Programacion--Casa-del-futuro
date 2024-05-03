# Clientes
#1 ¿Cuántos clientes existen?
SELECT COUNT(*) AS total_clientes
FROM Clientes;

#2 ¿Cuántos clientes hay por ciudad?
SELECT ciudad, COUNT(*) AS total_clientes_por_ciudad
FROM Clientes
GROUP BY ciudad;


#Facturas
#1 ¿Cuál es el total de transporte?
SELECT SUM(Transporte) AS TransporteTotal
FROM facturas;


#2 ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
SELECT EnvioVia, SUM(Transporte) AS TransporteTotal
FROM facturas
GROUP BY EnvioVia;


#3 Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas
SELECT ClienteID, COUNT(*) AS CantidadFacturas 
FROM facturas
GROUP BY ClienteID
ORDER BY CantidadFacturas DESC;

#4 Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas
SELECT ClienteID, COUNT(*) AS CantidadFacturas 
FROM facturas
GROUP BY ClienteID
ORDER BY CantidadFacturas DESC
LIMIT 5;

#5 ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
SELECT PaisEnvio, COUNT(*) AS CantidadFacturas
FROM facturas
GROUP BY PaisEnvio
ORDER BY CantidadFacturas
LIMIT 1;

#6 Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?
SELECT EmpleadoID, COUNT(*) AS Ventas 
FROM facturas
GROUP BY EmpleadoID
ORDER BY Ventas DESC
LIMIT 1;

#Factura detalle
#1 ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
SELECT ProductoID, COUNT(*) AS MasAparece
FROM facturadetalle
GROUP BY ProductoID
ORDER BY MasAparece DESC
LIMIT 1;

#2 ¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario.
SELECT SUM(Cantidad*PrecioUnitario) AS TotalFacturado
FROM facturadetalle;

#3 ¿Cuál es el total facturado para los productos ID entre 30 y 50?
SELECT ProductoID, SUM(Cantidad*PrecioUnitario) AS TotalFacturado
FROM facturadetalle
WHERE ProductoID BETWEEN 30 AND 50
GROUP BY ProductoID;

#4 ¿Cuál es el precio unitario promedio de cada producto?
SELECT ProductoID, AVG(PrecioUnitario) AS PrecioUnitarioPromedio 
FROM facturadetalle
GROUP BY ProductoID;


#5  ¿Cuál es el precio unitario máximo?
SELECT ProductoID, PrecioUnitario
FROM facturadetalle
ORDER BY PrecioUnitario DESC
LIMIT 1;








