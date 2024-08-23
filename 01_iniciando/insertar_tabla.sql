USE test_jugos;

INSERT INTO tbproductos(
producto, nombre, envase, volumen, sabor,
precio) VALUES ('695594', 'Festival de Sabores', 'Botella PET',
'1.5 Litros', 'Asaí', 18.51);

INSERT INTO tbproductos(
producto, nombre, envase, volumen, sabor,
precio) VALUES ('1041119', 'Línea Citrus', 'Botella de Vidrio',
'700 ml', 'Lima', 4.90);

SELECT * FROM tbproductos;
SELECT * FROM tbclientes;
SELECT * FROM tbvendedores;

INSERT INTO tbvendedores(matricula, nombre, porcentaje_comision) 
VALUES ('00233', 'Joan Geraldo de la Fonseca', .10);

INSERT INTO tbvendedores(matricula, nombre, porcentaje_comision) 
VALUES ('00235', 'Márcio Almeida Silva', .08);

INSERT INTO tbvendedores(matricula, nombre, porcentaje_comision) 
VALUES ('00236', 'Cláudia Morais', .08);




