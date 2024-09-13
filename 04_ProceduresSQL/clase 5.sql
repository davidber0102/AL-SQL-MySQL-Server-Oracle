/*  calse 5 cursor y funcion
		--- PROBLEMA CON SELECT INTO
*/
SELECT * FROM facturas;
SELECT * FROM items_facturas;
SELECT * FROM tabla_de_clientes;
SELECT * FROM tabla_de_productos;

CALL nproblema_select_into;

/*
			CURSOR Y FUNCION
            DEFINICION DE CURSOR:
				ES UNA ESTRUCTURA IMPLEMENTADA EN MYSQL QUE PERMITE LA INTERACION LINEA POR LINEA MEDIANTE UN ORDE DETERMINADO
			FASES PARA USOS DEL CURSOS:
				DECLARACION ---- dEFINIR LA CONSULTA QUE SERA DEPOSITADA EN EL CURSOR.
                ABERTURA ---  ABRIMOS EL CURSOR PARA RECORRERLO UNA LINEA A LA VEZ
                RECORRODP --- LIENA PO LIENA HASTA EL FINAL
                CIERRRE --- CERRAMOES EL CURSOR
                LIMPIAR --- LIMPIA EL CURSOR DE LA MEMPORIA
*/

/*
	CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor1`()
		BEGIN
			DECLARE vnombre VARCHAR(50);
			
			DECLARE c CURSOR FOR SELECT NOMBRE FROM tabla_de_clientes LIMIT 4;
			OPEN c;
			-- 1
			FETCH c INTO vnombre;    
			SELECt vnombre;
			
			-- 2
			FETCH c INTO vnombre;    
			SELECt vnombre;
			
			-- 3
			FETCH c INTO vnombre;    
			SELECt vnombre;
			
			-- 4
			FETCH c INTO vnombre;    
			SELECt vnombre;
			
			CLOSE c;
		END
*/

CALL cursor1;

/*
			CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping`()
		BEGIN
			DECLARE fin_c INT DEFAULT 0;
			DECLARE vnombre VARCHAR(50);    
			DECLARE c CURSOR FOR SELECT NOMBRE FROM tabla_de_clientes;
			DECLARE CONTINUE HANDLER FOR NOT FOUND
			SET fin_C = 1;    
			OPEN c;    -- 1    
			WHILE fin_c = 0
				DO
					FETCH c INTO vnombre;    
					
					IF fin_c = 0
						THEN SELECt vnombre;   
					END IF;
			END WHILE;       
			CLOSE c;
		END
*/

CALL cursor_looping;

CALL limite_creditos;


SELECT * FROM tabla_de_clientes;

/*
			CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping_carios_campos`()
		BEGIN
			DECLARE fin_c INT DEFAULT 0;
			DECLARE vbarrio, vciudad, vestado,  vcp VARCHAR(50);
			DECLARE vnombre, vdireccion VARCHAR(150);    
			DECLARE c CURSOR FOR SELECT NOMBRE, DIRECCION_1, BARRIO, CIUDAD, ESTADO, CP FROM tabla_de_clientes;
			DECLARE CONTINUE HANDLER FOR NOT FOUND
			SET fin_C = 1;    
			OPEN c;    -- 1    
			WHILE fin_c = 0
				DO
					FETCH c INTO vnombre   , vdireccion, vbarrio, vciudad, vestado, vcp ;
					
					IF fin_c = 0
						THEN SELECt CONCAT(vnombre, 'Direccion: ', vdireccion, '- ', vbarrio, '- ', vciudad,  '- ', vestado, '- ', vcp);   
					END IF;
			END WHILE;       
			CLOSE c;

		END
*/

CALL cursor_looping_carios_campos;

/*
	CREATE DEFINER=`root`@`localhost` PROCEDURE `campo_adicional`()
BEGIN
	DECLARE cantidad INT;
DECLARE precio FLOAT;
DECLARE facturacion_acumulada FLOAT;
DECLARE fin_cursor INT;
DECLARE c CURSOR FOR
SELECT IFa.CANTIDAD, IFa.PRECIO FROM items_facturas IFa
INNER JOIN facturas  F ON F.NUMERO = IFa.NUMERO
WHERE MONTH(F.FECHA_VENTA) = 1 AND YEAR(F.FECHA_VENTA) = 2017;
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET fin_cursor = 1;
OPEN c;
SET fin_cursor = 0;
SET facturacion_acumulada = 0;
WHILE fin_cursor = 0
DO
FETCH c INTO cantidad, precio;
IF fin_cursor = 0 THEN
SET facturacion_acumulada = facturacion_acumulada + (cantidad * precio);
END IF;
END WHILE;
CLOSE c;
SELECT facturacion_acumulada;
END
*/

CALL campo_adicional;

/*
			FUNCIONES
	CRETAE FUNCION function_name(parameters)
		RETURNS datatype;
    BEGIN 
		DECLARE <declaration_statement>;
			(......)
			<executable_statement>;
            (......)
		RETURN <STATEMENT>
			(......)
		END;
        
	CREATE [AGGREGATE] FUNCTION [IF NOT EXISTS] function_name
		RETURNS {STRING|INTEGER|REAL|DECIMAL}
    SONAME shared_library_name
*/

SET GLOBAL log_bin_trust_function_creators = 1;
 -- NORMALEMENTE LA INSTLACION DE MYSQL NO PERMITE QUE EL USUARIO CREE FUNCIONES POR DEFECTO
 
 /*
		CREATE DEFINER=`root`@`localhost` FUNCTION `f_define_sabor`(vsabor VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
				BEGIN
					DECLARE vretorno VARCHAR(50) DEFAULT "";
					CASE vsabor 
								WHEN 'Maracuyá' THEN SET vretorno = 'Muy Rico';
								WHEN 'Limón' THEN SET vretorno = 'Muy Rico';
								WHEN 'Frutilla' THEN SET vretorno = 'Muy Rico';
								WHEN 'Uva' THEN SET vretorno = 'Muy Rico'; 
								WHEN 'Sandía' THEN SET vretorno = 'Normal';
								WHEN 'Sandía' THEN SET vretorno = 'Normal';
								ELSE SET vretorno = 'Jugos Comunes';
						END CASE;
				RETURN vretorno;
				END
 */
 
 SELECT f_define_sabor("Maracuyá") AS SABOR;
 
 SELECT * FROM tabla_de_productos;
 
 SELECT  NOMBRE_DEL_PRODUCTO, SABOR,  f_define_sabor(SABOR) AS CAT_SABOR FROM tabla_de_productos;
 
  SELECT  NOMBRE_DEL_PRODUCTO, SABOR FROM tabla_de_productos WHERE f_define_sabor(SABOR) = 'Jugos Comunes' ;
  
  
  /*		Función donde ingresamos como parámetro la fecha y retornamos el número de facturas. 
			Llamaremos esta función f_numero_facturas. Luego de crear la función, ejecútalo utilizando el comando SELECT.
  
				CREATE DEFINER=`root`@`localhost` FUNCTION `f_numero_facturas`(fecha DATE) RETURNS int
						BEGIN
						DECLARE n_facturas INT;
						SELECT COUNT(*) INTO n_facturas FROM facturas WHERE FECHA_VENTA = fecha;
						RETURN n_facturas;
						END
  */
  
  SELECT f_numero_facturas('2015-01-04') AS RESULTADO;