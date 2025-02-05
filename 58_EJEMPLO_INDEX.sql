-- Creación del índice para la columna Nombre del producto para que la busqueda sea mas rapida

USE NorthwindSQL
GO
IF EXISTS
(
    SELECT name
    FROM sys.indexes
    WHERE name = 'ix_almacen_productos_nombre_del_producto'
)
DROP INDEX ix_almacen_productos_nombre_del_producto
ON [Almacen].[Productos]
GO
----
CREATE INDEX ix_almacen_productos_nombre_del_producto
ON [Almacen].[Productos]
(
	[Nombre del producto]
)
GO
---
CREATE NONCLUSTERED INDEX [ix_personal_empleados_cod_rol_in]
ON [Personal].[Empleados]
(
    [cod_rol_in] ASC
)
WITH
(
    PAD_INDEX = ON,
    FILLFACTOR = 70, --70% de llenado
    DROP_EXISTING=ON
) ON [PRIMARY]

