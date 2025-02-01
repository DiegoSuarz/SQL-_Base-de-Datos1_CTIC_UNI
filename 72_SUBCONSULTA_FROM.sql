--Subconsulta en el FROM

USE Northwind
GO
SELECT
    ( SELECT CategoryName FROM Categories WHERE CategoryID = sc.CategoryID ) AS Categoría,
    Promedio
FROM
(
    SELECT CategoryID, AVG(UnitPrice) AS Promedio
    FROM Products
    GROUP BY CategoryID
) AS SC
WHERE Promedio >= (SELECT AVG(UnitPrice) FROM Products)
GO