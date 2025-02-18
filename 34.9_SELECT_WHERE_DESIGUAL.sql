/*
Operadores de relación
Operador			Descripción

<> o !=				Diferente de: verifica si dos valores no son iguales.
*/

--MOSTRAR TODOS LOS BENEFICIARIOS MASCULINOS
USE pvl
GO
SELECT
    pat_ben_vc AS Paterno,
    nom_ben_vc AS Nombres,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    --cod_sex_bi != 0
	cod_sex_bi <> 0
GO

