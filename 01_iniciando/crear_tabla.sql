CREATE TABLE tbclientes(
	dni varchar(20),
	nombre varchar(150),
	direccion1 varchar(150),
	direccion2 varchar(150),
	barrio varchar(50),
	ciudad varchar(50),
	estado varchar(50),
	cp varchar(10),
	edad smallint,
	sexo varchar(1),
	limite_credito float,
	volumen_compra float,
	primera_compra bit(1)
);

CREATE TABLE tbproductos(
	producto varchar(20),
    nombre varchar(150),
    envase varchar(50),
    volumen varchar(20),
    sabor varchar(50),
    precio float
);

CREATE TABLE tbvendedores(
	matricula varchar(5),
    nombre varchar(100),
    porcentaje_comision float
);