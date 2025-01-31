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
    cod_rol_in INT            IDENTITY NOT NULL,
    cod_rol_ch CHAR(5)        NOT NULL,
    nom_rol_vc VARCHAR(15)    NOT NULL,

    CONSTRAINT pk_personal_rol_cod_rol_in
    PRIMARY KEY(cod_rol_in),
    CONSTRAINT ak_personal_rol_cod_rol_ch
    UNIQUE(cod_rol_ch)
)
GO
INSERT INTO Personal.rol (cod_rol_ch, nom_rol_vc)
SELECT
	'R' + RIGHT('0000' + LTRIM(ROW_NUMBER() OVER (ORDER BY (SELECT NULL))), 4),
	name
FROM sys.schemas
WHERE principal_id <> schema_id
ORDER BY name
GO

SELECT * FROM Personal.rol
GO