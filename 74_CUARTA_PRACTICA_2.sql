/*
Northwind: �Cuantos registros muestra la tabla Orders, para los pedidos
cuya diferencia entre la fecha de despacho y la fecha de la orden sea 
mayor a 4 semanas?
*/


USE Northwind
GO
SELECT
    OrderID,
    DATEDIFF(DAY, OrderDate, ShippedDate) AS D�as,
    DATEDIFF(DAY, OrderDate, ShippedDate)/7.0 AS Semanas1,
    DATEDIFF(DAY, OrderDate, ShippedDate)/7 AS Semanas2
FROM Orders
WHERE
    DATEDIFF(DAY, OrderDate, ShippedDate)/7 > 4
GO


/*
Northwind: La empresa tiene como pol�tica otorgar a los jefes
una comisi�n del 0.5% sobre la venta de sus subordinados.
Calcule la comisi�n mensual que le ha correspondido al
jefe Fuller en el mes de Julio de 1996, seg�n las ventas
que figuran en la base de datos.
(bas�ndose en la fecha de la orden)
*/
USE Northwind
GO
SELECT j.EmployeeID, j.LastName,
YEAR(o.OrderDate),
DATENAME(MONTH, o.OrderDate) AS Mes,
MONTH(o.OrderDate) AS MesNum,
CONVERT(DECIMAL(9,2), SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))) AS Monto,
CONVERT(DECIMAL(9,2), SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) * 0.5/100.0) AS Comisi�n
FROM Employees j
INNER JOIN Employees e
ON j.EmployeeID = e.ReportsTo
INNER JOIN Orders o
ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY
    j.EmployeeID,
    j.LastName,
    YEAR(o.OrderDate),
    DATENAME(MONTH, o.OrderDate),
    MONTH(o.OrderDate)
ORDER BY 1, 3, 5, 6 DESC



/*
Obtener el segundo mejor pa�s en el a�o 1998, donde el importe total
anual de las �rdenes enviadas supera los $45,000.
Para determinar el a�o, tome como base la fecha de la orden (orderdate).
Ordene el resultado por monto total de venta en forma descendente.
*/
USE Northwind
GO
SELECT
    o.ShipCountry AS Pa�s,
    YEAR(o.OrderDate) AS A�o,
    SUM(od.Quantity * od.UnitPrice * (1-od.Discount)) AS Monto
FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
WHERE
        o.ShippedDate IS NOT NULL
    AND
        YEAR(o.OrderDate) = 1998
GROUP BY
    o.ShipCountry,
    YEAR(o.OrderDate)
HAVING
    SUM(od.Quantity * od.UnitPrice * (1-od.Discount)) > 45000
ORDER BY 2, 3 DESC
GO


/*
De cada producto que haya tenido venta en por lo menos 20 transacciones 
(ordenes) del a�o 1997.
�Cu�l es el segundo mejor producto de esa lista?
*/
USE Northwind
GO
SELECT
    p.ProductID,
    p.ProductName,
    COUNT(o.OrderID) AS Cantidad
FROM Products p
INNER JOIN [Order Details] od
ON p.ProductID = od.ProductID
INNER JOIN Orders o
ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY
    p.ProductID,
    p.ProductName
HAVING
    COUNT(o.OrderID) >= 20
ORDER BY 3 DESC



/*
La cantidad de registros de productos descontinuados (nombre y precio)
cuyo precio es menor al precio promedio es
*/

USE Northwind
GO
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE
    Discontinued = 1
    AND
    UnitPrice < (SELECT AVG(UnitPrice) FROM Products)
GO