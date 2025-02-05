/*
    El Stock de los productos
    Año: 2007
*/
USE NorthwindSQL
GO

 SELECT * FROM Almacen.[Transacciones de inventario]


SELECT
    p.Id,
    p.[Código de producto],
    p.[Nombre del producto],
    SUM
    (
        CONVERT
        (
            INT,
            CASE ti.[Tipo de transacción]
                WHEN 1 THEN '+'
                WHEN 2 THEN '-'
                WHEN 3 THEN '-'
                WHEN 4 THEN '+'
            END +
            LTRIM(ti.Cantidad)
        )
    ) AS Stock
FROM Almacen.Productos p
INNER JOIN Almacen.[Transacciones de inventario] ti
ON p.Id = ti.[Id de producto]
GROUP BY
    p.Id,
    p.[Código de producto],
    p.[Nombre del producto]
ORDER BY 4 DESC
GO
