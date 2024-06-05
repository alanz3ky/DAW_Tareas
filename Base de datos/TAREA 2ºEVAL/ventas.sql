/*Alan E. Matia Carles


/*Crea la base de datos ventas con  las tablas con las restriciciones resultantes del diagrama ER y modelo relacion , la base de datos ventas y las tablas con la columna comercial que tiene como datos ( id de tipo INT, nombre , apellido1 y apellido2 son de tipo varchar(100)
y la comision decimal(3,2 ) , la columna pedido con id int , total de tipo double , fecha de tipo date , id_cliente de tipo Int y la id_comercial de tipo int
y la tabla cliente con id de tipo INT , nombre , apellido1 y apellido2 y ciudad son de tipo varchar(100) y la categoria de tipo Int
*/

CREATE database ventas;


-- Crear la tabla 'comercial'
CREATE TABLE comercial (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    comision DECIMAL(3 , 2 )
);

-- Crear la tabla 'pedido'
CREATE TABLE pedido (
    id INT PRIMARY KEY,
    total DOUBLE,
    fecha DATE,
    id_cliente INT,
    id_comercial INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

-- Crear la tabla 'cliente'
CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    ciudad VARCHAR(100),
    categoria INT
);
