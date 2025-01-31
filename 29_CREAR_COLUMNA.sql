USE NorthwindSQL
GO
------------------------------------------
SELECT * FROM sys.columns GO	--TODAS LAS COLUMNAS QUE EXISTEN EN LA BASE DE DATOS
SELECT * FROM sys.tables  GO--TODAS LAS TABLAS QUE EXISTEN EN LA BASE DE DATOS
SELECT * FROM sys.schemas GO--TODAS LAS ESQUEMAS QUE EXISTEN EN LA BASE DE DATOS

------------------------------------------

IF EXISTS -- SI EXISTE, ELIMINA LA COLUMNA pwd_emp_vb 
(
    SELECT     s.name, t.name, c.name
    FROM sys.schemas s				--S = SQUEMAS
    INNER JOIN sys.tables t			--T = TABLAS
    ON s.schema_id = t.schema_id
    INNER JOIN sys.columns c		--C = COLUMNAS
    ON t.object_id = c.object_id
    WHERE
            s.name = 'Personal'
        AND
            t.name = 'Empleados'
        AND
            c.name = 'pwd_emp_vb'
)
ALTER TABLE [Personal].[Empleados]
DROP COLUMN pwd_emp_vb
GO

------------------------------------------
ALTER TABLE [Personal].[Empleados]
ADD pwd_emp_vb VARBINARY(128)  --CREAR COLUMNA ADICIONAL EN ESQUEMA PERSONAL, TABLA EMPLEADOS
GO
SELECT *
FROM [Personal].[Empleados]
GO

/*
En SQL Server, VARBINARY es un tipo de dato que se utiliza para almacenar datos binarios,
como imágenes, archivos, documentos, o cualquier dato representado en formato binario. 
Es similar a BINARY, pero con la ventaja de permitir almacenar datos de longitud variable, 
lo que ahorra espacio.
*/

