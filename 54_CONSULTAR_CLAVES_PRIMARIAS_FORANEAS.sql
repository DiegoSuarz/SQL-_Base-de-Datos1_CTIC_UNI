--CONSULTAR CLAVES PRIMARIAS:
SELECT name
FROM sysobjects
WHERE xtype = 'PK'
GO
-------------------------------------------------------------------
--CONSULTAR CLAVES FORANEAS:
SELECT name
FROM sys.foreign_keys
GO

-------------------------------------------------------------------
--CONSULTAR CLAVES PRIMARIAS Y CLAVES FORANEAS:
SELECT name
FROM sysobjects
WHERE xtype = 'PK'
UNION
SELECT name
FROM sys.foreign_keys
GO
