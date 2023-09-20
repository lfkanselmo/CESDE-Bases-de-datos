-- EJECUTAR PRIMERO LA QUERY DE TALLER EVALUATIVO EN ESTA MISMA CARPETA

-- CONSULTAS BASES DE DATOS VENTAS
USE venta

-- seccion de seleccion
SELECT * 
FROM articulo

SELECT * 
FROM cliente

SELECT * 
FROM detalle_pedido

SELECT * 
FROM pedido

SELECT * 
FROM vendedor

-- 1. Consultar todos los registros de la tabla clientes.
SELECT * 
FROM cliente

-- 2. Consultar vendedores con apellidos que comiencen con la C
SELECT *
FROM vendedor
WHERE vendedor.apellido LIKE 'C%'

-- 3. Consultar productos de categoría escogida por usted.
SELECT * 
FROM articulo
WHERE articulo.categoria = 'granos'

-- 4. Consultar productos con existencias mayores o iguales de 5
SELECT * 
FROM articulo
WHERE existencia >= 5

-- 5. Organizar pedidos desde la fecha mas antigua a la más reciente.
SELECT *
FROM pedido
ORDER BY pedido.fecha

-- 6. Consultar vendedores con ventas entre 100000 y 1000000
SELECT *
FROM vendedor
WHERE vendedor.ventas BETWEEN 100000 AND 1000000

-- 7. Pedidos que no fueron atendidos por id vendedor escogido por usted.
SELECT *
FROM pedido
WHERE pedido.id_vendedor <> 20003

-- 8. Artículos más caro
SELECT MAX(articulo.precio) AS 'Más caro'
FROM articulo

-- 9. Artículos más económicos
SELECT MIN(articulo.precio) AS 'Más caro'
FROM articulo

-- 10. Vendedores con email desconocido. (CREO UN VENDEDOR CON CORREO PREDETERMINADO DESCONOCIDO)
INSERT INTO vendedor(nombre, apellido, direccion, telefono, cuota, ventas)
VALUES
('Nicolas', 'Marin', 'calle 45#64-32', 3247890087, 23900.50, 45670.32)

SELECT * 
FROM vendedor
WHERE vendedor.email = 'Desconocido'

-- 11. Pedidos realizados entre 1 de enero de 2023 y 30 de julio de 2023, organizar por fecha de forma ascendente. (CREO UN PEDIDO CON FECHA FUERA DE LOS RANGOS DE FILTRADO)
INSERT INTO pedido(id_cliente, fecha, id_vendedor)
VALUES
(10006, '2022-12-23', 20007)

SELECT *
FROM pedido
WHERE pedido.fecha BETWEEN '2023-01-01' AND '2023-07-30'
ORDER BY pedido.fecha ASC

-- 12. Artículos con id entre 1 y 5
SELECT *
FROM articulo
WHERE articulo.id_articulo >= 30001 AND articulo.id_articulo <= 30005

-- 13. Vendedores con nombre escogido por usted y cuota mayor o igual a 100000 (CREO UN VENDEDOR CON CUOTA SUPERIOR A 100000 Y QUE SE LLAME JUAN)
INSERT INTO vendedor(nombre, apellido, direccion, telefono, email, cuota, ventas)
VALUES
('Juan', 'Mejia', 'carrera 12#56-76',3456751129, 'juanm@dominio.com', 126850.76, 125500.76)

SELECT *
FROM vendedor
WHERE vendedor.nombre = 'Juan' AND vendedor.cuota >= 100000

-- 14. Vendedores con nombre escogido por usted o pedidos cuota mayor o igual a 100000
SELECT *
FROM vendedor
WHERE vendedor.nombre = 'Juan' OR vendedor.cuota >= 100000

-- JOIN

-- 1. Clientes que realizaron pedidos.
SELECT cliente.nombre, pedido.id_pedido, pedido.fecha
FROM cliente
INNER JOIN pedido
ON cliente.id_cliente = pedido.id_cliente

-- 2. Todos los pedidos y vendedores que atendieron. (debe mostrar: nombre y apellido del vendedor, id pedido)
SELECT pedido.id_pedido, vendedor.nombre, vendedor.apellido
FROM pedido
LEFT JOIN vendedor
ON pedido.id_vendedor = vendedor.id_vendedor

-- 3. Todos los artículos que fueron pedidos. (debe mostrar: id artículo, descripción, cantidad)
SELECT articulo.id_articulo, articulo.descripcion, detalle_pedido.cantidad
FROM articulo
INNER JOIN detalle_pedido
ON articulo.id_articulo = detalle_pedido.id_articulo
ORDER BY articulo.id_articulo ASC

-- 4. Todos los clientes y pedidos realizados
SELECT cliente.nombre, pedido.id_pedido
FROM cliente
FULL OUTER JOIN pedido
ON cliente.id_cliente = pedido.id_cliente