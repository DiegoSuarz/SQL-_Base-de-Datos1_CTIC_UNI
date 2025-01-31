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
----------------------------------------------------
CREATE TABLE Personal.rol
(
    cod_rol_in INT
    CONSTRAINT pk_rol_cod_rol_in
    PRIMARY KEY    NOT NULL,
    cod_rol_ch CHAR(5),
    nom_rol_vc VARCHAR(15),
)
GO
-----------------------------------------------------------------
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