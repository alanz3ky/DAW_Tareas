-- Alan E. Matia Carles

-- 1.Mostrar en un solo campo el nombre completo de aquellos clientes que viven en Almeria 
SELECT nombre, apellido1 , apellido2
FROM cliente
WHERE ciudad = 'Almeria';

-- 2.Mostrar los datos de los comerciales que tengan comision  de entre 0.08 y 0.13 , ambos incluidos
SELECT *
FROM comercial
WHERE comision BETWEEN 0.08 AND 0.13;

-- 3.Mostar los datos de los 3 pedidos mas caros

SELECT *
FROM pedido
ORDER BY total DESC
LIMIT 3;

-- 4.Mostrar el nombre completo de aquellos clientes que tengan un solo apellido .Los clientes deben mostrarse ordenados alfabeticamente por su nombre
SELECT nombre, apellido1 , apellido2 
FROM cliente
WHERE apellido2 IS NULL
ORDER BY nombre;
-- 5.Mostar aquellas categorias de clientes en los que haya mas de un cliente . Debe mostrarse el numero de la categoria junto con el numero de cliente que tiene
SELECT categoria, COUNT(*) AS num_cliente
FROM cliente
GROUP BY categoria
HAVING COUNT(*) > 1;

-- 6.Mostar los identificadores de los pedidos realizados por clientes de la categoria 200. Debe mostrar el nombre completo del cliente
SELECT pedido.id_pedido, cliente.nombre
FROM pedido
JOIN cliente ON pedido.id_cliente = cliente.id_cliente
WHERE cliente.categoria = 200;
 
-- 7.Mostrar los datos de los comerciales que tengan una comision mayor que la media
SELECT *
FROM comercial
WHERE comision > (SELECT AVG(comision) FROM comercial);

 
-- 8.Mostrar los datos de los comerciales que no han gestionado ningun pedido
SELECT *
FROM comercial
WHERE id NOT IN (SELECT DISTINCT id_comercial FROM pedido);
 
-- 9.Mostrar el pedido o pedidos(si hay mas de uno) más caros realizados en el año 2019

SELECT *
FROM pedido
WHERE fecha BETWEEN '2019-01-01' AND '2019-12-31'
ORDER BY total DESC
LIMIT 1;

-- 10.Mostrar el numero de pedidos que ha gestionado cada comercial . Ten en cuenta que debe mostrar un 0 si el comercial no ha gestionado ningun pedido

SELECT c.id_comercial, COALESCE(COUNT(p.id_pedido), 0) AS num_pedido
FROM comercial
LEFT JOIN pedido p ON c.id_comercial = p.id_comercial
GROUP BY c.id_comercial;
 
-- 11.Mostrar los datos de los cliente o clientes que han realizado el pedido mas caro
SELECT cliente.nombre, pedido.total
FROM cliente
JOIN pedido ON cliente.id_cliente = pedido.id_cliente
ORDER BY pedido.precio_total DESC
LIMIT 1;

 
-- 12.Mostrar los datos de los comerciales qe han gestionado pedidos realizados por clientes de Sevilla
SELECT DISTINCT c.*
FROM comercial c
JOIN pedidos p ON c.id_comercial = p.id_comercial
JOIN clientes cl ON p.id_cliente = cl.id_cliente
WHERE cl.ciudad = 'Sevilla';

-- 13. En la tabla pedidos , cambia el nombre de la columna "total" a "precio_total"
ALTER TABLE pedidos
ALTER COLUMN total SET "precio_total";

-- 14.Inserta una nueva comercial llamada "Alicia Prado" con una comision del 6%, (0,06)
INSERT INTO comercial (nombre,apellido1, apellido2, comision)
VALUES ('Alicia Prado', 0.06);
-- 15.Los comerciales con una comision menor del 10%(0,10)pasarán a tener esa comisión
UPDATE comercial
SET comision = 0.10
WHERE comision < 0.10;

-- 16.Borra los datos del pedido numero 10 
DELETE FROM pedido
WHERE id = 10;
-- 17.Incrementa en un2% (0,02) la comision de los comerciales que gestionaron el mayor numero de pedidos
UPDATE comercial
SET comision = comision * 1.02
WHERE id_comercial IN (
    SELECT id_comercial
    FROM pedido
    GROUP BY id_comercial
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- 18.Elimina los pedidos realizados por clientes de la categoria 100*/

DELETE FROM pedido
WHERE id_cliente IN (
    SELECT id_cliente
    FROM cliente
    WHERE categoria = 100
);
















