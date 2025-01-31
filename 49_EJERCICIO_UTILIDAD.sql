/*
    Mostrar el producto que me ha dado la mayor
    utilidad en las ventas en la tiendas
    Fabrikam   Cineasta independiente 1 '' 25 mm X400 Negro
    Fabrikam   Cineasta independiente 1 '' 25 mm X400 Negro
*/
USE ContosoDW
GO
---fs.ReturnQuantity-fs.DiscountQuantity
SELECT TOP 1
    p.[ProductName] AS PRODUCTO,

    SUM
    (
        (fs.SalesQuantity-fs.ReturnQuantity)
        *
            p.UnitPrice
        *
        (
            1
            -
            IIF
            (
                    fs.[DiscountQuantity] = 0
                AND
                    fs.DateKey >= pro.[StartDate]
                AND
                    fs.DateKey <= pro.[EndDate],
                pro.[DiscountPercent],
                0
            )
        )
    ) AS VentasCal,
    SUM(p.UnitCost * (fs.SalesQuantity)) AS CostosCal,
    SUM
    (
        (fs.SalesQuantity-fs.ReturnQuantity)
        *
            p.UnitPrice
        *
        (
            1
            -
            IIF
            (
                    fs.[DiscountQuantity] = 0
                AND
                    fs.DateKey >= pro.[StartDate]
                AND
                    fs.DateKey <= pro.[EndDate],
                pro.[DiscountPercent],
                0
            )
        )
    )
    -
    SUM(p.UnitCost * (fs.SalesQuantity))
    AS UtilidadCal,
    SUM(fs.SalesAmount) AS Ventas,
    SUM(fs.TotalCost) AS Costos,
    SUM(fs.SalesAmount)-SUM(fs.TotalCost) AS Utilidad
FROM  DimPromotion pro
INNER JOIN FactSales AS fs
ON pro.PromotionKey = fs.PromotionKey
INNER JOIN DimProduct p
ON p.ProductKey = fs.ProductKey
GROUP BY p.[ProductName]
--ORDER BY 6 DESC
ORDER BY 4 DESC
GO