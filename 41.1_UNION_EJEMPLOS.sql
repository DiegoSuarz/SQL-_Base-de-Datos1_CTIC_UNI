/*
UNION
La cláusula UNION en SQL Server se utiliza para combinar los resultados
de dos o más consultas SELECT.

Al usar UNION, se eliminan los duplicados de los resultados, y se devuelven 
solo los registros únicos.
*/

USE [Northwind]
GO
SELECT
    LTRIM([EmployeeID]) AS Código
      ,[TitleOfCourtesy] + ' ' +[LastName] + ', ' +[FirstName] AS Cliente
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
  FROM [dbo].[Employees]
UNION
SELECT  [CustomerID]
      ,[CompanyName]

      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[Phone]
FROM [dbo].[Customers]
GO

/*
Mostrar los apellidos paternos y maternos diferentes
*/
USE pvl
GO
SELECT pat_ben_vc
FROM Beneficiario
UNION
SELECT mat_ben_vc
FROM Beneficiario



/*
Mostrar los 5 apellidos que más se repiten
en la base de datos PVL considerando los apellidos
paternos y maternos
NOTA.- UNION ALL no elimina repetidos
*/
USE pvl
GO
-- SUBCONSULTA
SELECT TOP 5
    pat_ben_vc AS Apellido,
    COUNT(*) AS Cantidad
FROM
(
    SELECT pat_ben_vc
    FROM Beneficiario
    UNION ALL
    SELECT mat_ben_vc
    FROM Beneficiario
) AS SC
GROUP BY pat_ben_vc
ORDER BY 2 DESC
GO
