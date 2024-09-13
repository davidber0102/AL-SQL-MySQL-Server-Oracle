-- *************************************************************************
--  **************** CONTROL DE FLUJO CLASE 4*******************************
-- IF THEN ELSE

/*
	IF <condition>  THEN
		<if_statements>;
	ELSE
		<ELSE_STATEMENTS>;
	END IF;
*/
SELECT * FROM facturas;
SELECT * FROM items_facturas;
SELECT * FROM tabla_de_clientes;
SELECT * FROM tabla_de_productos;
SELECT * FROM tabla_de_vendedores;

SELECT FECHA_DE_NACIMIENTO FROM tabla_de_clientes where DNI = '1471156710';
/*
	CREATE DEFINER=`root`@`localhost` PROCEDURE `edad_clientes`(vdni VARCHAR(20))
BEGIN
	DECLARE vresultado VARCHAR(50);
    DECLARE vfecha DATE;
	
    SELECT FECHA_DE_NACIMIENTO INTO vfecha FROM tabla_de_clientes where DNI =vdni;    
		IF 
			vfecha < '19950101'
        THEN 
			SET vresultado = 'Cliente CON Experiencia.';
        ELSE
			SET vresultado = 'Cliente SIN Experiencia.';
        END IF;       
        
        SELECT vresultado;
END
*/
CALL edad_clientes('1471156710');
CALL edad_clientes(94387575700);

-- CALUCALR EL NUMERO DE FACTURAS BASO EN LA FECHA
SELECT COUNT(*) FROM facturas WHERE FECHA_VENTA = '2015-01-01';
/*
			CREATE DEFINER=`root`@`localhost` PROCEDURE `evaluacion_facturas`(IN vfecha DATE)
		BEGIN
			DECLARE mensaje VARCHAR(50);
			DECLARE N_FACTURAS INTEGER;
			SELECT COUNT(*) INTO N_FACTURAS FROM facturas WHERE FECHA_VENTA = vfecha;
				IF N_FACTURAS > 70
				THEN SET mensaje = 'Muchas facturas' ;
				ELSE SET mensaje = 'Pocas facturas' ;
				END IF;
			SELECT mensaje AS NUM_FAC ;
END
*/

CALL evaluacion_facturas('2015-01-01');
-- IF THEN ELSEIF

/*
	IF <condition>  THEN
		<if_statements>;
	ELSEIF <condition> 
		<ELSEIF_STATEMENTS>;
	(.....)
    ELSEIF <condition> 
		<ELSEIF_STATEMENTS>;
	ELSE
		<ELSE_STATEMENTS>;
	END IF;
*/

SELECT * FROM facturas;
SELECT * FROM items_facturas;
SELECT * FROM tabla_de_clientes;
SELECT * FROM tabla_de_productos;

SELECT CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, ENVASE FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO = 'Clean' AND ENVASE = 'Botella PET' ;

/*
	PRECIO > 12 = PRODUCTO COSTOSO
    PRECIO > 7 Y PRECIO < 12 =  PRODUCTO ACCESIBLE
    PRECIO < 7  =  PRODCUTO BARATO
*/
SELECT * FROM tabla_de_productos;

SELECT PRECIO_DE_LISTA FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = '1000800';
/*
	CREATE DEFINER=`root`@`localhost` PROCEDURE `nprecio_producto`(vcodigo VARCHAR(20))
BEGIN
	DECLARE vresultado VARCHAR(40);
    DECLARE vprecio FLOAT;
		SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;        
        IF
			vprecio >=12
		THEN 
			SET vresultado = 'Producto costoso';
        ELSEIF
			vprecio >= 7 AND vprecio < 12
		THEN 
			SET vresultado = 'Producto Asequiable';
        ELSE
			SET vresultado = 'Producto Barato';
        END IF;        
        SELECT vresultado;
END
*/

CALL nprecio_producto('1000800');

CALL nprecio_producto(1004327);

CALL nprecio_producto(1101035);


SELECT SUM(B.CANTIDAD * B.PRECIO) AS TOTAL_VENTA FROM facturas A 
INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = '20170301';
/*
CREATE PROCEDURE `comparacion_ventas` (vfecha1 DATE, vfecha2 DATE)
BEGIN
		DECLARE facturacion_inicial FLOAT;
		DECLARE facturacion_final FLOAT;
		DECLARE variacion float;
		SELECT SUM(B.CANTIDAD * B.PRECIO) INTO facturacion_inicial  FROM 
		facturas A INNER JOIN items_facturas B
		ON A.NUMERO = B.NUMERO
		WHERE A.FECHA_VENTA = vfecha1;
		SELECT SUM(B.CANTIDAD * B.PRECIO) INTO facturacion_final  FROM 
		facturas A INNER JOIN items_facturas B
		ON A.NUMERO = B.NUMERO
		WHERE A.FECHA_VENTA = vfecha2;
		SET variacion = ((facturacion_final / facturacion_inicial) -1) * 100;
		IF variacion > 10 THEN
		SELECT 'Verde';
		ELSEIF variacion >= -10 AND variacion <= 10 THEN
		SELECT 'Amarillo';
		ELSE
		SELECT 'Rojo';
		END IF;
END
*/
SELECT * FROM facturas;
SELECT * FROM items_facturas;

CALL comparacion_ventas('2015-01-01', '2015-01-05');

SHOW VARIABLES WHERE VARIABLE_NAME IN('hostname', 'port');

