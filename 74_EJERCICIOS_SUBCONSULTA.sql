/*
MÓDULO 4.- SUBCONSULTAS Y VISTAS
SubConsultas
Las subconsultas en SQL Server son consultas anidadas dentro de otra consulta.

Se utilizan para realizar operaciones más complejas y pueden ser útiles en 
diversas situaciones, como filtrar resultados, calcular valores agregados, 
o verificar condiciones.

Subconsultas que entregan un solo valor
*/

/*
    Quienes son los clientes del mes de marzo del 1997
*/


SELECT	C.CustomerID AS [ID CONSUMIDOR], 
				CompanyName AS [NOMBRE COMPAÑIA],
				Country AS PAIS,
				City AS CIUDAD,
				ISNULL(Region, '') AS REGION,
				CONVERT(CHAR,O.OrderDate,103) AS FECHA
		FROM Customers C
		INNER JOIN Orders  O ON C.CustomerID = O.CustomerID
		WHERE 
		(
					YEAR(O.OrderDate) = 1997
				AND
					MONTH(O.OrderDate) = 3
		)
USE Northwind
GO

/*
    Cuantos clientes compraron el mes de marzo del 1997
*/
SELECT  COUNT(*) AS [CANTIDAD DE CLIENTES]
FROM
	(
		SELECT	C.CustomerID AS [ID CONSUMIDOR], 
				CompanyName AS [NOMBRE COMPAÑIA],
				Country AS PAIS,
				City AS CIUDAD,
				ISNULL(Region, '') AS REGION,
				CONVERT(CHAR,O.OrderDate,103) AS FECHA
		FROM Customers C
		INNER JOIN Orders  O ON C.CustomerID = O.CustomerID
		WHERE 
		(
					YEAR(O.OrderDate) = 1997
				AND
					MONTH(O.OrderDate) = 3
		)
	) AS SC


--Northwind: ¿Cuantos productos superan el promedio de precios de venta?

-- ¿Cuantos productos superan el promedio de precios de venta?


USE Northwind
 
SELECT COUNT(*)
FROM (
		SELECT ProductID, ProductName
		FROM Products
		WHERE	UnitPrice <
				( 
					SELECT AVG(UnitPrice)
					FROM Products
				)
	 )AS SC



--Northwind: ¿Cuantos productos superan el promedio de precios de venta?

-- ¿Cuantos productos superan el promedio de precios de venta?
-- a. 915
-- b. 916
-- c. 91
-- d. 191
-- e. N. A.

USE deltron
GO

SELECT COUNT(*) AS [Cantidad de productos]
FROM
(
    SELECT cod_prd_in, cod_prd_vc, nom_prd_vc, pre_ven_prd_mo
    FROM Almacen.producto
    WHERE pre_ven_prd_mo >
    (
        SELECT avg(pre_ven_prd_mo)
        FROM Almacen.producto
    )
) AS SC



GO
/*
NorthwindSQL: ¿Cuantos productos superan el promedio de precios de venta?
*/

USE NorthwindSQL
SELECT COUNT(*) AS [Productos superan el promedio de precios de venta]
FROM
(
    SELECT Id, [Nombre del producto], [Precio listado]
    FROM Almacen.Productos
    WHERE
        [Precio listado]
        >
        (
            SELECT AVG([Precio listado])
            FROM Almacen.Productos
        )
) AS SC


/*
¿Cuantos empleados superaron el promedio de ventas de los empleados?
    a. 1
    b. 2
    c. 3
    d. 4
    e. N.A.
*/

USE Northwind
GO
SELECT COUNT(*) AS [Cantidad de empleados superaron el promedio de ventas]
FROM
(
	SELECT
		e.EmployeeID, e.LastName,
		CONVERT(DECIMAL(12,2), SUM(od.Quantity*od.UnitPrice*(1-od.Discount))) AS Monto
	FROM Employees e
	INNER JOIN Orders o
	ON e.EmployeeID = o.EmployeeID
	INNER JOIN [Order Details] od
	ON o.OrderID=od.OrderID
	GROUP BY e.EmployeeID, e.LastName
	HAVING SUM(od.Quantity*od.UnitPrice*(1-od.Discount))
	>
	(
		SELECT AVG(Monto) AS Promedio
		FROM
		(
			SELECT
				e.EmployeeID, e.LastName,
				SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) AS Monto
			FROM Employees e
			INNER JOIN Orders o
			ON e.EmployeeID = o.EmployeeID
			INNER JOIN [Order Details] od
			ON o.OrderID=od.OrderID
			GROUP BY e.EmployeeID, e.LastName
		) AS SC
	)
) AS SC2
GO


/*
Encontrar el pedido de mayor importe por país al cual se despachó.
Mostrar el país y el monto del pedido,
ordenado por monto de mayor a menor.
*/
USE Northwind
GO
--Argentina 2220
--Austria 8623.45001220703
SELECT
    SC2.ID,
    SC2.País,
    CONVERT(DECIMAL(9,2), SC2.Monto) AS Monto
FROM
(
SELECT
    o.OrderID AS ID,
    o.ShipCountry País,
    SUM(od.Quantity * od.UnitPrice * (1-od.Discount)) AS Monto
FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
WHERE o.ShippedDate IS NOT NULL
GROUP BY
    o.OrderID,
    o.ShipCountry
) AS SC2
INNER JOIN
(
    SELECT
        País,
        MAX(Monto) AS Monto
    FROM
    (
        SELECT
            o.OrderID AS ID,
            o.ShipCountry País,
            SUM(od.Quantity * od.UnitPrice * (1-od.Discount)) AS Monto
        FROM Orders o
        INNER JOIN [Order Details] od
        ON o.OrderID = od.OrderID
        WHERE o.ShippedDate IS NOT NULL
        GROUP BY
            o.OrderID,
            o.ShipCountry
        --ORDER BY 2, 3 DESC
    ) AS SC1
    GROUP BY País
) AS SC3
ON  SC2.País = SC3.País
    AND
    SC2.Monto = SC3.Monto
ORDER BY 3 DESC
GO