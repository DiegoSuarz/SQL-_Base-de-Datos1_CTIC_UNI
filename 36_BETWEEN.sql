/*
Operador BETWEEN
El operador BETWEEN en SQL Server se utiliza para filtrar resultados 
dentro de un rango específico de valores.

Es útil para seleccionar filas donde una columna tiene un valor que 
se encuentra entre dos límites, inclusivos.
*/

/*
    Mostrar al beneficiario
    con código 10 hasta 20
    incluyendo ambos
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc
FROM Beneficiario
WHERE cod_ben_in BETWEEN 10 AND 20
ORDER BY 1


/*
Funcion DATEDIFF
La función DATEDIFF en SQL Server se utiliza para calcular la diferencia entre dos fechas.
Devuelve un valor entero que representa la cantidad de intervalos especificados
(como días, meses, años, etc.) entre las dos fechas proporcionadas.
*/

/*
PVL: ¿Mostrar los beneficiarios que son madres gestantes al 31/07/2004?
*/

USE pvl
GO
SELECT *
FROM Beneficiario
WHERE DATEDIFF(DAY, fec_emb_ben_da, '20040731')/7 BETWEEN 0 AND 42  --0 a4 2 periodo de embarazo, entre 7 convierte los dias en semanas
GO

-- DATEDIFF(DAY, fec_emb_ben_da, '20040731')/7 --calular la diferencia de dias, transformar dias a semanas, y que el rango sea de 0 a 42
