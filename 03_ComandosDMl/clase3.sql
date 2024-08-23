-- CLASE 3. INCLUYENDO DAYOS EN LAS TABLAS
/* 
	INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
		[INTO] tbl_name
		[PARTITION (partition_name [, partition_name] ...)]
		[(col_name [, col_name] ...)]
		{ {VALUES | VALUE} (value_list) [, (value_list)] ... }
		[AS row_alias[(col_alias [, col_alias] ...)]]
		[ON DUPLICATE KEY UPDATE assignment_list]

	INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
		[INTO] tbl_name
		[PARTITION (partition_name [, partition_name] ...)]
		SET assignment_list
		[AS row_alias[(col_alias [, col_alias] ...)]]
		[ON DUPLICATE KEY UPDATE assignment_list]

	INSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]
		[INTO] tbl_name
		[PARTITION (partition_name [, partition_name] ...)]
		[(col_name [, col_name] ...)]
		{ SELECT ... 
		  | TABLE table_name 
		  | VALUES row_constructor_list
		}
		[ON DUPLICATE KEY UPDATE assignment_list]
*/
SELECT * FROM tb_cliente;
SELECT * FROM tb_factura;
SELECT * FROM tb_item_factura;
SELECT * FROM tb_producto;
SELECT * FROM tb_vendedor;

USE ventas_jugos;
INSERT INTO tb_producto (CODIGO, DESCRIPCION, SABOR, TAMANO, ENVASE, PRECIO_LISTA) 
	VALUES ('1040107', 'Light' , 'Sandia', '350 ml', 'Lata', 4.56);
    
-- 
INSERT INTO tb_producto (CODIGO, SABOR, DESCRIPCION, TAMANO, ENVASE, PRECIO_LISTA) 
	VALUES ('1040108', 'Guanabana', 'Light' ,'350 ml', 'Lata', 4.00);
    
INSERT INTO tb_producto VALUES 
	('1040110', 'Light' , 'Asai', '350 ml', 'Lata', 5.60),
    ('1040111', 'Light' , 'Manzana', '350 ml', 'Lata', 6.00), 
    ('1040112', 'Light' , 'Mango', '350 ml', 'Lata', 3.50);
    
/*
	DNI: 9283760794, NOMBRE: Edson Calisaya, DIRECCION: Sta Úrsula Xitla, BARRIO: Barrio del Niño Jesús, CIUDAD: Ciudad de México, ESTADO: EM, CP: 22002002, FECHA DE NACIMIENTO: 1995-01-07, EDAD: 25, SEXO: M, LIMITE DE CREDITO: 150000, VOLUMEN DE COMPRA: 250000, PRIMERA COMPRA: Sí.
	DNI: 7771579779, NOMBRE: Marcelo Perez, DIRECCION: F.C. de Cuernavaca 13, BARRIO: Carola, CIUDAD: Ciudad de México, ESTADO: EM, CP: 88202912, FECHA DE NACIMIENTO: 1992-01-25, EDAD: 29, SEXO: M, LIMITE DE CREDITO: 70000, VOLUMEN DE COMPRA: 160000, PRIMERA COMPRA: Sí.
	DNI: 5576228758, NOMBRE: Patricia Olivera, DIRECCION: Pachuca 75, BARRIO: Condesa, CIUDAD: Ciudad de México, ESTADO: EM, CP: 88192029, FECHA DE NACIMIENTO: 1995-01-14 , EDAD: 25, SEXO: F, LIMITE DE CREDITO: 70000, VOLUMEN DE COMPRA: 160000, PRIMERA COMPRA: Sí.
*/

USE ventas_jugos;
INSERT INTO tb_cliente (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) VALUES ('9283760794', 'Edson Calisaya', 'Sta Úrsula Xitla', 'Barrio del Niño Jesús', 'Ciudad de México', 'EM', '22002002', '1995-01-07', 25, 'M', 150000, 250000, 1);
INSERT INTO tb_cliente (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) VALUES ('7771579779', 'Marcelo Perez', 'F.C. de Cuernavaca 13', 'Carola', 'Ciudad de México', 'EM', '88202912', '1992-01-25', 29, 'M', 120000, 200000, 1);
INSERT INTO tb_cliente (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) VALUES ('5576228758', 'Patricia Olivera', 'Pachuca 75',  'Condesa', 'Ciudad de México', 'EM', '88192029', '1995-01-14', 25, 'F', 70000, 160000, 1);

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

SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION, SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA 
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

SELECT * FROM tb_producto;

INSERT INTO tb_producto 
SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION, SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA 
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

SELECT * FROM jugos_ventas.tabla_de_clientes;

SELECT * FROM tb_cliente;

SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO AS FECHA_NACIMIENTO, EDAD, SEXO, 
LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA, PRIMERA_COMPRA
 FROM jugos_ventas.tabla_de_clientes
 WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);
 
 USE ventas_jugos;
 
 INSERT INTO tb_cliente
 SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO AS FECHA_NACIMIENTO, EDAD, SEXO, 
LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA, PRIMERA_COMPRA
 FROM jugos_ventas.tabla_de_clientes
 WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);
 
 -- INSERTAR DESDE ARCHIVO CSV
 SELECT * FROM tb_vendedor;