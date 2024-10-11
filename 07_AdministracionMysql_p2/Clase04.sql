/*
	CLASE 04 GESTION DE USUARIO    
		CREANDO USUARIO ADMINISTRADOR
*/

-- CREAR USUARUI Y PRIVILEGIOS
CREATE USER 'admin02'@'localhost'IDENTIFIED BY 'admin02';

-- SE APLICA TODOS LOS PRVILEGIOS A EL USUARIO ADMIN02
GRANT ALL PRIVILEGES ON  *.* TO 'admin02'@'localhost' WITH GRANT OPTION;

-- CREAR USUARUI Y PRIVILEGIOS
CREATE USER 'user02'@'localhost'IDENTIFIED BY 'user02';

-- SE APLICA TODOS LOS PRVILEGIOS A EL USUARIO 
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE  ON  *.* TO 'user02'@'localhost';

-- CREAR USUARio de lectura
CREATE USER 'read01'@'localhost'IDENTIFIED BY 'read01';

-- selecionar y ejecutar procedimientos privilegios de usuario lectura
GRANT SELECT, EXECUTE  ON  *.* TO 'read01'@'localhost';

-- CREAR USUARIO PARA HACER LOS BACKUPS
CREATE USER 'back01'@'localhost'IDENTIFIED BY 'back01';

-- selecionar y ejecutar procedimientos privilegios de usuario lectura
GRANT SELECT, RELOAD, LOCK TABLES, REPLICATION CLIENT ON  *.* TO 'back01'@'localhost';

-- Gestion de privilegios 
-- ----- accediendo desde cualquier servidor
-- CREAR USUARUI Y PRIVILEGIOS
CREATE USER 'admingeneric02'@'%'IDENTIFIED BY 'admingeneric02';

-- SE APLICA TODOS LOS PRVILEGIOS A EL USUARIO ADMIN02
GRANT ALL PRIVILEGES ON  *.* TO 'admingeneric02'@'%' WITH GRANT OPTION;

/*
-- usando " % "
	-- 192.168.1.%   => 192.168.1.0 - 192.168.1.255
    -- 192.168.1.1_  => 192.168.1.100 - 192.168.1.255
    -- client_.mycompanu.com => clientXY.mycompany.com
*/

-- limitando el acceso a los esquemas

-- CREAR USUARUI Y PRIVILEGIOS
CREATE USER 'user04'@'%'IDENTIFIED BY 'user04';

-- SE APLICA TODOS LOS PRVILEGIOS A EL USUARIO 
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE  ON  jugos_ventas.* TO 'user04'@'%';

-- CREAR USUARUI Y PRIVILEGIOS
CREATE USER 'user05'@'%'IDENTIFIED BY 'user05';

-- SE APLICA TODOS LOS PRVILEGIOS A EL USUARIO 
GRANT SELECT, INSERT, UPDATE ON  jugos_ventas.facturas TO 'user05'@'%';
GRANT SELECT ON  jugos_ventas.tabla_de_vendedores TO 'user05'@'%';

-- revocando privilegios
-- listar lo usuarios y privilegios usados en mysql
SELECT * FROM mysql.user;

SHOW GRANTS FOR 'user02'@'localhost';

REVOKE ALL PRIVILEGES, grant option from 'user02'@'localhost';

