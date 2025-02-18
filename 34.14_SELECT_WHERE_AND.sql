/*
Operadores Lógicos
Operador	Descripción
AND			Devuelve verdadero si ambas condiciones son verdaderas.
*/

/*
    Mostrar los beneficiarios cuyo apellido paterno es QUISPE y
	su apellido materno es QUISPE
*/
USE pvl
GO
SELECT 
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CONVERT(CHAR(10), fec_nac_ben_da, 103) AS [Fecha de Nacimiento],
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE pat_ben_vc = 'QUISPE' AND mat_ben_vc = 'QUISPE'
ORDER BY 2
GO