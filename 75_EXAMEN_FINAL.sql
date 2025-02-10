--test 4:

/*
Pregunta 1:
Encontrar la categor�a a la que pertenece la mayor cantidad de
productos por categor�a. Mostrar el nombre de la categor�a y la 
cantidad de productos que comprende
*/
USE Northwind
SELECT * FROM [dbo].[Categories]
SELECT * FROM[dbo].[Products]

SELECT TOP 1 C.CategoryName,
		COUNT(*) AS CANTIDAD
FROM Products P
INNER JOIN Categories C
ON P.CategoryID = C.CategoryID
GROUP BY  C.CategoryName
ORDER BY 2 DESC

/*
Pregunta 2:
Mostrar la cantidad de productos descontinuados cuyo
precio es menor al precion promedio
*/
SELECT COUNT(*) AS CantidadProductos
FROM Products
WHERE Discontinued = 1
AND UnitPrice < (SELECT AVG(UnitPrice) FROM Products);


/*
Pregunta 3:
Northwind: �Cu�l es el producto no descontinuado con mayor cantidad de productos
faltantes, cuyo stock actual (unitsinstock) es menor que la cantidad 
de unidades pendientes de despacho?
*/

SELECT ProductName, UnitsOnOrder ,UnitsInStock, (UnitsOnOrder - UnitsInStock)
FROM Products
WHERE Discontinued = 0
AND UnitsInStock < UnitsOnOrder
ORDER BY (UnitsOnOrder - UnitsInStock) desc


SELECT *
FROM Products

/*
Pregunta 4
Cuantos productos han tenido venta en por lo menos 
30  transacciones (ordenes) en el a�o 1997
*/
SELECT * FROM Orders
SELECT * FROM [Order Details]

SELECT COUNT(*)
FROM (
    SELECT ProductID
    FROM [Order Details] od
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE YEAR(o.OrderDate) = 1997
    GROUP BY ProductID
    HAVING COUNT(o.OrderID) >= 30
) AS ProductosFrecuentes;

/*
Pregunta 5:
Obtener los pa�ses donde el importe total anual de las �rdenes enviadas supera los $45.000.
Para determinar el a�o, tome como base la fecha de la orden (orderdate).
Ordene el resultado por a�o y monto total de venta.
Muestre el pa�s, el a�o mayor importe anual en ventas.


*/