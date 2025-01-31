/*
INNER JOIN

El INNER JOIN es un tipo de operador de combinación en SQL que se utiliza 
para combinar filas de dos o más tablas basadas en una condición de coincidencia.

Este tipo de unión devuelve solo las filas que tienen coincidencias en ambas tablas.
 
*/

/*
    Mostrar las cantidades vendidas
    por categoría
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
GROUP BY c.CategoryName
ORDER BY 2 DESC