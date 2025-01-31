/*
INSERT INTO Esquema.Tabla(nombre_columna1, nombre_columna2, nombre_columna3, ...)
VALUES (valor1, valor2, valor3, ...)
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
CREATE TABLE Personal.rol
(
    cod_rol_in INT  IDENTITY  NOT NULL, --SE AUTOINCREMENTA AL AGREGARSE REGISTROS
    cod_rol_ch CHAR(5)        NOT NULL,
    nom_rol_vc VARCHAR(15)    NOT NULL,

    CONSTRAINT pk_personal_rol_cod_rol_in
    PRIMARY KEY(cod_rol_in),
    CONSTRAINT ak_personal_rol_cod_rol_ch
    UNIQUE(cod_rol_ch)
)
GO

-----------------------------------------------------------------
--segunda forma
INSERT INTO Personal.rol (cod_rol_ch, nom_rol_vc)
VALUES  ('R0005','Ventas'),
		('R0003','Almacén'),
		('R0008','Transportes');
GO
SELECT * FROM Personal.rol
GO

