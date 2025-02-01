--Cantidad de objetos de una base de datos

USE master
GO
SELECT
    xtype As Tipo,
    CASE xtype
        WHEN 'AF' THEN 'Funci�n de agregado (CLR)'
        WHEN 'C' THEN 'Restricci�n CHECK'
        WHEN 'D' THEN 'Valor predeterminado o restricci�n DEFAULT'
        WHEN 'F' THEN 'Restricci�n FOREIGN KEY'
        WHEN 'L' THEN 'Registro'
        WHEN 'FN' THEN 'Funci�n escalar'
        WHEN 'FS' THEN 'Funci�n escalar del ensamblado (CLR)'
        WHEN 'FT' THEN 'Funci�n con valores de tabla de ensamblado (CLR)'
        WHEN 'IF' THEN 'Funci�n de tabla en l�nea'
        WHEN 'IT' THEN 'Tabla interna'
        WHEN 'P' THEN 'Procedimiento almacenado'
        WHEN 'PC' THEN 'Procedimiento almacenado del ensamblado (CLR)'
        WHEN 'PK' THEN 'Restricci�n PRIMARY KEY (de tipo K)'
        WHEN 'RF' THEN 'Procedimiento almacenado de filtro de replicaci�n'
        WHEN 'S' THEN 'Tabla del sistema'
        WHEN 'SN' THEN 'Sin�nimo'
        WHEN 'SO' THEN 'Secuencia'
        WHEN 'SQ' THEN 'Cola de servicio'
        WHEN 'TA' THEN 'Desencadenador DML del ensamblado (CLR)'
        WHEN 'TF' THEN 'Funci�n de tabla'
        WHEN 'TR' THEN 'Desencadenador DML de SQL'
        WHEN 'TT' THEN 'Tipo de tabla'
        WHEN 'U' THEN 'Tabla de usuario'
        WHEN 'UQ' THEN 'Restricci�n UNIQUE (de tipo K)'
        WHEN 'V' THEN 'Vista'
        WHEN 'X' THEN 'Procedimiento almacenado extendido'
    END AS Descripci�n,
    COUNT(*) AS Cantidad
FROM sysobjects
GROUP BY xtype
ORDER BY 3 DESC