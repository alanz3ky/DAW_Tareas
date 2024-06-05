/* Ejercicio 1 Crea un procedimiento que permita llevar un registro de los movimientos de un
 usuario en sus cuentas bancarias. Es decir, cada vez que un usuario realice un
 movimiento en alguna de sus cuentas debe quedar reflejado en la tabla
 registro_movimientos. Debe validar los datos de entrada comprobando que
 corresponden a cuentas y clientes existentes, y que el saldo es suficiente cuando
 quiere retirar dinero de la cuenta. No se realizará el movimiento y se visualizarán
 mensajes de error cuando no exista el cliente, no exista la cuenta o no haya saldo
 suficiente para retirar dinero. Si se hace el movimiento, el saldo de la cuenta debe
 modificarse*/
DELIMITER //

CREATE PROCEDURE registrar_movimientos(
    IN p_dni_cliente VARCHAR(9),
    IN p_numero_cuenta VARCHAR(5),
    IN p_operacion ENUM('INGRESO', 'RETIRO'),
    IN p_cantidad DECIMAL(10,3)
)
BEGIN
    DECLARE v_id_cliente INT;
    DECLARE v_saldo_cuenta DECIMAL(10,3);
    DECLARE v_saldo_nuevo DECIMAL(10,3);

    -- Verificar si el cliente existe
    SELECT id INTO v_id_cliente FROM cliente WHERE dni = p_dni_cliente;
    IF v_id_cliente IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe';
    END IF;

    -- Verificar si la cuenta existe y pertenece al cliente
    SELECT saldo INTO v_saldo_cuenta FROM cuenta WHERE numero = p_numero_cuenta AND id_cliente = v_id_cliente;
    IF v_saldo_cuenta IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuenta no existe o no pertenece al cliente';
    END IF;

    -- Verificar saldo suficiente para retirar
    IF p_operacion = 'RETIRO' AND v_saldo_cuenta < p_cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Saldo insuficiente para retirar';
    END IF;

    -- Realizar el movimiento y actualizar saldo
    IF p_operacion = 'INGRESO' THEN
        SET v_saldo_nuevo = v_saldo_cuenta + p_cantidad;
    ELSE
        SET v_saldo_nuevo = v_saldo_cuenta - p_cantidad;
    END IF;

    -- Actualizar saldo de la cuenta
    UPDATE cuenta SET saldo = v_saldo_nuevo WHERE numero = p_numero_cuenta;

    -- Registrar el movimiento
    INSERT INTO registro_movimientos 
    (id_cliente, numero_cuenta, operacion, fecha, cantidad, saldo_antiguo, saldo_nuevo) 
    VALUES 
    (v_id_cliente, p_numero_cuenta, p_operacion, NOW(), p_cantidad, v_saldo_cuenta, v_saldo_nuevo);
    
    -- Confirmar ejecución exitosa
    SELECT 'Movimiento registrado exitosamente' AS mensaje;
END //

DELIMITER ;

-- Intento de movimiento con cuenta inexistente
CALL registrar_movimientos('32234234F', 'ES333', 'INGRESO', 500);

-- Intento de movimiento con cliente inexistente o cuenta incorrecta
CALL registrar_movimientos('32222222F', 'ES222', 'INGRESO', 500);

-- Intento de retiro con saldo insuficiente
CALL registrar_movimientos('32234234F', 'ES111', 'RETIRO', 2000);

-- Ingreso exitoso
CALL registrar_movimientos('32234234F', 'ES111', 'INGRESO', 500);

-- Retiro exitoso
CALL registrar_movimientos('32234234F', 'ES111', 'RETIRO', 300);


 /* Ejercicio 2  Crea una función que reciba el dni y el número de cuenta de un cliente y devuelva
 el saldo de la cuenta.
 Comprueba su funcionamiento. Debe mostrar un mensaje del tipo ‘Algún dato es
 incorrecto’ cuando el cliente o la cuenta no existan, o el saldo cuando la cuenta sea
 de un cliente */
 
 DELIMITER //

