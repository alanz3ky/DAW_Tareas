/*
1-a
*/
DELIMITER //

CREATE PROCEDURE MostrarPedidosPorComision(IN comisionLimite DECIMAL(5,2))
BEGIN
    DECLARE num_comerciales INT;

    SELECT COUNT(*)
    INTO num_comerciales
    FROM comercial
    WHERE comision < comisionLimite;

    IF num_comerciales = 0 THEN
        SELECT 'No hay comerciales con una comisión menor que el valor especificado.' AS Aviso;
    ELSE
        SELECT c.id, c.nombre, c.apellido1, c.apellido2, c.comision, COUNT(p.id) AS numero_pedidos
        FROM comercial c
        LEFT JOIN pedido p ON c.id = p.id_comercial
        WHERE c.comision < comisionLimite
        GROUP BY c.id, c.nombre, c.apellido1, c.apellido2, c.comision
        ORDER BY numero_pedidos DESC;
    END IF;
END //

DELIMITER ;


/*
2.b 
*/
CALL MostrarPedidosPorComision(0.12);
CALL MostrarPedidosPorComision(0.02);



/* 2A
*/

DELIMITER //

CREATE PROCEDURE ListarPedidosPorCiudad(IN ciudadCliente VARCHAR(100))
BEGIN
    DECLARE num_ciudades INT;

    SELECT COUNT(*)
    INTO num_ciudades
    FROM cliente
    WHERE ciudad = ciudadCliente;

    IF num_ciudades = 0 THEN
        SELECT 'No hay clientes en la ciudad especificada.' AS Aviso;
    ELSE
        SELECT p.id AS id_pedido, p.total, p.fecha, cl.nombre AS cliente_nombre, cl.apellido1 AS cliente_apellido1, cl.apellido2 AS cliente_apellido2,
               com.nombre AS comercial_nombre, com.apellido1 AS comercial_apellido1, com.apellido2 AS comercial_apellido2
        FROM pedido p
        JOIN cliente cl ON p.id_cliente = cl.id
        JOIN comercial com ON p.id_comercial = com.id
        WHERE cl.ciudad = ciudadCliente
        ORDER BY p.fecha;
    END IF;
END //

DELIMITER ;


/*
b)Usar el procedimiento para mostrar los pedidos que hicierion los clientes de sevilla , y los de lugo , y quienes son los comerciales que los gestionan 

*/
CALL ListarPedidosPorCiudad('Sevilla');
CALL ListarPedidosPorCiudad('Lugo');



/*3A
*/


DELIMITER //

CREATE FUNCTION SubirComision(comision DECIMAL(5,2)) RETURNS VARCHAR(2)
BEGIN
    IF comision <= 0.12 THEN
        RETURN 'SI';
    ELSE
        RETURN 'NO';
    END IF;
END //

DELIMITER ;

SHOW FUNCTION STATUS LIKE 'SubirComision';


/*
Debes utilizar funciones y comprobar el resultado ¨*/
SELECT nombre, apellido1, apellido2, comision, comision AS subir_comision
FROM comercial;


/*4-A 
*/
DELIMITER //

CREATE FUNCTION ClientesConUnApellido() RETURNS INT
BEGIN
    DECLARE numClientes INT;

    SELECT COUNT(*)
    INTO numClientes
    FROM cliente
    WHERE apellido2 IS NULL;

    RETURN numClientes;
END //

DELIMITER ;

/*
b)Utilizar la funcion para comprobarlo
*/

SELECT ClientesConUnApellido() AS num_clientes_un_apellido;


/*5 

a)

*/

DELIMITER //

CREATE TRIGGER IncrementarCategoriaDespuesDePedido
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
    DECLARE numPedidos INT;

    SELECT COUNT(*)
    INTO numPedidos
    FROM pedido
    WHERE id_cliente = NEW.id_cliente;

    IF numPedidos > 3 THEN
        UPDATE cliente
        SET categoria = categoria + 1
        WHERE id = NEW.id_cliente;
    END IF;
END //

DELIMITER ;

/*
b)Comprueba el funcionamiento del disparador 
*/

INSERT INTO pedido (total, fecha, id_cliente, id_comercial)
VALUES (100.00, CURDATE(), 1, 2);


/* 6 a)
*/

DELIMITER //

CREATE TRIGGER NoDisminuirComision
BEFORE UPDATE ON comercial
FOR EACH ROW
BEGIN
    IF NEW.comision < OLD.comision THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: La comisión nunca puede disminuir, Modifica la comisión';
    END IF;
END //

DELIMITER ;

/*
b)Compruebalo disminuyendo en 0,10 la comision de Alfredo ruiz Flores que tiene un 0,05 de comision 
*/

UPDATE comercial
SET comision = 0.10
WHERE nombre = 'Alfredo' AND apellido1 = 'Ruiz' AND apellido2 = 'Flores';


/*7
*/

DELIMITER //

CREATE EVENT ActualizarCategoriaClientesSinCategoria
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 5 MINUTE
DO
BEGIN
    UPDATE cliente
    SET categoria = 100
    WHERE categoria IS NULL AND id IN (SELECT id_cliente FROM pedido);
END //

DELIMITER ;


/*
Explica cual seria el funcionamiento de la siguiente sentencia 

mysqldump -u root -p --databases ventas > c:\Bases\bd.sql 


- El comando `mysqldump` crea un archivo de respaldo en formato SQL.
- Proporocionar las credenciales de acceso a la base de datos, como el nombre de usuario (-u) y la contraseña (-p).
- El operador > se utiliza para redirigir la salida del comando hacia un archivo específico.
- El archivo "bd.sql" contendrá todas las instrucciones SQL necesarias para recrear la estructura de tablas, datos y otros objetos de la base de datos "ventas".
- Para restaurar la base de datos desde el archivo de respaldo, utilizar el comando mysql junto con la opción -u para el usuario y -p para la contraseña.
- Luego, ejecutando el script "bd.sql" puedes recrear la base de datos original.

*/


