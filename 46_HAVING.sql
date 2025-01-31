/*
    ¿Cuantas categorias pasan de
    las 6000 unidades vendidas?
*/
USE Northwind
GO
SELECT
    c.CategoryName AS Categoría,
    SUM(od.[Quantity]) AS Cantidad
FROM Categories c
INNER JOIN Products p
ON c.CategoryID = p.CategoryID
INNER JOIN [Order Details] od
ON p.ProductID = od.ProductID
INNER JOIN Orders o
ON o.OrderID = od.OrderID
GROUP BY c.CategoryName
HAVING SUM(od.[Quantity]) > 6000
ORDER BY 2 DESC

-----------------------------------------------------
USE Northwind
GO
SELECT COUNT(*) AS Cantidad
FROM
(
SELECT
    c.CategoryName AS Categoría,
    SUM(od.[Quantity]) AS Cantidad
FROM Categories c
INNER JOIN Products p
ON c.CategoryID = p.CategoryID
INNER JOIN [Order Details] od
ON p.ProductID = od.ProductID
INNER JOIN Orders o
ON o.OrderID = od.OrderID
GROUP BY c.CategoryName
HAVING SUM(od.[Quantity]) > 6000
) AS SC