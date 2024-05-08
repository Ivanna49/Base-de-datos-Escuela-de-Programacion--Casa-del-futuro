#Realizar una consulta de la facturación de e-market. Incluir la siguiente información:
#Id de la factura
#fecha de la factura
#nombre de la empresa de correo
#nombre del cliente
#categoría del producto vendido
#nombre del producto
#precio unitario
#cantidad

SELECT f.FacturaID AS Id_factura, f.FechaFactura AS fecha_factura, co.Compania AS nombre_empresa_correo, cl.Contacto AS nombre_cliente,
cat.CategoriaNombre AS categoria_producto, pd.ProductoNombre AS nombre_producto, fd.PrecioUnitario,fd.Cantidad
FROM Facturas f
INNER JOIN Clientes cl ON f.ClienteID = cl.ClienteID
INNER JOIN FacturaDetalle fd ON f.FacturaID = fd.FacturaID
INNER JOIN Productos pd ON fd.ProductoID = pd.ProductoID
INNER JOIN Categorias cat ON pd.CategoriaID = cat.CategoriaID
LEFT JOIN Correos co ON f.EnvioVia = co.CorreoID
ORDER BY f.FechaFactura DESC;