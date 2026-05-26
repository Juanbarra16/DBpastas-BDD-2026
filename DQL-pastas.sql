-- Precio de Venta, Costo y Ganancia de Productos Rellenos
SELECT nombre, precio_venta, costo_unitario.ingrediente,(precio_venta.producto - (cantidad.receta_detalle*costo_unitario.ingrediente) AS Ganancia) from producto
JOIN tipo_producto ON producto.id_tipo = tipo_producto.id_tipo
JOIN receta_detalle ON receta_detalle.id_producto = producto.id_producto
JOIN ingrediente ON receta_detalle.id_ingrediente = ingrediente.id_ingrediente
WHERE tipo_producto.descripcion = 'Rellenos';