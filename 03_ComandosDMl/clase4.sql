USE ventas_jugos;
SELECT * FROM tb_cliente;
SELECT * FROM tb_factura;
SELECT * FROM tb_item_factura;
SELECT * FROM tb_producto;
SELECT * FROM tb_vendedor;

-- base de datos jugos_ventas
SELECT * FROM jugos_ventas.tabla_de_clientes;
SELECT * FROM jugos_ventas.facturas;
SELECT * FROM jugos_ventas.items_facturas;
SELECT * FROM jugos_ventas.tabla_de_productos;
SELECT * FROM jugos_ventas.tabla_de_vendedores;

-- CLASE 5 COMANDO UPDATE
/*
UPDATE [LOW_PRIORITY] [IGNORE] table_reference
    SET assignment_list
    [WHERE where_condition]
    [ORDER BY ...]
    [LIMIT row_count]
value:
    {expr | DEFAULT}
assignment:
    col_name = value
assignment_list:
    assignment [, assignment] ...
    */
SELECT * FROM tb_producto;
UPDATE tb_producto SET PRECIO_LISTA= 5 WHERE CODIGO = '1000889';
UPDATE tb_producto SET DESCRIPCION = 'Sabor de la Montaña', TAMANO = '1 Litro', ENVASE = 'Botella PET' WHERE CODIGO = '1000889';

SELECT * FROM tb_cliente;
UPDATE tb_cliente SET VOLUMEN_COMPRA = VOLUMEN_COMPRA/10;

-- Actualiza la dirección del cliente con el DNI 5840119709 
-- Colocando como nueva dirección Jorge Emilio 23, barrio San Antonio, ciudad Guadalajara, Estado de Jalisco y el CP 44700000.
SELECT * FROM tb_cliente WHERE DNI = '5840119709';
UPDATE tb_cliente SET DIRECCION = 'Jorge Emilio 23', BARRIO = 'San Antonio', CIUDAD = 'Guadalajara', ESTADO = 'JC', CP = '44700000'
WHERE DNI = '5840119709';

SELECT * FROM tb_vendedor;
SELECT * FROM jugos_ventas.tabla_de_vendedores;

SELECT * FROM tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA, 3,3);

UPDATE tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA, 3,3)
SET A.DE_VACACIONES = B.VACACIONES;

--  Vamos a aumentar en 30% el volumen de compra de los clientes que tienen, 
-- en sus direcciones, barrios donde los vendedores cuentan con oficinas.
UPDATE tb_cliente A 
INNER JOIN 
tb_vendedor B
ON A.BARRIO = B.BARRIO
SET A.VOLUMEN_COMPRA = A.VOLUMEN_COMPRA * 1.3;

-- COMANDO DELETE
/*
DELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name [[AS] tbl_alias]
    [PARTITION (partition_name [, partition_name] ...)]
    [WHERE where_condition]
    [ORDER BY ...]
    [LIMIT row_count]
    */    
INSERT INTO tb_producto (CODIGO,DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA)
     VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
         ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
         ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
         ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
         ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
         ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
         ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
         ('1001007','SaboCREATE TABLE `tb_producto` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANO` varchar(50) DEFAULT NULL,
  `ENVASE` varchar(50) DEFAULT NULL,
  `PRECIO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
r Alpino','Melón','1 Litro','Botella',7.50),
         ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
         ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
         ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
         ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);
         
SELECT * FROM tb_producto WHERE DESCRIPCION = 'Sabor Alpino';

DELETE FROM tb_producto WHERE CODIGO = '1001000';
DELETE FROM tb_producto WHERE TAMANO = '1 Litro';

SELECT CODIGO_DEL_PRODUCTO FROM jugos_ventas.tabla_de_productos;

SELECT CODIGO FROM tb_producto WHERE CODIGO NOT IN (SELECT CODIGO_DEL_PRODUCTO FROM jugos_ventas.tabla_de_productos);

DELETE FROM tb_producto WHERE CODIGO NOT IN (SELECT CODIGO_DEL_PRODUCTO FROM jugos_ventas.tabla_de_productos);

-- amos a excluir las facturas (Apenas el encabezado) cuyos clientes tengan menos de 18 años.
SELECT A.DNI FROM tb_cliente A INNER JOIN tb_vendedor B ON A.BARRIO = B.BARRIO;
DELETE A FROM tb_factura A INNER JOIN tb_cliente B ON A.DNI = B.DNI WHERE B.EDAD < 18;

CREATE TABLE `tb_producto2` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANO` varchar(50) DEFAULT NULL,
  `ENVASE` varchar(50) DEFAULT NULL,
  `PRECIO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
);

SELECT * FROM tb_producto2;

INSERT INTO tb_producto2 
SELECT * FROM tb_producto;

UPDATE tb_producto2 SET PRECIO_LISTA = PRECIO_LISTA * 1.15;

DELETE FROM tb_producto2;

/* 
-----------------------aula 4: alterando y excluyendo datos existentes en las tablas
               -----------------COMMIT Y ROLLBACK
  Transaccion : unidad logica de procesamiento que busca preservar la integridad y consistncia de los datos
  START TRANSACTION
  (...)
  COMMIT | ROLLBACK
  
  -- STAR TRANSACTION: CREA UN PUNTO DE ESTADO DE LA BASE DE DATOS 
  -- COMMIT CONFIRMA Y GRABA LA INFORMACION ENTRE STAR TRANSACTIO Y COMMIT
  -- ROLBACK: RECHAZA LA INFORMACION ENTRE STAR TRANSACTIO Y ROLLBACKINSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
(<{MATRICULA: }>,
<{NOMBRE: }>,
<{BARRIO: }>,
<{COMISION: }>,
<{FECHA_ADMISION: }>,
<{DE_VACACIONES: }>);
  
  */
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`, `NOMBRE`, `BARRIO`, `COMISION`, `FECHA_ADMISION`,`DE_VACACIONES`)
VALUES ('256', 'Fernando Ruiz', 'Oblatos', 0.1 ,'2015-06-14' , 0 );

SELECT * FROM tb_vendedor;
delete FROM tb_vendedor where MATRICULA ='258';

START TRANSACTION;
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`, `NOMBRE`, `BARRIO`, `COMISION`, `FECHA_ADMISION`,`DE_VACACIONES`)
VALUES ('257', 'Fernando ROJAS', 'Oblatos', 0.1 ,'2015-06-14' , 0 );

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`, `NOMBRE`, `BARRIO`, `COMISION`, `FECHA_ADMISION`,`DE_VACACIONES`)
VALUES ('258', 'David Rojas', 'Del Valle', 0.15 ,'2015-06-14' , 0 );
ROLLBACK;
SELECT * FROM tb_vendedor;

START TRANSACTION;
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`, `NOMBRE`, `BARRIO`, `COMISION`, `FECHA_ADMISION`,`DE_VACACIONES`)
VALUES ('257', 'Fernando ROJAS', 'Oblatos', 0.1 ,'2015-06-14' , 0 );

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`, `NOMBRE`, `BARRIO`, `COMISION`, `FECHA_ADMISION`,`DE_VACACIONES`)
VALUES ('258', 'David Rojas', 'Del Valle', 0.15 ,'2015-06-14' , 0 );

UPDATE tb_vendedor SET COMISION = COMISION * 1.05;

COMMIT;