/*   CONTROL DE FLUJO CASE
	CASE case_value
    WHEN when_value THEN statement_list
    [WHEN when_value THEN statement_list] ...
    [ELSE statement_list]
END CASE

	CASE
    WHEN search_condition THEN statement_list
    [WHEN search_condition THEN statement_list] ...
    [ELSE statement_list]
END CASE

*/
SELECT * FROM facturas;
SELECT * FROM items_facturas;
SELECT * FROM tabla_de_clientes;
SELECT * FROM tabla_de_productos;

SELECT distinct SABOR, COUNT(SABOR) FROM tabla_de_productos
GROUP BY SABOR;
/*
	'Maracuyá' Rico
	'Limón' Rico
	'Frutilla' Rico
    Uva Rico
	Sandia Normal
	Mango Normal
    Resto Comunes
*/

SELECT distinct SABOR FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = '1013793';
/*
		CREATE DEFINER=`root`@`localhost` PROCEDURE `define_Sabor`(vcodigo VARCHAR(20))
BEGIN
	DECLARE vsabor VARCHAR(20);
		SELECT distinct SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;        
			CASE vsabor 
				WHEN 'Maracuyá' THEN SELECT 'Muy Rico';
				WHEN 'Limón' THEN SELECT 'Muy Rico';
                WHEN 'Frutilla' THEN SELECT 'Muy Rico';
                WHEN 'Uva' THEN SELECT 'Muy Rico'; 
                WHEN 'Sandía' THEN SELECT 'Normal';
                WHEN 'Sandía' THEN SELECT 'Normal';
                ELSE SELECT 'Jugos Comunes';
                END CASE;
END
*/

CALL define_Sabor(1051518);

SELECT distinct SABOR, CODIGO_DEL_PRODUCTO FROM tabla_de_productos;

/*
	CREATE DEFINER=`root`@`localhost` PROCEDURE `define_Sabor_Errores`(vcodigo VARCHAR(20))
BEGIN
	DECLARE vsabor VARCHAR(20);
    DECLARE mensajeError VARCHAR(50);
    DECLARE CONTINUE HANDLER FOR 1339
    SET mensajeError = 'SAbor NO definido en ningun caso';
		SELECT distinct SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;        
			CASE vsabor 
				WHEN 'Maracuyá' THEN SELECT 'Muy Rico';
				WHEN 'Limón' THEN SELECT 'Muy Rico';
                WHEN 'Frutilla' THEN SELECT 'Muy Rico';
                WHEN 'Uva' THEN SELECT 'Muy Rico'; 
                WHEN 'Sandía' THEN SELECT 'Normal';
                WHEN 'Sandía' THEN SELECT 'Normal';
                END CASE;
                SELECT mensajeError;
END
*/


 CALL define_Sabor_Errores(1000801);
 
 DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precio_productoCASE`(vcodigo VARCHAR(20))
BEGIN
	DECLARE vresultado VARCHAR(40);
    DECLARE vprecio FLOAT;
		SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;   
        
        CASE 
			WHEN vprecio >=12 THEN 	SET vresultado = 'Producto costoso';
            WHEN vprecio >= 7 AND vprecio < 12 THEN SET vresultado = 'Producto Asequiable';	
            WHEN vprecio < 7 THEN SET vresultado = 'Producto Barato';
		END CASE;
        SELECT vresultado;
END $$


CALL precio_productoCASE('1000800');
CALL precio_productoCASE(1004327);
CALL precio_productoCASE(1101035);


DELIMITER $$
CREATE PROCEDURE `comparacion_ventas_case`(vfecha1 DATE, vfecha2 DATE)
BEGIN
	DECLARE facturacion_inicial FLOAT;
	DECLARE facturacion_final FLOAT;
	DECLARE variacion float;
	DECLARE mensaje VARCHAR(20);
		SELECT SUM(B.CANTIDAD * B.PRECIO) INTO facturacion_inicial  FROM facturas A INNER JOIN items_facturas B
		ON A.NUMERO = B.NUMERO		WHERE A.FECHA_VENTA = vfecha1; 
        
		SELECT SUM(B.CANTIDAD * B.PRECIO) INTO facturacion_final  FROM 		facturas A INNER JOIN items_facturas B
		ON A.NUMERO = B.NUMERO		WHERE A.FECHA_VENTA = vfecha2;
        
		SET variacion = ((facturacion_final / facturacion_inicial) -1) * 100;
        
			CASE
			WHEN variacion > 10 THEN SET mensaje = 'Verde';
			WHEN variacion >= -10 AND variacion <= 10 THEN SET mensaje = 'Amarillo';
			WHEN varacion < -10 THEN SET mensaje = 'Rojo';
			END CASE;
		SELECT mensaje;
END $$

CALL comparacion_ventas_case('2015-01-01', '2015-01-05');

/*        CONTROL DE FLUJO WHILE
		[begin_label:] 
			WHILE search_condition DO
			statement_list
			END WHILE 
		[end_label]
*/

CREATE TABLE tb_looping(ID INT);

select * from tb_looping;


DELIMITER $$
CREATE PROCEDURE `looping` (vinicial INT, vfinal INT)
BEGIN
	DECLARE vcontador INT;
    DELETE FROM tb_looping;
    SET vcontador = vinicial;		
			WHILE vcontador <= vinicial
				DO INSERT INTO tb_looping VALUE(vcontador);
                SET vcontador = vcontador +1;
            END WHILE;            
	SELECT * FROM tb_looping;
END$$

CALL looping2(1,10);

SELECT ADDDATE(FECHA_VENTA, INTERVAL 1 DAY);

CALL suma_dias_facturas;