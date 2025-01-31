USE oti
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
    cod_rol_in INT            NOT NULL,
    cod_rol_ch CHAR(5)        NOT NULL,
    nom_rol_vc VARCHAR(15)    NOT NULL,

    CONSTRAINT pk_personal_rol_cod_rol_in  --CLAVE PRIMARIA
    PRIMARY KEY(cod_rol_in),
    CONSTRAINT ak_personal_rol_cod_rol_ch	--CLAVE FORANEA
    UNIQUE(cod_rol_ch)
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