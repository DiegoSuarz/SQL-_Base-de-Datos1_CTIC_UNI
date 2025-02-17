/*
INNER JOIN

El INNER JOIN es un tipo de operador de combinación en SQL que se utiliza 
para combinar filas de dos o más tablas basadas en una condición de coincidencia.

Este tipo de unión devuelve solo las filas que tienen coincidencias en ambas tablas.
 
*/

/*
    Mostrar las cantidades vendidas
    por categoría
*/
USE Northwind
GO
----------------------------------
SELECT * FROM Categories GO
SELECT * FROM Products GO
SELECT * FROM [Order Details] G0

----------------------------------


SELECT
    c.CategoryName AS Categoría,
    SUM(od.[Quantity]) AS Cantidad
FROM Categories c
INNER JOIN Products p
ON c.CategoryID = p.CategoryID 
INNER JOIN [Order Details] od
ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY 2 DESC





----------------------------------
/*
Mostrar las utilidades de ventas por internet
por categoría usando la base de datos AdventureWorksDW.
*/
USE AdventureWorksDW2022
GO
SELECT TOP 5
    c.SpanishProductCategoryName AS Categoría,
    CONVERT
    (
        DECIMAL(19,2),
    SUM
    (
    f.OrderQuantity
    *
    (
        f.UnitPrice
        *
        (
            1 -
            IIF
            (
                    f.OrderDate>=p.StartDate
                AND
                    f.OrderDate<=p.EndDate
                AND
                    f.OrderQuantity >= ISNULL(p.MinQty, 1)
                AND
                    f.OrderQuantity <= ISNULL(p.MaxQty, 100000),
                p.DiscountPct,  --VERDADER
                0	--FALSO
            )
        )
        -
        f.ProductStandardCost
        )
        )) AS Utilidad
FROM FactInternetSales f
INNER JOIN DimPromotion p
ON p.PromotionKey = f.PromotionKey
INNER JOIN DimProduct prd
ON f.ProductKey = prd.ProductKey
INNER JOIN DimProductSubcategory sc
ON sc.ProductSubcategoryKey = prd.ProductSubcategoryKey
INNER JOIN DimProductCategory c
ON c.ProductCategoryKey=sc.ProductCategoryKey
GROUP BY c.SpanishProductCategoryName
ORDER BY 2 DESC