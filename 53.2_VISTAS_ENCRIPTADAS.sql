/*
Vistas encriptadas

Devuelve el script de la vista
*/

USE NorthwindSQL
GO
CREATE OR ALTER VIEW v_stock
(
    Código,
    Producto,
    Stock
)
WITH ENCRYPTION
AS
SELECT TOP 99.99 PERCENT
    Id, [Nombre del producto],
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
            END + LTRIM(ti.Cantidad)
        )
    ) AS Stock
FROM Almacen.Productos p
INNER JOIN Almacen.[Transacciones de inventario] ti
ON p.Id = ti.[Id de producto]
GROUP BY Id, [Nombre del producto]
ORDER BY 3 DESC
GO
SELECT * FROM v_stock
GO


