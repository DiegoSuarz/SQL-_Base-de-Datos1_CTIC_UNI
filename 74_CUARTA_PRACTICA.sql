USE Northwind

SELECT *
FROM Orders

SELECT *
FROM [Order Details]

SELECT *
FROM Products

/*
En la base de datos Northwind, ¿cuántos clientes tienen más de una orden pendiente de despacho?
*/

SELECT COUNT(*)
FROM (
    SELECT CustomerID , COUNT(*) AS CANTIDAD
    FROM Orders
    WHERE ShippedDate IS NULL
    GROUP BY CustomerID
    HAVING COUNT(*) > 1
) AS PendingOrders;



/*
En la base de datos Northwind, ¿cuántas órdenes pendientes de despacho se
registraron en el mes de mayo?
*/
SELECT COUNT(*)
FROM (
	SELECT CustomerID, OrderDate
			--COUNT(*) AS CANTIDAD
	FROM Orders
	WHERE ShippedDate IS NULL AND  MONTH(OrderDate) = 5
	GROUP BY CustomerID , OrderDate
	) AS SC


/*
En la base de datos Northwind, ¿cuántos clientes tienen solo una orden pendiente de despacho?
*/

SELECT COUNT(*)
FROM (
    SELECT CustomerID , COUNT(*) AS CANTIDAD
    FROM Orders
    WHERE ShippedDate IS NULL
    GROUP BY CustomerID
    HAVING COUNT(*) = 1
) AS PendingOrders;


/*
En la base de datos Northwind, ¿cuántas órdenes pendientes de despacho 
corresponden a compañías cuyo nombre comienza con la letra 'R'
*/


SELECT * FROM Orders
SELECT * FROM Customers

SELECT COUNT(*) AS CANTIDAD_COMP
FROM (
    SELECT 
	C.CustomerID ,
	C.CompanyName,
	COUNT(*) AS CANTIDAD
    FROM Orders O
	INNER JOIN Customers C
	ON O.CustomerID = C.CustomerID
    WHERE O.ShippedDate IS NULL AND C.CompanyName LIKE 'R%'
    GROUP BY C.CustomerID ,
			C.CompanyName
) AS SC;

/*
En la base de datos Northwind, ¿cuántos pedidos están asociados 
a clientes cuya ciudad es diferente a la ciudad de envío?
*/

SELECT * FROM Orders
SELECT * FROM[dbo].[Customers]


SELECT COUNT(*) AS CANTIDAD_DIFF_CIUDAD
FROM(
	SELECT O.ShipCity,-- AS C_ENVIO, 
			C.City, --AS C_ORIGEN
			O.CustomerID
	FROM Orders O
	INNER JOIN Customers C
	ON O.CustomerID = C.CustomerID
	WHERE O.ShipCity <> C.City
	) AS SC





