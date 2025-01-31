/*
Cuantos registros tiene la
tabla beneficiarios
*/

---CANTIDAD TOTAL DE BENEFICIARIOS:
USE pvl
GO
SELECT COUNT(*) AS [Cantidad de registros]
FROM Beneficiario
GO

----------------------------------------------------------
/*
Cantidad de apellidos paternos quispe
*/
USE pvl
GO
SELECT COUNT(*) AS [Cantidad de registros]
FROM Beneficiario
WHERE pat_ben_vc = 'QUISPE'
GO

----------------------------------------------------------
/*
Cantidad de apellidos paternos Quispe
y apellidos maternos Quispe
*/
USE pvl
GO
SELECT COUNT(*) AS [Cantidad de registros]
FROM Beneficiario
WHERE
    pat_ben_vc = 'QUISPE'
    AND
    mat_ben_vc = 'QUISPE'
GO

----------------------------------------------------------
-- CALCULAR LAS VENTAS TOTALES:
USE Northwind
GO
SELECT
    CONVERT(DECIMAL(19,2),SUM(Quantity*UnitPrice*(1-Discount))) AS Ventas
FROM [Order Details]

--------------------------------------------------------------
/*
    Northwind: Calcular las ventas totales
    en el año 1998
*/
USE Northwind
GO
SELECT
    CONVERT(DECIMAL(19,2),SUM(Quantity*UnitPrice*(1-Discount))) AS Ventas
FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1998
GO

--------------------------------------------------------------
/*
    Mostrar el producto que me ha dado la mayor
    utilidad en las ventas en la tiendas
*/

SELECT 
	unitcost, 
	SUM(SalesAmount) AS Ventas,
	SUM(TotalCost) AS Costos
FROM ContosoDW.[dbo].[FactSales]
---------------------------------------------------------------------------------
