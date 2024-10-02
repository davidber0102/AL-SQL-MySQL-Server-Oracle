/*
		CLASE 3 FUNCION CLIENTE ALEATORIO EN TABLA CLIENTES 
*/
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM vendedores;
SELECT * FROM facturas;
SELECT * FROM items;


SELECT COUNT(*) FROM clientes;

SELECT * FROM clientes;
SELECT * FROM clientes LIMIT 5;

SELECT * FROM clientes LIMIT 16,1;

SELECT * FROM clientes LIMIT 5,1;

SELECT * FROM clientes LIMIT 0,1;


/*		FUNCION DE DEVUELVE DNI ALAETORIO DE LA TABLA DE CLIENTES

		CREATE FUNCTION `f_cliente_aleatorio` ()
		RETURNS VARCHAR(11)
		BEGIN
			DECLARE vresultado VARCHAR(11);
			DECLARE vmax INT;
			DECLARE min INT; 
			DECLARE valeatorio INT;
			SELECT COUNT(*) INTO vmax FROM clientes;
			SET valeatorio = f_aleatorio(1, vmax);
			SET valeatorio = valeatorio  - 1;
			
			SELECT DNI INTO valeatorio FROM clientes LIMIT valeatorio, 1;
			
		RETURN vresultado;
		END
*/

SELECT f_cliente_aleatorio() AS CLIENTE;

DELIMITER //
CREATE FUNCTION `f_producto_aleatorio`() 
RETURNS varchar(10) 
BEGIN
DECLARE vresultado VARCHAR(10);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM productos;
SET valeatorio = f_aleatorio(1,vmax);
SET valeatorio = valeatorio-1;
SELECT CODIGO INTO vresultado FROM productos LIMIT valeatorio,1;
RETURN vresultado;
END //


DELIMITER //
CREATE FUNCTION `f_vendedor_aleatorio`() 
RETURNS varchar(5) 
BEGIN
DECLARE vresultado VARCHAR(5);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM vendedores;
SET valeatorio = f_aleatorio(1,vmax);
SET valeatorio = valeatorio-1;
SELECT MATRICULA INTO vresultado FROM vendedores LIMIT valeatorio,1;
RETURN vresultado;
END //