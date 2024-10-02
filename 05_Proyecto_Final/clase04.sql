/*
		CLASE 4 GENERANDO VENTAS
*/
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM vendedores;
SELECT * FROM facturas;
SELECT * FROM items;

SELECT f_cliente_aleatorio() AS CLIENTE;
SELECT f_producto_aleatorio() AS PRODUCTO;
SELECT f_vendedor_aleatorio() AS VENDEDOR;

SELECT f_cliente_aleatorio() AS CLIENTE, f_producto_aleatorio() AS PRODUCTO, f_vendedor_aleatorio() AS VENDEDOR;

SELECT MAX(NUMERO) + 1 FROM facturas;

/* 
				CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta`(fecha DATE, maxitems INT, maxcantidad INT)
			BEGIN
			-- ASIGNACION DE VARIABLES A UTILIZAR
				DECLARE vcliente VARCHAR(11) ;
				DECLARE vproducto VARCHAR(10) ;
				DECLARE vvendedor VARCHAR(5);
				DECLARE vcantidad INT;
				DECLARE vprecio FLOAT;
				DECLARE vitems INT;
				DECLARE vnfactura INT;
				DECLARE vcontador INT DEFAULT 1;
				
				-- ASIGNAR EL NUMERO MAXIMO DE FACTURAS MAS UNO 
				SELECT MAX(NUMERO) + 1 INTO vnfactura FROM facturas;
				
				-- SE ASGINA UN CLIENTE Y VENDEDOR ALETATORIO A LAS VARABLES
				SET vcliente =  f_cliente_aleatorio();
				SET vvendedor = f_vendedor_aleatorio();
				
				-- SE INSERTA A LA TABLA FACTURAS
				INSERT INTO facturas(NUMERO, FECHA, DNI, MATRICULA, IMPUESTO) values(vnfactura, fecha, vcliente, vvendedor, 0.16 );
				
				-- se generar un numero aleatorio para items
				SET vitems = f_aleatorio(1, maxitems);   
				
				--
					WHILE vcontador <=vitems
						DO
							SET vproducto = f_producto_aleatorio();
							SET vcantidad = f_aleatorio(1, maxcantidad); 
							SELECT PRECIO INTO vprecio FROM productos where CODIGO = vproducto;
							INSERT INTO items(NUMERO, CODIGO, CANTIDAD, PRECIO) VALUES(vnfactura, vproducto, vcantidad,  vprecio);
							SET vcontador = vcontador +1;
					END WHILE;
				
			END

*/

CALL sp_venta('20210619', 3, 100);


SELECT MAX(NUMERO) FROM facturas;
SELECT COUNT(*) FROM facturas;

SELECT NUMERO FROM facturas ORDER BY 1 DESC;