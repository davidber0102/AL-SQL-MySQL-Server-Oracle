CREATE DATABASE jugos_ventas;

USE jugos_ventas;

SELECT * FROM facturas;
SELECT * FROM items_facturas;
SELECT * FROM tabla_de_clientes;
SELECT * FROM tabla_de_productos;
SELECT * FROM tabla_de_vendedores;
-- TABLA DE CLIENTES, 
SELECT DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, 
		EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA 
	FROM tabla_de_clientes;
SELECT * FROM tabla_de_clientes;
SELECT DNI, NOMBRE, CIUDAD, ESTADO	FROM tabla_de_clientes;
SELECT DNI AS IDENTIFICACION, NOMBRE AS CLIENTE, CIUDAD, ESTADO	FROM tabla_de_clientes;

-- TABLA DE PRODUCTOS
SELECT * FROM tabla_de_productos;
SELECT CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA FROM tabla_de_productos;

SELECT * FROM tabla_de_productos WHERE SABOR = 'Uva';
SELECT * FROM tabla_de_productos WHERE SABOR = 'Mango';

SELECT * FROM tabla_de_productos WHERE ENVASE= 'Botella PET';
SELECT * FROM tabla_de_productos WHERE ENVASE= 'botella pet';

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA > 16;
SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA <= 16;

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA BETWEEN 16 AND 17;


(NOT ((3 > 2) OR (4 >= 5)) AND (5 > 4) ) OR (9 > 0)
(NOT ((V) OR (F)) AND (V) ) OR (V)
(NOT (V) AND (V)  OR (V)
(NOT (V) OR (V)
NOT (V)
F

(NOT ((3 > 2) OR (4 >= 5)) AND (5 > 4) ) OR (9 > 0)
(NOT ((V) OR (F)) AND (V) ) OR (V)
(NOT (V) AND (V) ) OR (V)
(Falso AND Verdadero) OR (Verdadero)
(Falso) OR (Verdadero)
Verdadero

-- 08  Aplicando consultas condicionales
SELECT * FROM tabla_de_productos;

SELECT * FROM tabla_de_productos WHERE SABOR = 'Mango' AND TAMANO = '470 ml';

SELECT * FROM tabla_de_productos WHERE SABOR = 'Mango' OR TAMANO = '470 ml';

SELECT * FROM tabla_de_productos WHERE NOT (SABOR = 'Mango') OR TAMANO = '470 ml';

SELECT * FROM tabla_de_productos WHERE NOT((SABOR = 'Mango') OR (TAMANO = '470 ml'));

SELECT * FROM tabla_de_productos WHERE SABOR = 'Mango' AND NOT(TAMANO = '470 ml');

SELECT * FROM tabla_de_productos WHERE SABOR IN ('MANGO', 'UVA');
SELECT * FROM tabla_de_productos WHERE SABOR ='MANGO' OR SABOR = 'UVA';

-- TABLA CLIENTES
SELECT * FROM tabla_de_clientes;
SELECT * FROM tabla_de_clientes WHERE CIUDAD IN('Ciudad de México', 'Guadalajara');

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN('Ciudad de México', 'Guadalajara') AND EDAD > 21;

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN('Ciudad de México', 'Guadalajara') AND EDAD BETWEEN 20 AND 25;

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN('Ciudad de México', 'Guadalajara') AND (EDAD BETWEEN 20 AND 25);

-- USO DE LIKE
-- SELECT * FROM TB WHERE CAMPO LIKE '%<condicion>';
SELECT * FROM tabla_de_productos;

SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana';

SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana' and ENVASE = 'botella pet';

SELECT * FROM tabla_de_clientes WHERE NOMBRE LIKE '%ez';



