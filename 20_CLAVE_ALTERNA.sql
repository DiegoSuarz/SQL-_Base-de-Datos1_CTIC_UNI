/*
Una clave alterna es un conjunto de una o más columnas en una 
tabla que también garantiza la unicidad de los valores, 
pero que no se utiliza como clave primaria.

A diferencia de la clave primaria, que es el identificador principal
de los registros, una clave alterna es una alternativa para 
identificar de forma única una fila.
*/


USE empresa_oti
GO
IF EXISTS
(
    SELECT *
    FROM sys.schemas s
    INNER JOIN sys.tables t
    ON s.schema_id = t.schema_id
    WHERE
            s.name = 'Personal'
        AND
            t.name = 'rol'
)
DROP TABLE Personal.rol
GO
--------------------------------------------------------------
CREATE TABLE Personal.rol
(
	------------CLAVE PRIMARIA-------------------------------
    cod_rol_in INT
    CONSTRAINT pk_personal_rol_cod_rol_in
    PRIMARY KEY CLUSTERED NOT NULL,

	-------------CLAVE ALTERNA (CLAVE FORANEA)------------------------------
    cod_rol_ch CHAR(5)
	CONSTRAINT ak_personal_rol_cod_rol_ch
    UNIQUE NONCLUSTERED NOT NULL,

	    nom_rol_vc VARCHAR(15),
)
GO
INSERT INTO Personal.rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(5, 'R0005','Ventas');
GO
INSERT INTO Personal.rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(3, 'R0003','Almacén');
GO
INSERT INTO Personal.rol (cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(8, 'R0008','Transportes');
GO
SELECT * FROM Personal.rol
GO