--Northwind: Unir la tabla empleados con clientes
--solo usar tablas coincidentes que tengan la misma información
USE Northwind
GO

SELECT  [CustomerID]
      ,[CompanyName]
      --,[ContactName]
      --,[ContactTitle]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[Phone]
      --,[Fax]
 FROM [dbo].[Customers]
 GO

 SELECT
    LTRIM([EmployeeID])  --convertir de int a str
      ,CONCAT([TitleOfCourtesy],' ',[LastName],', ',[FirstName]) --unimos apellido parterno y nombre
      --,[Title]
      --,[TitleOfCourtesy]
      --,[BirthDate]
      --,[HireDate]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
      --,[Extension]
      --,[Photo]
      --,[Notes]
      --,[ReportsTo]
      --,[PhotoPath]
FROM [dbo].[Employees]
GO

SELECT  [CustomerID]
      ,[CompanyName]
      --,[ContactName]
      --,[ContactTitle]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[Phone]
      --,[Fax]
  FROM [dbo].[Customers]

UNION

SELECT
    LTRIM([EmployeeID])  --convertir de int a str
      ,CONCAT([TitleOfCourtesy],' ',[LastName],', ',[FirstName]) --unimos apellido parterno y nombre
      --,[Title]
      --,[TitleOfCourtesy]
      --,[BirthDate]
      --,[HireDate]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
      --,[Extension]
      --,[Photo]
      --,[Notes]
      --,[ReportsTo]
      --,[PhotoPath]
  FROM [dbo].[Employees]

GO