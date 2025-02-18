/*
CASE
La sentencia CASE en SQL es una forma de realizar evaluaciones 
condicionales en tus consultas, similar a una estructura if-else
en otros lenguajes de programación.

Permite devolver diferentes resultados según las condiciones especificadas.
*/

USE pvl
GO

SELECT
    pat_ben_vc AS Paterno,
    nom_ben_vc AS Nombres,
	cod_sex_bi AS Sexo,
    CASE cod_sex_bi
        WHEN 0 THEN 'FEMENINO'
        WHEN 1 THEN 'MASCULINO'
        ELSE 'OTRO'
    END AS [Sexo Formateado]
FROM Beneficiario
GO


