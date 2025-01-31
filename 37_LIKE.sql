/*
La cláusula WHERE en SQL se utiliza para filtrar registros y especificar condiciones 
que deben cumplirse para que los registros sean seleccionados o manipulados.
Es una parte esencial de muchas consultas SQL, ya que te permite obtener solo los
datos que realmente necesitas.

Operadores de relación o comparción de la cláusula WHERE
=	Igual a: Compara si dos valores son iguales.
<> o !=	Diferente de: Compara si dos valores no son iguales.
>	Mayor que: Comprueba si el valor de la izquierda es mayor que el de la derecha.
<	Menor que: Comprueba si el valor de la izquierda es menor que el de la derecha.
>=	Mayor o igual que: Comprueba si el valor de la izquierda es mayor o igual que el de la derecha.
<=	Menor o igual que: Comprueba si el valor de la izquierda es menor o igual que el de la derecha.
BETWEEN	Comprueba si un valor se encuentra dentro de un rango específico.
LIKE	Utilizado para buscar un patrón en una columna de texto.
IN	Comprueba si un valor se encuentra en un conjunto de valores especificado.
IS NULL	Comprueba si un valor es nulo (no se ha asignado).
IS NOT NULL	Comprueba si un valor no es nulo (se ha asignado).

Operador LIKE
El operador LIKE en SQL Server se utiliza en consultas SQL para buscar un patrón 
específico en una columna de tipo texto.

Permite realizar búsquedas más flexibles que una comparación exacta.
*/

/*
Ejemplos:
Mostrar todos los apellidos paternos
que comiencen con la letra Y
%: Reemplaza a un conjunto de caracteres
o números
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc
FROM Beneficiario
WHERE pat_ben_vc LIKE 'y%'
GO

--------------------------------------------------------------------------
/*
    Mostrar a los beneficiarios
    que tengan DNI
*/
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc,
    dni_ben_ch
FROM Beneficiario
WHERE
    LEN(dni_ben_ch) = 8 --SI TIENE 8 DIGITOS, LEN CUANTA EL NUMERO DE CARACTERES QUE TIENE UNA LETRA
ORDER BY cod_ben_in  --ORDENAR POR LA COLUMNA cod_ben_in
GO
--------------------------------------------------------------------------
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc,
    dni_ben_ch
FROM Beneficiario
WHERE
    dni_ben_ch LIKE ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') --SOLO DETECTA VALORES NUMERCIOS - NO LETRAS

ORDER BY cod_ben_in  --ORDENAR POR LA COLUMNA cod_ben_in
GO

--------------------------------------------------------------------------
--LOS VALORES INVALIDOS PARA LOS DNI
USE pvl
GO
SELECT
    cod_ben_in,
    pat_ben_vc,
    mat_ben_vc,
    nom_ben_vc,
    dni_ben_ch
FROM Beneficiario
WHERE
    dni_ben_ch NOT LIKE ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') --SOLO DETECTA VALORES NUMERCIOS - NO LETRAS
						AND  LEN(dni_ben_ch) = 8 

ORDER BY cod_ben_in  --ORDENAR POR LA COLUMNA cod_ben_in
GO
--------------------------------------------------------------------------