/*
IS NULL
Verifica si un valor es NULL.

IS NOT NULL	
Verifica si un valor no es NULL.
*/

/*
Northwind: Mostrar todas las ordenes que no han sido entregadas.
*/

--IS NULL
USE Northwind
GO
SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate
FROM Orders
WHERE ShippedDate IS NULL
GO

------------------------------
--IS NOT NULL
/*
Northwind: Mostrar todas las ordenes que han sido entregadas.
*/

USE Northwind
GO
SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate
FROM Orders
WHERE ShippedDate IS NOT NULL
GO