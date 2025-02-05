--CREAR TIPOS DE DATOS PERSONALIZADOS PARA NUESTRA BASE DE DATOS
USE empresa_oti
GO
IF EXISTS
(
    SELECT name
    FROM systypes --TIPO DE DATOS
    WHERE name = 'td_dni'
)
DROP TYPE td_dni
GO
CREATE TYPE td_dni FROM CHAR(8)
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_ruc'
)
DROP TYPE td_ruc
GO
CREATE TYPE td_ruc FROM CHAR(11)
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_codigo'
)
DROP TYPE td_codigo
GO
CREATE TYPE td_codigo FROM INT
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_apellido'
)
DROP TYPE td_apellido
GO
CREATE TYPE td_apellido FROM VARCHAR(40)
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_nombre'
)
DROP TYPE td_nombre
GO
CREATE TYPE td_nombre FROM VARCHAR(35)
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_razon_social'
)
DROP TYPE td_razon_social
GO
CREATE TYPE td_razon_social FROM VARCHAR(150)
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_estado'
)
DROP TYPE td_estado
GO
CREATE TYPE td_estado FROM BIT --TIPO BINARION
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_sexo'
)
DROP TYPE td_sexo
GO
CREATE TYPE td_sexo FROM BIT
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_email'
)
DROP TYPE td_email
GO
CREATE TYPE td_email FROM VARCHAR(50)
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_telefono'
)
DROP TYPE td_telefono
GO
CREATE TYPE td_telefono FROM VARCHAR(20)
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_direccion'
)
DROP TYPE td_direccion
GO
CREATE TYPE td_direccion FROM VARCHAR(200)
GO
IF EXISTS
(
    SELECT name
    FROM systypes
    WHERE name = 'td_moneda'
)
DROP TYPE td_moneda
GO
CREATE TYPE td_moneda FROM DECIMAL(19,2)
GO

------------------------------------------------------------
--APARECEN LOS TIPO DE DATOS CREADOS POR ES USUARIO Y DEFINIDOS
--POR EL SQL SERVER
SELECT name 
FROM SYSTYPES


------------------------------------------------------------
--FILTRAR POR DATOS CREADOS POR EL USUARIO, NOMBRE, TIPO DE DATO, LONGITUD, PRECISION Y ESCALA
SELECT xusertype, name, xtype, length, xprec,xscale
FROM systypes
ORDER BY 2
GO


------------------------------------------------------------
--Filtrar por datos personalizados:

SELECT xusertype, name, xtype, length, xprec,xscale
FROM systypes
WHERE name LIKE 'td_%'
ORDER BY 2
GO


