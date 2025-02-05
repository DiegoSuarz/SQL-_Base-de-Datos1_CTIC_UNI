USE pvl
GO

SELECT cod_sex_bi FROM Beneficiario GO


SELECT
    [0] AS FEMENINO,
    [1] AS MASCULINO,
    [0]+[1] AS TOTAL,
    CONVERT(DECIMAL(9,2),[0] / CONVERT(FLOAT,([0]+[1]))*100.0) AS [% Femenino],
    CONVERT(DECIMAL(9,2),[1] / CONVERT(FLOAT,([0]+[1]))*100.0) AS [% Masculino]
FROM
(
    SELECT cod_sex_bi
    FROM Beneficiario
) AS SC
PIVOT
(
    COUNT(cod_sex_bi)
    FOR cod_sex_bi IN ([0], [1])
) AS Pivote