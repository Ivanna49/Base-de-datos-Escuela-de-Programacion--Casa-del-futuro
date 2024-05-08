
#Reportes parte II - INNER, LEFT Y RIGHT JOIN
#Listar todas las categorías junto con información de sus productos. Incluir todas las categorías aunque no tengan productos.
SELECT c.CategoriaID AS categoria_id, c.CategoriaNombre AS categoria_nombre, p.ProductoID AS producto_id, p.ProductoNombre AS producto_nombre
FROM categorias c
LEFT JOIN productos p ON c.CategoriaID = p.CategoriaID;

#Listar la información de contacto de los clientes que no hayan comprado nunca en emarket.
SELECT c.Contacto
FROM clientes c
LEFT JOIN facturas f ON c.ClienteID = f.ClienteID
WHERE f.ClienteID IS NULL;

#Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y la información de contacto de su proveedor. Tener en cuenta que puede haber productos para los cuales no se indicó quién es el proveedor.
SELECT pr.ProductoNombre AS nombre_producto, c.CategoriaNombre AS nombre_categoria,
    COALESCE(CONCAT( ', ', p.Contacto), 'Proveedor no especificado') AS informacion_proveedor
FROM Productos pr
LEFT JOIN Categorias c ON pr.CategoriaID = c.CategoriaID
LEFT JOIN Proveedores p ON pr.ProveedorID = p.ProveedorID;

#Para cada categoría listar el promedio del precio unitario de sus productos.
SELECT c.CategoriaID AS categoria_id, c.CategoriaNombre AS nombre_categoria,
    AVG(p.PrecioUnitario) AS promedio_precio_unitario
FROM Productos p
JOIN Categorias c ON p.CategoriaID = c.CategoriaID
GROUP BY c.CategoriaID, c.CategoriaNombre;

#Para cada cliente, indicar la última factura de compra. Incluir a los clientes que nunca hayan comprado en e-market.
SELECT c.ClienteID AS cliente_id, c.Contacto AS nombre_cliente,
    COALESCE(MAX(f.FechaFactura), 'Nunca ha comprado') AS ultima_factura
FROM Clientes c
LEFT JOIN Facturas f ON c.ClienteID = f.ClienteID
GROUP BY c.ClienteID, c.Contacto;

#Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un listado con todas las empresas de correo, y la cantidad de facturas correspondientes. Realizar la consulta utilizando RIGHT JOIN.
SELECT c.Compania AS empresa_correo,
    COUNT(f.FacturaID) AS cantidad_facturas
FROM Correos c
RIGHT JOIN Facturas f ON c.CorreoID = f.EnvioVia
GROUP BY c.Compania;