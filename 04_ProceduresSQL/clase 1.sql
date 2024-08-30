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