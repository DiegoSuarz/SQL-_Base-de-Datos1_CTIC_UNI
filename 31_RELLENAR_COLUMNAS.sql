-- RELLANAR COLUMNA DE LA TABLA EMPLEADOS:
USE NorthwindSQL
GO
UPDATE Personal.Empleados
SET
    pwd_emp_vb = PWDENCRYPT(dni_emp_ch),  --RELLENAR LA COLUMNA pwd_emp_vb DE LA TABLA EMPLEADOS
    est_emp_bi = 1,					--CAMBIAR EL VALOR DE LA COLUMNA  est_emp_bi
    [Datos adjuntos]=NULL,			--
    Compa��a = 'Northwind Traders',
    [Direcci�n de correo electr�nico]=LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LEFT(Nombre,1)+Apellidos,'�','a'), '�', 'e'), '�', 'i'),'�','o'),'�', 'u'), ' ', '_')+'@northwindtraders.com')
GO
SELECT * FROM Personal.Empleados
GO