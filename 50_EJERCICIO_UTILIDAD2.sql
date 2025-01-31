/*
    Mostrar el producto que me ha dado la mayor
    utilidad en las ventas en la tiendas
    Mountain-200 Black, 38    Montaña: 200, negra, 38    2368672.22
*/
USE AdventureWorksDW2022
GO
SELECT TOP 1
    p.EnglishProductName,
    p.SpanishProductName,
    CONVERT
    (
        DECIMAL(19, 2),
        SUM
        (
            frs.OrderQuantity
            *
            p.ListPrice
            *
            (
                1
                -
                IIF
                (
                    -- Condición
                        frs.OrderDate >= pro.StartDate
                    AND
                        frs.OrderDate <= pro.EndDate
                    AND
                        frs.OrderQuantity >= pro.[MinQty]
                    AND
                        frs.OrderQuantity <= ISNULL(pro.[MaxQty], 99999),
                    -- Verdadera
                        pro.DiscountPct,
                    -- Falsa
                        0

                )
            )
        ) -
        SUM(frs.OrderQuantity*p.StandardCost)
    ) AS Utilidad
FROM DimProduct p
INNER JOIN FactResellerSales frs
ON p.ProductKey = frs.ProductKey
INNER JOIN DimPromotion pro
ON pro.PromotionKey = frs.PromotionKey
GROUP BY
    p.EnglishProductName,
    p.SpanishProductName
ORDER BY 3 DESC
GO