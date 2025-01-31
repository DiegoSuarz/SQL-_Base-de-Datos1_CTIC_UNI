/*
INNER JOIN

El INNER JOIN es un tipo de operador de combinaci�n en SQL que se utiliza 
para combinar filas de dos o m�s tablas basadas en una condici�n de coincidencia.

Este tipo de uni�n devuelve solo las filas que tienen coincidencias en ambas tablas.
 
*/

/*
    Mostrar las cantidades vendidas
    por categor�a
*/
USE Northwind
GO
SELECT
    c.CategoryName AS Categor�a,
    SUM(od.[Quantity]) AS Cantidad
FROM Categories c
INNER JOIN Products p
ON c.CategoryID = p.CategoryID
INNER JOIN [Order Details] od
ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY 2 DESC