SELECT @@VERSION


-------------------------------------------------
--ver las base de datos instalados
SELECT *
FROM master.dbo.sysdatabases

SELECT *
FROM master..sysdatabases

USE master
GO
SELECT *
FROM sysdatabases


SELECT *
FROM master.dbo.sysobjects

SELECT *
FROM master.dbo.sysusers