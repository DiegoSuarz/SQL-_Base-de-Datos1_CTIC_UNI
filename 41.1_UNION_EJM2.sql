/*
    Mostrar todos los apellidos diferentes
    que se encuentran en la base de datos
    PVL. Considerar los apellidos paternos
    y maternos
*/
USE pvl
GO
SELECT pat_ben_vc FROM Beneficiario
GO
SELECT mat_ben_vc FROM Beneficiario
GO

SELECT pat_ben_vc
FROM Beneficiario
WHERE LEN(pat_ben_vc)>1 --elimanar los espacios en blacos
UNION
SELECT mat_ben_vc
FROM Beneficiario
WHERE LEN(mat_ben_vc)>1
GO

---------------------------------------------------------------------
--SEGUNDA OPCION
USE pvl
GO
-- SUBCONSULTA
SELECT DISTINCT pat_ben_vc
FROM
(
    SELECT pat_ben_vc
    FROM Beneficiario
    UNION ALL
    SELECT mat_ben_vc
    FROM Beneficiario
) AS Apellidos
WHERE LEN(pat_ben_vc)>1
GO

-------------------------------------------------------------
--TERCERA FORMA:
USE pvl
GO
-- SUBCONSULTA
SELECT pat_ben_vc
FROM
(
    SELECT pat_ben_vc
    FROM Beneficiario
    UNION ALL
    SELECT mat_ben_vc
    FROM Beneficiario
) AS Apellidos
WHERE LEN(pat_ben_vc)>1
GROUP BY pat_ben_vc
GO