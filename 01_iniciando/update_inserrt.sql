USE test_jugos;

ALTER TABLE tbvendedores ADD primary key(matricula);
ALTER TABLE tbvendedores ADD column(fecha_admision date);
ALTER TABLE tbvendedores ADD COLUMN(de_vaciones varchar(2));

UPDATE tbvendedores SET nombre = 'Márcio Almeida Silva',  fecha_admision = '2014-08-15', de_vaciones= 'NO'
WHERE matricula = '00235';

UPDATE tbvendedores SET  fecha_admision = '2013-09-17', de_vaciones= 'SI'
WHERE matricula = '00236';

UPDATE tbvendedores SET  fecha_admision = '2013-06-18', de_vaciones= 'SI'
WHERE matricula = '00233';

INSERT INTO tbvendedores(matricula, nombre, porcentaje_comision, fecha_admision, de_vaciones)
	VALUES('00237', 'Roberta Martins', .11 , '2017-03-18', 'SI');
INSERT INTO tbvendedores(matricula, nombre, porcentaje_comision, fecha_admision, de_vaciones)
	VALUES('00238', 'Péricles Alves', .11 , '2016-08-21', 'NO');


SELECT * FROM tbvendedores;

USE test_jugos;

ALTER TABLE tbclientes ADD primary key(dni);
ALTER TABLE tbclientes ADD column(fecha_nacimiento date);

INSERT INTO tbclientes(dni,nombre, direccion1, direccion2, barrio, ciudad, estado, cp, edad, sexo, limite_credito, volumen_compra, primera_compra, fecha_nacimiento) 
			values ('2555485', 'Pedro el Escamoso','cale del sol 25','sin dato','Los Laures', 'Cdmx', 'Mexico','65784', 55,'M', 1000000, 2000, 0, '1971-05-25');

SELECT * FROM tbclientes;