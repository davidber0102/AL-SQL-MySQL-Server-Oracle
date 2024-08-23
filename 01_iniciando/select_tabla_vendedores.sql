SELECT  * FROM  tbproducto;

SELECT  * FROM  tbproducto WHERE SABOR = 'Maracuyá';
SELECT  * FROM  tbproducto WHERE ENVASE = 'Botella de Vidrio';


SELECT * FROM tbvendedores WHERE nombre = 'Cláudia Morais';

SELECT * FROM tbvendedores WHERE porcentaje_comision >= 0.10;

SELECT * FROM tbvendedores WHERE YEAR(fecha_admision) >= 2016;