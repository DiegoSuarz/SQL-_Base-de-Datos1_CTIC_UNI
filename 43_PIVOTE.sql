/*
PIVOT
--PERMITE TRANSPONER LA TABLA

SELECT [ <non-pivoted column> [ AS <column name> ] , ]
    ...
    [ <first pivoted column> [ AS <column name> ] ,
    [ <second pivoted column> [ AS <column name> ] , ]
    ...
    [ <last pivoted column> [ AS <column name> ] ] ]
FROM
    ( <SELECT query that produces the data> )
    AS <alias for the source query>
PIVOT
(
    <aggregation function> ( <column being aggregated> )
FOR <column that contains the values that become column headers>
    IN ( <first pivoted column>
         , <second pivoted column>
         , ... <last pivoted column> )
) AS <alias for the pivot table>
[ <optional ORDER BY clause> ]
[ ; ]
*/

/*
    Mostrar los 5 apellidos que más se
    repiten en la base de datos    PVL.

    Considerar los apellidos paternos
    y maternos

	CREAR NUEVA TABLA QUE MUESTRE
*/
USE pvl
GO
SELECT
    [QUISPE],
    [FLORES],
    [ROJAS],
    [HUAMAN],
    [SANCHEZ]
FROM
(
    SELECT pat_ben_vc
    FROM Beneficiario
    UNION ALL
    SELECT mat_ben_vc
    FROM Beneficiario
) AS SubConsulta
PIVOT
(
    COUNT(pat_ben_vc)
    FOR pat_ben_vc IN
    (
        [QUISPE],
        [FLORES],
        [ROJAS],
        [HUAMAN],
        [SANCHEZ]
    )

) AS Pivote