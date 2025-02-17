USE pvl
GO
---
SELECT
    cod_ben_in AS Código,
    pat_ben_vc AS Paterno,
    mat_ben_vc AS Materno,
    nom_ben_vc AS Nombres,
    fec_nac_ben_da AS [Fecha de Nacimiento],
    dni_ben_ch AS DNI,
    cod_sex_bi AS Sexo
FROM Beneficiario
GO

---
SELECT
    Código = cod_ben_in,
    Paterno = pat_ben_vc,
    Materno = mat_ben_vc,
    Nombres = nom_ben_vc,
    'Fecha de Nacimiento' = fec_nac_ben_da,
    DNI = dni_ben_ch,
    Sexo = cod_sex_bi
FROM Beneficiario
GO