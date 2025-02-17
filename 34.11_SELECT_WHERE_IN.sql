/*
IN
El operador IN se utiliza en SQL para comprobar si un valor 
dado está presente dentro de un conjunto de valores definidos.

Es una forma eficiente de filtrar registros sin tener que usar
múltiples condiciones con el operador OR.
*/

/*
    Mostrar los beneficiarios cuyo apellido paterno es LUIS, CARLOS, ROJAS
*/
USE pvl
GO
SELECT
    pat_ben_vc AS Paterno,
    nom_ben_vc AS Nombres,
    CONVERT(CHAR(10), fec_nac_ben_da, 103) AS [Fecha de Nacimiento],
    dni_ben_ch AS DNI,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE pat_ben_vc IN ('LUIS', 'CARLOS', 'ROJAS')
ORDER BY 2
GO