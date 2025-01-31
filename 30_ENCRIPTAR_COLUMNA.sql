/*
ANTES DE ACTUALIZAR UNA COLUMN
*/

USE NorthwindSQL
GO
SELECT pwd_emp_vb, PWDENCRYPT(dni_emp_ch)
FROM Personal.Empleados
GO

/*
El comando PWDENCRYPT en SQL Server se utilizaba para generar un hash de una 
contrase�a en las versiones m�s antiguas del sistema (antes de SQL Server 2012).
Aunque todav�a puede funcionar en algunos entornos, est� en desuso y no se recomienda 
para sistemas modernos debido a la falta de est�ndares criptogr�ficos actuales.

*/