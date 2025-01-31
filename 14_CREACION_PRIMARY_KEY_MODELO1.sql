USE empresa_oti 
GO
IF EXISTS
(
    SELECT name
    FROM sys.tables
    WHERE name = 'rol'
)
DROP TABLE rol
GO
CREATE TABLE rol --crear tabla rol
(
	--columnas de la tabla con su tipo de dato
    cod_rol_in INT 
	CONSTRAINT pk_rol_cod_rol_in --cambiar nombre a la clave primaria
	PRIMARY KEY NOT NULL,			--LLAVE PRIMARIA ORDENA LOS REGISTRON DE FORMA FISICA
    
	cod_rol_ch CHAR(5),		--tipo char
    nom_rol_vc VARCHAR(15) 
)
GO
-----------------------------------------------
-- insertar valores a la tabla rol
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(5, 'R0005','Ventas');
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(3, 'R0003','Almacén');
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(8, 'R0008','Transportes');
GO
SELECT * FROM rol
GO