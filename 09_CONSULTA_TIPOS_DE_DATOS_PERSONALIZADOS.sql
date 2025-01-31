USE empresa_oti
GO

SELECT t2.name,t1.name,t2.length, t2.xprec,t2.xscale
FROM systypes t1
INNER JOIN systypes t2
ON t1.xusertype = t2.xtype
WHERE t2.name LIKE 'td%'
GO
----------------------------------------------------------------------
SELECT  t2.name+':'+t1.name,t2.name,t1.name,t2.length, t2.xprec,t2.xscale
FROM systypes t1
INNER JOIN systypes t2
ON t1.xusertype = t2.xtype
WHERE t2.name LIKE 'td%'
GO
----------------------------------------------------------------------
SELECT t2.name+':'+t1.name
+
CASE t2.xprec
    WHEN 0 THEN '('+LTRIM(t2.length)+')'
    ELSE
        CASE t2.xscale
            WHEN 0 THEN ''
            ELSE '('+LTRIM(t2.xprec)+','+LTRIM(t2.xscale)+')'
        END
END AS 'Tipo de dato definido por el usuario'
FROM systypes t1
INNER JOIN systypes t2
ON t1.xusertype = t2.xtype
WHERE t2.name LIKE 'td%'
GO

