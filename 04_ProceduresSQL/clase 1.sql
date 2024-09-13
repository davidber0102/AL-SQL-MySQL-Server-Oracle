/*
***************** Procedures SQL: Ejecutando código en MySQL****************************************
----STORED PROCEDURES: nos permite usar logica de programacion
-- usar y crear stored procedures
------------------declarando
------------------Manipulando
------------------Control de errores
------------------Parametros
------------------Atribuir con selec into
------------------ if_then_else
------------------if then elseif
------------------ case
------------------ not fund
------------------ case condicional
------------------while
------------------ select into y cursor
------------------ cursor looping varios campos
------------------ funcion
*/

-- CONCEPTOS BASICOS

/*     ESTRUCTURA DE PROCESOS ALAMACENADOS SQL EN LA PAGINA OFICIAL
		CREATE
			[DEFINER = user]
			PROCEDURE [IF NOT EXISTS] sp_name ([proc_parameter[,...]])
			[characteristic ...] routine_body
		CREATE
			[DEFINER = user]
			FUNCTION [IF NOT EXISTS] sp_name ([func_parameter[,...]])
			RETURNS type
			[characteristic ...] routine_body
		proc_parameter:
			[ IN | OUT | INOUT ] param_name type
		func_parameter:
			param_name type
		type:
			Any valid MySQL data type
		characteristic: {
			COMMENT 'string'
		  | LANGUAGE SQL
		  | [NOT] DETERMINISTIC
		  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
		  | SQL SECURITY { DEFINER | INVOKER }
		}
		routine_body:
			SQL routine
    */

/*
		CREATE PROCEDURE
        < NOMBRE DEL PROCEDIMIENTO> (PARAMETROS)
        BEGIN
        DECLARE <DELCARACION DE VARIABLES>;
        .......
        <EJECUCIONES DEL PROCEDIMIENTOS>;
        ...... 
        END;
*/

/*                  SINTAXIS PARA NOMBRAR STORED PROCEDURES
		- DEBE TENER LETRAS, NUMEROS, '$' Y '_'
        - TAMAÑO MAXIMO DE 64 CARACTERES
        - NOMBRE DEBE SER UNICO
        - CASE SENSITIVE
*/

USE jugos_ventas;

USE `jugos_ventas`;
DROP procedure IF EXISTS `hola_mundo`;
DELIMITER $$
USE `jugos_ventas`$$
CREATE PROCEDURE `hola_mundo` ()
BEGIN
	SELECT "HOLA NUNDO DESDE MYSQL!!";
END$$
DELIMITER ;

CALL hola_mundo;
CALL muestra_numero;
CALL concatenar;
CALL CONCATENAR_CON_COMENTARIOS;
CALL CONCATENAR2;

/*
	------ VARABLES
    -- DECLARACION DE VARABLES
    
    DECLARE <nombre de la varable > <DataType> DEFAULT <value>;
    -- datatype es obligatorio. Default es opcional
    -- Debe tener letras, numeros, $ y '_'. Se puede declarar variassiempre y cuando sean del mismo tipo.
    -- tamaño maximo de 255 caracteres
    -- nombre debe ser unico con elS.P: -  Case Sensitive.
    -- Si no tiene Defailt, su valir sera NULL.alter
    -- LA LINEA DE DECLARACION FINAZLIA CON ';'
    
    - varchar(n) caracteres de texto con tamaño maximo de n caracteres
    - integer tipo enter
    - decimal(p, s) .  Variable decimal con p digitos y s casiias decimales
    - date para alamcenar una fecha
    - timestamp para alamcenar fecha y horario
*/

-- VARIABLES
CALL exhibir_variable;
call declaracion_v;
CALL atribuir_valores;

call ejercicio_1;

/*
		CREATE DEFINER=`root`@`localhost` PROCEDURE `manipulacion`()
BEGIN
		INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
				VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
				 ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
				 ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
				 ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
				 ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
				 ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
				 ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
				 ('1001007','Sabor Alpino','Melón','1 Litro','Botella',7.50),
				 ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
				 ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
				 ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
				 ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);

	SELECT * FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';
	UPDATE tabla_de_productos SET PRECIO_DE_LISTA= 5 WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';
	SELECT * FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';
	DELETE FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';
	SELECT * FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor Alp%';
END
*/

call manipulacion;


/*
		CREATE DEFINER=`root`@`localhost` PROCEDURE `incluir_producto`()
BEGIN
	DECLARE vcodigo VARCHAR(20) DEFAULT '3003001';
    DECLARE vnombre VARCHAR(50) DEFAULT 'Sabor Intenso';
    DECLARE vsabor VARCHAR(20) DEFAULT'Tutti Frutti';
    DECLARE vtamano VARCHAR(20) DEFAULT '700 ml';    
    DECLARE venvase VARCHAR(20) DEFAULT 'Botella PET';
    DECLARE vprecio DECIMAL(4,2) DEFAULT 7.25;
    
	INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
     VALUES (vcodigo, vnombre, vsabor, vtamano, venvase, vprecio);

END
*/

CALL incluir_producto;
SELECT * FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor In%';

CALL calcula_edad;
SELECT * FROM tabla_de_clientes;

/*  procedimiento almacenado de incluir y parametros
CREATE DEFINER=`root`@`localhost` PROCEDURE `incluir_producto_parametros`(vcodigo VARCHAR(20), vnombre VARCHAR(50), 
								vtamano VARCHAR(20), vsabor VARCHAR(20), venvase VARCHAR(20), vprecio DECIMAL(4,2))
BEGIN
	INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
     VALUES (vcodigo, vnombre, vsabor, vtamano, venvase, vprecio);
END
*/

CALL incluir_producto_parametros('1000800', 'Sabor del Mar',  '700 ml', 'Naranja', 'Botella de Vidrio', 2.25 );
SELECT * FROM tabla_de_productos where CODIGO_DEL_PRODUCTO = '1000800';


/* ejercio de ajustar comision de vendedores
		CREATE DEFINER=`root`@`localhost` PROCEDURE `reajuste_comision`()
			BEGIN
				UPDATE tabla_de_vendedores SET PORCENTAJE_COMISION =  PORCENTAJE_COMISION * (1 + vporcentaje);
			END
*/

CALL reajuste_comision(5);
SELECT * FROM tabla_de_vendedores;


CALL incluir_producto_parametros('1000800', 'Sabor del Mar',  '700 ml', 'Naranja', 'Botella de Vidrio', 2.25 );
SELECT * FROM tabla_de_productos where CODIGO_DEL_PRODUCTO = '1000800';

CALL incluir_producto_parametros('1000801', 'Sabor del Mar',  '700 ml', 'Naranja', 'Botella de Vidrio', 2.25 );

SELECT * FROM tabla_de_productos;
USE jugos_ventas;
/*
	CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_sabor`(vcodigo VARCHAR(20))
BEGIN
	DECLARE vsabor VARCHAR(20);
	SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
    SELECT vsabor as SABOR_PRODUCTO;
END
*/

SELECT SABOR FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = '1078680';

CALL mostrar_sabor('788975');

/*  EJERCIO PLATAFORMA
	CREATE DEFINER=`root`@`localhost` PROCEDURE `cantidad_facturas`()
		BEGIN
			DECLARE N_FACTURAS INTEGER;
				SELECT COUNT(*) INTO N_FACTURAS FROM facturas WHERE
				FECHA_VENTA = '2017-01-01';
				SELECT N_FACTURAS;
		END
*/

CALL cantidad_facturas;