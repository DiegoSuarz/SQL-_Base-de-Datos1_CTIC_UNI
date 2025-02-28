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
    cod_rol_in INT NOT NULL,    
	cod_rol_ch CHAR(5),		--tipo char
    nom_rol_vc VARCHAR(15) 

	CONSTRAINT pk_rol_cod_rol_in
	PRIMARY KEY (cod_rol_in)
	
)
GO

-----------------------------------------------
-- insertar valores a la tabla rol
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(5, 'R0005','Ventas');
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(3, 'R0003','Almac�n');
GO
INSERT INTO rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(8, 'R0008','Transportes');
GO
SELECT * FROM rol
GO