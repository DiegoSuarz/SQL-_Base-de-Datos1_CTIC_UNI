--Cantidad de objetos de una base de datos

USE master
GO
SELECT
    xtype As Tipo,
    CASE xtype
        WHEN 'AF' THEN 'Función de agregado (CLR)'
        WHEN 'C' THEN 'Restricción CHECK'
        WHEN 'D' THEN 'Valor predeterminado o restricción DEFAULT'
        WHEN 'F' THEN 'Restricción FOREIGN KEY'
        WHEN 'L' THEN 'Registro'
        WHEN 'FN' THEN 'Función escalar'
        WHEN 'FS' THEN 'Función escalar del ensamblado (CLR)'
        WHEN 'FT' THEN 'Función con valores de tabla de ensamblado (CLR)'
        WHEN 'IF' THEN 'Función de tabla en línea'
        WHEN 'IT' THEN 'Tabla interna'
        WHEN 'P' THEN 'Procedimiento almacenado'
        WHEN 'PC' THEN 'Procedimiento almacenado del ensamblado (CLR)'
        WHEN 'PK' THEN 'Restricción PRIMARY KEY (de tipo K)'
        WHEN 'RF' THEN 'Procedimiento almacenado de filtro de replicación'
        WHEN 'S' THEN 'Tabla del sistema'
        WHEN 'SN' THEN 'Sinónimo'
        WHEN 'SO' THEN 'Secuencia'
        WHEN 'SQ' THEN 'Cola de servicio'
        WHEN 'TA' THEN 'Desencadenador DML del ensamblado (CLR)'
        WHEN 'TF' THEN 'Función de tabla'
        WHEN 'TR' THEN 'Desencadenador DML de SQL'
        WHEN 'TT' THEN 'Tipo de tabla'
        WHEN 'U' THEN 'Tabla de usuario'
        WHEN 'UQ' THEN 'Restricción UNIQUE (de tipo K)'
        WHEN 'V' THEN 'Vista'
        WHEN 'X' THEN 'Procedimiento almacenado extendido'
    END AS Descripción,
    COUNT(*) AS Cantidad
FROM sysobjects
GROUP BY xtype
ORDER BY 3 DESC