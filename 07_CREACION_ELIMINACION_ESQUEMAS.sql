--CREACION Y ELIMINACION DE ESQUEMAS

USE empresa_oti
GO

IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Ventas'
)

DROP SCHEMA Ventas
GO

CREATE SCHEMA Ventas AUTHORIZATION dbo;
GO
-----------------------------------------
IF EXISTS
(
    SELECT name
    FROM sys.schemas
    WHERE name = 'Almacen'
)
DROP SCHEMA Almacen
GO
CREATE SCHEMA Almacen AUTHORIZATION dbo;
GO
-----------------------------------------
IF EXISTS
(
    SELECT name
    FROM sys.schemas
    WHERE name = 'Facturacion'
)
DROP SCHEMA Facturacion
GO
CREATE SCHEMA Facturacion AUTHORIZATION dbo;
GO
-----------------------------------------
IF EXISTS
(
    SELECT name
    FROM sys.schemas
    WHERE name = 'Cobranzas'
)
DROP SCHEMA Cobranzas
GO
CREATE SCHEMA Cobranzas AUTHORIZATION dbo;
GO
-----------------------------------------
IF EXISTS
(
    SELECT name
    FROM sys.schemas
    WHERE name = 'Compras'
)
DROP SCHEMA Compras
GO
CREATE SCHEMA Compras AUTHORIZATION dbo;
GO
-----------------------------------------
IF EXISTS
(
    SELECT name
    FROM sys.schemas
    WHERE name = 'Pagos'
)
DROP SCHEMA Pagos
GO
CREATE SCHEMA Pagos AUTHORIZATION dbo;
GO
-----------------------------------------
IF EXISTS
(
    SELECT name
    FROM sys.schemas
    WHERE name = 'Personal'
)
DROP SCHEMA Personal
GO
CREATE SCHEMA Personal AUTHORIZATION dbo;
GO
-----------------------------------------
IF EXISTS
(
    SELECT name
    FROM sys.schemas
    WHERE name = 'Transportes'
)
DROP SCHEMA Transportes
GO
CREATE SCHEMA Transportes AUTHORIZATION dbo;
GO
-----------------------------------------
IF EXISTS
(
    SELECT name
    FROM sys.schemas
    WHERE name = 'Sistemas'
)
DROP SCHEMA Sistemas
GO
CREATE SCHEMA Sistemas AUTHORIZATION dbo;
GO
-----------------------------------------
SELECT name
FROM sys.schemas
WHERE principal_id != schema_id
ORDER BY name 