CREATE FUNCTION obtener_saldo(
    p_dni_cliente VARCHAR(9),
    p_numero_cuenta VARCHAR(5)
)
RETURNS DECIMAL(10,3)
BEGIN
    DECLARE v_id_cliente INT;
    DECLARE v_saldo DECIMAL(10,3);

    -- Verificar si el cliente existe
    SELECT id INTO v_id_cliente FROM cliente WHERE dni = p_dni_cliente;
    IF v_id_cliente IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe';
    END IF;

    -- Verificar si la cuenta existe y pertenece al cliente
    SELECT saldo INTO v_saldo FROM cuenta WHERE numero = p_numero_cuenta AND id_cliente = v_id_cliente;
    IF v_saldo IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuenta no existe o no pertenece al cliente';
    END IF;

    RETURN v_saldo;
END //

DELIMITER ;

-- Comprobar con datos válidos
SELECT obtener_saldo('32234234F', 'ES111'); -- Debería devolver el saldo de la cuenta ES111

-- Comprobar con datos inválidos
SELECT obtener_saldo('32234234F', 'ES333'); -- Debería mostrar "La cuenta no existe o no pertenece al cliente"


 /*  3. Utiliza disparadores para llevar un registro de los movimientos de los usuarios en
 sus cuentas bancarias. El movimiento no se realizará cuando no haya saldo
 suficiente para retirar la cantidad solicitada. En este caso se visualizará un mensaje
 del tipo: signal sqlstate '23000' set message_text = 'No hay saldo suficiente para
 1
retirar la cantidad solicitada'. Los movimientos deben quedar reflejados en la tabla
 registro_movimientos*/
 
 DELIMITER //

CREATE TRIGGER movimiento_cuenta
BEFORE INSERT ON registro_movimientos
FOR EACH ROW
BEGIN
    DECLARE v_saldo_cuenta DECIMAL(10,3);

    -- Obtener el saldo de la cuenta afectada por el movimiento
    SELECT saldo INTO v_saldo_cuenta FROM cuenta 
    WHERE numero = NEW.numero_cuenta AND id_cliente = NEW.id_cliente;

    -- Verificar si hay saldo suficiente para retirar
    IF NEW.operacion = 'RETIRO' AND v_saldo_cuenta < NEW.cantidad THEN
        SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'No hay saldo suficiente para retirar la cantidad solicitada';
    END IF;
END //

DELIMITER ;

-- Intento de retiro con saldo insuficiente 
INSERT INTO registro_movimientos 
(id_cliente, numero_cuenta, operacion, fecha, cantidad, saldo_antiguo, saldo_nuevo) 
VALUES 
(1, 'ES111', 'RETIRO', NOW(), 2000, 1000, 1000);

-- Ingreso exitoso 
INSERT INTO registro_movimientos 
(id_cliente, numero_cuenta, operacion, fecha, cantidad, saldo_antiguo, saldo_nuevo) 
VALUES 
(1, 'ES111', 'INGRESO', NOW(), 500, 1000, 1500);

-- Retiro exitoso
INSERT INTO registro_movimientos 
(id_cliente, numero_cuenta, operacion, fecha, cantidad, saldo_antiguo, saldo_nuevo) 
VALUES 
(1, 'ES111', 'RETIRO', NOW(), 300, 1500, 1200);


 
 /*  4. Crea un evento que a las 8:00 de cada día registre en una tabla cuantos clientes
 tienen un saldo mayor de 1000€ en alguna de sus cuentas. Para ello debes crear
 una tabla registro_clientes_saldo_alto donde se guarde para cada día la fecha y el
 número de clientes que cumplen esa condición.
 Comprueba su funcionamiento */
 
-- Crear la tabla registro_clientes_saldo_alto si no existe
CREATE TABLE IF NOT EXISTS registro_clientes_saldo_alto (
    fecha DATE,
    num_clientes_con_saldo_alto INT,
    PRIMARY KEY (fecha)
);

-- Crear el evento para registrar clientes con saldo alto
DELIMITER //

CREATE EVENT IF NOT EXISTS registro_saldo_alto_diario
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURRENT_DATE, '8:00:00')
DO
BEGIN
    DECLARE num_clientes_saldo_alto INT;

    -- Contar el número de clientes con saldo alto
    SELECT COUNT(DISTINCT c.id) INTO num_clientes_saldo_alto
    FROM cliente c
    JOIN cuenta cu ON c.id = cu.id_cliente
    WHERE cu.saldo > 1000;

    -- Insertar el registro en la tabla registro_clientes_saldo_alto
    INSERT INTO registro_clientes_saldo_alto (fecha, num_clientes_con_saldo_alto)
    VALUES (CURRENT_DATE, num_clientes_saldo_alto);
END //

DELIMITER 

SHOW EVENTS;




 