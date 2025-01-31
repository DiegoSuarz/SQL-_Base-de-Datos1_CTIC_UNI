-- CAMBIAMOS DE ESQUEMA DE dbo a Personal a la tabla de rol

USE empresa_oti
GO
ALTER SCHEMA Personal TRANSFER dbo.rol;
GO