USE NorthwindSQL
GO

SELECT dni_emp_ch, pwd_emp_vb, PWDCOMPARE('12345671',pwd_emp_vb) --COMPARAR
FROM Personal.Empleados
GO

SELECT dni_emp_ch, pwd_emp_vb, PWDCOMPARE(dni_emp_ch,pwd_emp_vb) --COMPARAR
FROM Personal.Empleados
GO