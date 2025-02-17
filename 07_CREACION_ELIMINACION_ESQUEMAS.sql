--CREACION Y ELIMINACION DE ESQUEMAS
/*
Esquemas
Un esquema es una forma de organizar y agrupar objetos de base de datos, 
como tablas, vistas, procedimientos almacenados, funciones y m�s.

Los esquemas proporcionan una estructura l�gica que permite administrar mejor 
los objetos y gestionar la seguridad y el acceso a los mismos.

Caracter�sticas del Esquema
Agrupaci�n de Objetos:
Los esquemas permiten agrupar objetos relacionados en una base de datos, 
lo que facilita la organizaci�n y la navegaci�n.

Seguridad:
Se pueden definir permisos a nivel de esquema, lo que permite controlar el 
acceso a todos los objetos dentro de un esquema de manera centralizada.
Por ejemplo, se puede otorgar acceso a un esquema espec�fico a ciertos 
usuarios, limitando su capacidad para acceder a otros objetos.

Nombres �nicos:
Un objeto dentro de un esquema debe tener un nombre �nico en el contexto 
del esquema, pero puede haber objetos con el mismo nombre en diferentes esquemas.
Esto permite una mayor flexibilidad en la nomenclatura de los objetos.

Facilidad de Mantenimiento:
Los esquemas facilitan el mantenimiento de objetos relacionados, ya que se pueden manejar como un conjunto.
Tambi�n pueden simplificar la migraci�n de objetos entre bases de datos.
*/


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
SELECT *--name
FROM sys.schemas
WHERE principal_id != schema_id
ORDER BY name 