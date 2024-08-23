-- Comandos DML: Manipulación de datos con MySQL
-- Se  instalo de nuevo mysql workbench 
-- se reviso las entidades de una base de datos, la principal es una talb aocn su caractristicas y registros
-- las entidades basicas son las views, los procedimientos y los tiggers

-- se reviso sobre los tipos de datos de una tabla en una base de datos
/* 
	-- Numericos entros:	 tinyint, smallint, mediumint, int, bigint, van desde 1 hasta 8 byte, numeros con o sin signo
	-- Numeros decimial_: float, double, de 4 y 8 bytes, decimal o numeric (65 digitos)
    ---- bit: 0 o 1
		-- Atributos ed los campos numericos
			-- SIGNED O UNSIGNED: CON O SIN SIGNO
			-- ZEROFILL: LLENA LOS ESPACIOS CON CERO
				-- JEMPLO INT(5), si alamcenamos 54. el campo va a quedar 00054
			-- AUTO_INCREMENT; INCREMENTO SECUENCIAL, EJEMPLO 1,2,3,4,5,6,7,8
			-- OUT OF RANGE: ES UN ERROR QUE SE PRESENTA CUANDO LOS VALORES SE SALEN DEL LOS LIMITES
	-- FECHA Y HORA:
		-- DATE 1000-01-01 HASTA 9999-12-31
        -- DATETIME 1000-01-01 00:00:00 HASTA 9999-12-31 23:59:59
        -- TIMESTAMPO: 1970-01-01 00:00:00 UTC HASTA 2038-01-19 UTC
        -- TIME -838:59:59 Y 839:59:59
        -- YEAR: 1901 HASTA 2155(FORMATO DE 2 O 4 DIGITOS)
	-- STTING
		-- CHAR CADENA DE CARACTERES COMO VALOR FIGO DE 0A 255, EJEMPLO CHAR(4) = "aa" -> "**aa"
        --varchar: cadena de caracteres con valor variable de 0 a 255, ejemplo varchar(4)  = "aa" -> "aa"
        -- binary: Cadena de caracteres con valor figo de 0 a 255 (numeros binarios - bits)
        -- varbinary: Cadena de caracteres con valor variable de 0 a 255 (numeros binarios - bits)
        -- blob: binarios larogos -> tinybloc, mediumblob, longblob // archivos de fotos o documentos
        -- text: texto largo tinytext, mediumtext, longtext
        -- ENUM: define opciones en una lista predefinidoa -> Talla ENUM('pequeño', 'mediano', 'grande')
	-- ATRIBUTOS DE LOS CAMPOS STRING
		-- SET Y COLLATE: TIPO DE CONJUNTO DE CARACTERES QUE VA A ACEPTAR -> utf-8, utf-16
	
    -- campos espaciales(GPS)
		-- GEOMETRY --> AREA
        -- LINESTRING --> LINEA
        -- POINT --> PUNTO
        -- POLYGON --> AREA

-- MODELAJE DE LA BASE DE DATOS
	-- PROYECTADO UNA BASE DE DATOS
        -- 1 ANALISIS DE LOS REQUISITOS O REQUERIMIENTOS
			-- ENTENDER LAS REGLAS DEL NEGOCIO
				-- REALIZAR ENTREVISTAS Y REUNIONES
			-- DISEÑAR UN MODELO CORREPSONDIENTE CON LA REALIDAD
		-- 2 MODELO CONCEPTUAL
			-- CONSTRUI DIAGRAM ENTIDAD-RELACION
            -- ESTABLECER LA CARDINALIDAD DE LAS ENTIDADES (NUMERO DE ENTIDADES CON LAS CUALES UNA DETERMINADA ENTIDAD PUEDE ASOCIARSE
					1-1, 1-N, N-N)
			-- |VENDEDOR | 1   ---------- REALIZA ---------------- N  |VENTAS|
            -- | CLIENTE | 1 -------------INVOLUCRA ---------------- N  |VENTAS|
            -- | VENTAS | 1 --------------- POSEE ------------------ N | ITEMS VENDIDOS |
            -- | PRODUCTOS | 1 ------------- CONTIENE ------------------ 1 | ITEMS VENDIDOS |
	-- 3 ATRIBUTOS DE LAS ENTIDADES 
    
    -- 4  TRANSFORMAR EL DIAGRAMA DE ENTIDADES EN ESQUEMA DE TABLAS
		-- TRANSFORMAR CADA ENTIDAD EN UNA O MAS TABLAS FISICAS DE LA BASE DE DATOS
        -- CADA CONEXION DEL MODELAJE SERA UNA RELACION EN LAS TABLAS DE LA BASE DE DATOS
        
	-- 5  CONSTRUIR BASE DE DATOS
		-- PODEMOS EMPLEAR HERAMIENTAS COMPUTER-aIDE sOFTWARE eNGINEERING (CASE), STAR UML, Astah, ERWin




*/