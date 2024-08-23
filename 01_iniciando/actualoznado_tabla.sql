USE test_jugos;

UPDATE tbvendedores SET porcentaje_comision =.11
	WHERE matricula = '00236';

UPDATE tbvendedores SET nombre = 'Joan Geraldo de la Fonseca Junior'
	WHERE matricula = '00233';

SELECT * FROM tbvendedores;

USE test_jugos;
SELECT * FROM tbproductos;

DELETE FROM tbproductos
	WHERE nombre = 'Joan Geraldo de la Fonseca Junior'
    
    USE test_jugos;

ALTER TABLE tbproductos ADD primary key(producto);

SELECT * FROM tbproductos;
SELECT * FROM tbclientes;