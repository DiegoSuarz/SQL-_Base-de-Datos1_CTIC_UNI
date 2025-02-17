/*
LIKE
El operador LIKE en SQL es una herramienta utilizada en la cláusula 
WHERE para buscar patrones en columnas de tipo texto.

Permite realizar consultas más flexibles y específicas al filtrar
resultados en función de coincidencias parciales en cadenas de texto.

Caracteres Comodín
%:	Representa cero o más caracteres. Se puede usar en cualquier parte 
	el patrón.
_:	Representa un solo carácter. Se puede usar para especificar la 
	posición de un carácter exacto en el patrón.
*/

/*
    Mostrar los beneficiarios cuyo apellido paterno comience con la letra P
*/
USE pvl
GO
SELECT
    
    pat_ben_vc AS Paterno,
    nom_ben_vc AS Nombres,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    pat_ben_vc LIKE 'p%'
ORDER BY 4
GO

-----------------------------------------
/*
    Mostrar los beneficiarios cuyo apellido paterno termine con la letra Y
*/
USE pvl
GO
SELECT
    pat_ben_vc AS Paterno,
    nom_ben_vc AS Nombres,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    pat_ben_vc LIKE '%Y'
ORDER BY 1
GO

-----------------------------------------
/*
    Mostrar los beneficiarios cuyo apellido paterno contenga la palabra 'AMOR'
*/
USE pvl
GO
SELECT
    pat_ben_vc AS Paterno,
    nom_ben_vc AS Nombres,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    pat_ben_vc LIKE '%AMOR%'
ORDER BY 1
GO

-----------------------------------------
/*
    Mostrar los beneficiarios cuyo apellido paterno en su tercer caracter es la letra Y
*/
USE pvl
GO
SELECT
    
    pat_ben_vc AS Paterno,
    nom_ben_vc AS Nombres,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    pat_ben_vc LIKE '__[Y]%'
ORDER BY 1
GO

-------------------------------------------
/*
    Mostrar los beneficiarios cuyo apellido
    paterno en su tercer caracter es la letra M, P o R
*/
USE pvl
GO
SELECT
    SUBSTRING(pat_ben_vc, 3, 1) AS Caracter,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    pat_ben_vc LIKE '__[MPR]%'
ORDER BY 1, 3
GO

-------------------------------------------
/*
    Mostrar los beneficiarios cuyo apellido
    paterno en su tercer caracter es la letra 'J' hasta la letra 'R'
*/
USE pvl
GO
SELECT
    SUBSTRING(pat_ben_vc, 3, 1) AS Caracter,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    pat_ben_vc LIKE '__[J-R]%'
ORDER BY 1, 3
GO


-------------------------------------------
/*
    Mostrar los beneficiarios cuyo apellido
    paterno en su tercer caracter NO SEA la letra 'J' hasta la letra 'R'
*/
USE pvl
GO
SELECT
    SUBSTRING(pat_ben_vc, 3, 1) AS Caracter,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    pat_ben_vc NOT LIKE '__[J-R]%'
ORDER BY 1, 3
GO


-------------------------------------------
/*
    Mostrar los beneficiarios cuyo apellido
    paterno en su tercer caracter NO SEA la letra 'J' hasta la letra 'R'
*/
USE pvl
GO
SELECT
    SUBSTRING(pat_ben_vc, 3, 1) AS Caracter,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    CHOOSE(cod_sex_bi+1, 'FEMENINO', 'MASCULINO') Sexo,
    CONVERT(INT, DATEDIFF(DAY, fec_nac_ben_da, CONVERT(DATE, '31/07/2004', 103) )/365.256363004) AS Edad
FROM Beneficiario
WHERE
    pat_ben_vc LIKE '__[^J-R]%'
ORDER BY 1, 3
GO