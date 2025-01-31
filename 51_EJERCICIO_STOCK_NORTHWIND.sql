/*
    El Stock de los productos
    A�o: 1998
*/
USE Northwind
GO
SELECT
    ProductID,
    ProductName,
    UnitsInStock AS Stock
FROM Products
WHERE UnitsInStock<=10
ORDER BY 3 DESC
GO