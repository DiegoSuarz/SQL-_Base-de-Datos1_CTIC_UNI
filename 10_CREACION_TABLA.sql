/*
¿Qué es una tabla?
Una tabla es un objeto de base de datos que organiza y almacena datos
en un formato estructurado.

Las tablas son la forma más fundamental de almacenamiento de datos en 
SQL Server y se componen de filas y columnas.
*/


USE empresa_oti --SELECCIONAR BASE DE DATOS
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
    cod_rol_in INT,			--tipo entero
    cod_rol_ch CHAR(5),		--tipo char
    nom_rol_vc VARCHAR(15) 
)
GO

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

------------------------------------------------------------------------------
--CREAR TABLA A PARTIR DE OTRA TABLA EXISTENTE
USE [Northwind]
GO

IF EXISTS
(
    SELECT name
    FROM sys.tables
    WHERE name = 'X'
)
DROP TABLE[dbo].[X]
GO

SELECT [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
	INTO [dbo].[X]
  FROM [dbo].[Orders]
  --WHERE 
 GO

 ---------------------------------------------------------
 --CREAR TABLA A PARTIR DE OTRA TABLA EXISTENTE CON FILTRO
 USE [Northwind]
GO

IF EXISTS
(
    SELECT name
    FROM sys.tables
    WHERE name = 'X'
)
DROP TABLE[dbo].[X]
GO

SELECT [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
	INTO [dbo].[X]
  FROM [dbo].[Orders]
  WHERE OrderID < 10300
 GO

