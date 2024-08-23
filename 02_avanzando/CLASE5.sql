-- CALSE 5
-- FUNCIONES DE CADENA O STRING
-- LTRIM QUITA ESPACIOS A ALA IZQUIERDA DE LA CADENA
SELECT LTRIM("                    MYSQL ES FACIL");
-- LTRIM QUITA ESPACIOS A ALA DERECGA DE LA CADENA
SELECT RTRIM("                    MYSQL ES FACIL             ");
-- LTRIM QUITA ESPACIOS A ALA DERECHA E IZQUIERDA DE LA CADENA
SELECT LTRIM("                    MYSQL ES FACIL");
-- COMANDO CONCAT
SELECT CONCAT("MySQL es facil", " !! No lo crees");
-- comando upper convierta la cade de texto en mayusculas
select upper("mysql es una base de datos interesante");
-- comando upper convierta la cade de texto en minusculas
SELECT LOWER("MY SQL ES UNA BASE DE DATOS DE ORACLE");
-- COMMANDO SUBSTRING
SELECT SUBSTRING("mysql es una base de datos interesante", 14,12 );

-- SE CONCATENARA EL NOMBRE Y EL DNI
SELECT CONCAT(NOMBRE, " ", DNI) FROM tabla_de_clientes;
-- Haz una consulta listando el nombre del cliente y la dirección completa (Con calle, barrio, ciudad y estado).
SELECT NOMBRE, CONCAT(DIRECCION_1, ' ', BARRIO, ' ', CIUDAD, ' ', ESTADO) AS COMPLETO FROM tabla_de_clientes;

-- TEMA : FUNCIONES CON LA FECHA Y HORA
-- La función CURDATE() devuelve la fecha actual.
SELECT CURDATE();
-- La función CURRENT_TIMESTAMP() devuelve la fecha y hora actuales.
SELECT CURRENT_TIMESTAMP();
-- La funcion YEAR() devuelve el año y en este caso devuelve el año actual
SELECT YEAR(current_timestamp());
-- La funcion  YEARWEEK() devuelve LSA SEMANA CORRESPONDIENTE AL AÑO CONSULTADO
SELECT YEARWEEK(current_timestamp());
-- La funcion  MONTH() devuelve el mes de 1 al 12
SELECT MONTH(current_timestamp());
-- La funcion  MONTHNAME() devuelve el mes EN CUANTO NOMBRE
SELECT MONTHNAME(current_timestamp());
-- La funcion day() devuelve el dia del 1 al 31 como corresponda
SELECT DAY(current_timestamp());
-- La funcion dayname() devuelve el dia correspondiete de la semana
SELECT DAYNAME(current_timestamp());
-- La funcion DAYOFMONTH() devuelve el dia correspondiete del mes en numero
SELECT DAYOFMONTH(current_timestamp());
-- La funcion DAYOFMONTH() devuelve el dia correspondiete a la semana en numero
SELECT DAYOFWEEK(current_timestamp());
-- La funcion DAYOFYEAR() devuelve el dia correspondiete al dia ne el año en numero
SELECT DAYOFYEAR(current_timestamp());
-- CALCULA LA DIFERENCIA ENTRE FECHAS
select datediff(current_timestamp(), '2024-01-01') AS DIFF_DIAS;
select datediff(current_timestamp(), '1989-06-11') AS DIFF_DIAS;
SELECT current_timestamp() AS DIA_HOY,		DATE_SUB(current_timestamp(), INTERVAL 1 MONTH) AS RESULTADO;
--          
use jugos_ventas;
SELECT DISTINCT FECHA_VENTA, DAYNAME(FECHA_VENTA) AS DIA, MONTHNAME(FECHA_VENTA) AS MES, YEAR(FECHA_VENTA) AS AÑO FROM facturas;
-- Haz una consulta que muestre el nombre y la edad actual del cliente.
SELECT NOMBRE, TIMESTAMPDIFF(YEAR, FECHA_DE_NACIMIENTO, CURDATE()) AS EDAD FROM  tabla_de_clientes;

SELECT (34 +346-67)/15 *29 AS RESULTADO;
SELECT CEILING(23.1256);
SELECT FLOOR(23.1256);
SELECT RAND()*100 AS RESULTADO;
SELECT ROUND(254.6598, 2);
SELECT * FROM items_facturas;
SELECT NUMERO, CANTIDAD, PRECIO, (CANTIDAD * PRECIO) AS FACUTRACION FROM items_facturas;
SELECT NUMERO, CANTIDAD, PRECIO, ROUND(CANTIDAD * PRECIO, 2) AS FACUTRACION FROM items_facturas;

-- En la tabla de facturas tenemos el valor del impuesto. En la tabla de ítems tenemos la cantidad y la facturación.
-- Calcula el valor del impuesto pago en el año de 2016 redondeando al menor entero.
SELECT YEAR(FECHA_VENTA), FLOOR(SUM(IMPUESTO * (CANTIDAD * PRECIO))) AS RESULTADO FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY YEAR(FECHA_VENTA);

-- TEMA: CONVIERTIENDO DATOS
-- SE UTILIZA PARA CONVERTIR EL CONTENIDO DE LOS REGISTRO EN LA TABLA DE LA BASE DE DATOS A CUQLQUIER FORMATO
SELECT CURRENT_TIMESTAMP() AS RESULTADO;

SELECT CONCAT("La fecha y la hora de hoy son: ", CURRENT_TIMESTAMP()) AS RESULTADO;
SELECT CONCAT("El año de la fecha es: ", DATE_FORMAT(CURRENT_TIMESTAMP(), "%Y"), ", Y la hora es: ",DATE_FORMAT(CURRENT_TIMESTAMP(), "%T")) AS RESULTADO;

SELECT CURRENT_USER();
SELECT IF(500<1000, "YES", "NO"); 
SELECT CONVERT(23.45, CHAR) AS RESULTADO;
SELECT SUBSTRING(CONVERT(23.45, CHAR),3,1) AS RESULTADO;

-- Queremos construir un SQL cuyo resultado sea, para cada cliente:
-- “El cliente Pepito Pérez facturó 120000 en el año 2016”.
-- Solamente para el año 2016.
SELECT CONCAT('El cliente ', TC.NOMBRE, ' facturó ', CONVERT(SUM(IFa.CANTIDAD * IFa.precio), CHAR(20)), ' en el año ', 
	CONVERT(YEAR(F.FECHA_VENTA), CHAR(20))) AS FRASE FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC ON F.DNI = TC.DNI
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY TC.NOMBRE, YEAR(FECHA_VENTA);
