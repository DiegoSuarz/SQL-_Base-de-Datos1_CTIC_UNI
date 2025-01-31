-- RELLANAR COLUMNA DE LA TABLA EMPLEADOS:
USE NorthwindSQL
GO
UPDATE Personal.Empleados
SET
    pwd_emp_vb = PWDENCRYPT(dni_emp_ch),  --RELLENAR LA COLUMNA pwd_emp_vb DE LA TABLA EMPLEADOS
    est_emp_bi = 1,					--CAMBIAR EL VALOR DE LA COLUMNA  est_emp_bi
    [Datos adjuntos]=NULL,			--
    Compañía = 'Northwind Traders',
    [Dirección de correo electrónico]=LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LEFT(Nombre,1)+Apellidos,'á','a'), 'é', 'e'), 'í', 'i'),'ó','o'),'ú', 'u'), ' ', '_')+'@northwindtraders.com')
GO
SELECT * FROM Personal.Empleados
GO