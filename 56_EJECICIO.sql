/*
La empresa tiene como pol�tica otorgar a los jefes una comisi�n 
del 0.5% sobre la venta de sus subordinados.

Calcule la comisi�n mensual que le ha correspondido a cada jefe
por cada a�o (bas�ndose en la fecha de la orden) seg�n las ventas
que figuran en la base de datos.

Muestre el c�digo del jefe, su apellido, el a�o y mes de c�lculo, 
el monto acumulado de venta de sus subordinados, y la comisi�n obtenida.

*/

USE Northwind
GO
SELECT
    j.EmployeeID, j.LastName AS APELLIDO,
    e.EmployeeID, e.LastName AS APELLIDO,
    YEAR(o.OrderDate) AS A�O,
    DATENAME(MONTH,o.OrderDate) AS MES,
    od.Quantity * od.UnitPrice * (1-od.Discount) AS COMISION
FROM Employees j
INNER JOIN Employees e
ON j.EmployeeID = e.ReportsTo
INNER JOIN Orders o
ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
ORDER BY 1, 3

---------------------------------------------------------------------------------------

USE Northwind
GO
SELECT
    j.EmployeeID AS C�digo,
    j.LastName AS Apellido,
    YEAR(o.OrderDate) AS A�o,
    DATENAME(MONTH,o.OrderDate) AS Mes,
    CONVERT(DECIMAL(12,2), SUM(od.Quantity * od.UnitPrice * (1-od.Discount))) AS [Monto acumulado],
    CONVERT(DECIMAL(12,2), SUM(od.Quantity * od.UnitPrice * (1-od.Discount)) * 0.5/100.0) AS Comisi�n
FROM Employees j
INNER JOIN Employees e
ON j.EmployeeID = e.ReportsTo
INNER JOIN Orders o
ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY
    j.EmployeeID, j.LastName,
    YEAR(o.OrderDate),
    MONTH(o.OrderDate),
    DATENAME(MONTH,o.OrderDate)
ORDER BY 1, 3, MONTH(o.OrderDate)