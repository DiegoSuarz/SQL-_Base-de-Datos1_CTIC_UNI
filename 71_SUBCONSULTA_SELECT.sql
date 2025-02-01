--Subconsulta en el campo del SELECT

USE [Northwind]
GO
SELECT [ProductID]
      ,[ProductName]
      , (SELECT CompanyName FROM Suppliers WHERE SupplierID = p.SupplierID) AS Proveedor
      , (SELECT CategoryName FROM Categories WHERE [CategoryID] = p.CategoryID) AS Categoría
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
  FROM [dbo].[Products] p

GO