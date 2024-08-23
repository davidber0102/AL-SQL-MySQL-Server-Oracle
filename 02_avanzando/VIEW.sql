CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `jugos_ventas`.`vw_envases_grandes` AS
    SELECT 
        `jugos_ventas`.`tabla_de_productos`.`ENVASE` AS `ENVASE`,
        MAX(`jugos_ventas`.`tabla_de_productos`.`PRECIO_DE_LISTA`) AS `PRECIO_MAXIMO`
    FROM
        `jugos_ventas`.`tabla_de_productos`
    GROUP BY `jugos_ventas`.`tabla_de_productos`.`ENVASE`