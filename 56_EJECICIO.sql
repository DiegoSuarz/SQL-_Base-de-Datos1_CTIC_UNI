/*
La empresa tiene como política otorgar a los jefes una comisión 
del 0.5% sobre la venta de sus subordinados.

Calcule la comisión mensual que le ha correspondido a cada jefe
por cada año (basándose en la fecha de la orden) según las ventas
que figuran en la base de datos.

Muestre el código del jefe, su apellido, el año y mes de cálculo, 
el monto acumulado de venta de sus subordinados, y la comisión obtenida.

*/

USE Northwind
GO
SELECT
    j.EmployeeID, j.LastName AS APELLIDO,
    e.EmployeeID, e.LastName AS APELLIDO,
    YEAR(o.OrderDate) AS AÑO,
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
    j.EmployeeID AS Código,
    j.LastName AS Apellido,
    YEAR(o.OrderDate) AS Año,
    DATENAME(MONTH,o.OrderDate) AS Mes,
    CONVERT(DECIMAL(12,2), SUM(od.Quantity * od.UnitPrice * (1-od.Discount))) AS [Monto acumulado],
    CONVERT(DECIMAL(12,2), SUM(od.Quantity * od.UnitPrice * (1-od.Discount)) * 0.5/100.0) AS Comisión
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