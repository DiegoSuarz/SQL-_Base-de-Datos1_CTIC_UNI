USE [master]
GO
IF EXISTS
(
    SELECT name
    FROM sysdatabases
    WHERE name = 'ConsultasAvanzadas'
)
DROP DATABASE ConsultasAvanzadas
GO
CREATE DATABASE [ConsultasAvanzadas] ON  PRIMARY
(
    NAME = N'ConsultasAvanzadas',
    FILENAME = N'C:\bd\ConsultasAvanzadas.mdf' ,
    SIZE = 30MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = N'ConsultasAvanzadas_log',
    FILENAME = N'C:\bd\ConsultasAvanzadas_log.ldf' ,
    SIZE = 10MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 19%
)
GO
USE [ConsultasAvanzadas]
GO
CREATE TABLE [dbo].[departamento](
    [cod_dep_in] [int] IDENTITY(1,1) NOT NULL,
    [nom_dep_vc] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[empleado](
    [cod_emp_in] [int] IDENTITY(1,1) NOT NULL,
    [nom_emp_vc] [varchar](100) NOT NULL,
    [cod_dep_in] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[departamento] ON

INSERT [dbo].[departamento] ([cod_dep_in], [nom_dep_vc]) VALUES (1, N'Ventas')
INSERT [dbo].[departamento] ([cod_dep_in], [nom_dep_vc]) VALUES (2, N'Almacén')
INSERT [dbo].[departamento] ([cod_dep_in], [nom_dep_vc]) VALUES (3, N'Facturación')
INSERT [dbo].[departamento] ([cod_dep_in], [nom_dep_vc]) VALUES (4, N'Cobranzas')
INSERT [dbo].[departamento] ([cod_dep_in], [nom_dep_vc]) VALUES (5, N'Compras')
INSERT [dbo].[departamento] ([cod_dep_in], [nom_dep_vc]) VALUES (6, N'Pagos')
INSERT [dbo].[departamento] ([cod_dep_in], [nom_dep_vc]) VALUES (7, N'Sistemas')
INSERT [dbo].[departamento] ([cod_dep_in], [nom_dep_vc]) VALUES (8, N'Personal')
INSERT [dbo].[departamento] ([cod_dep_in], [nom_dep_vc]) VALUES (9, N'Transportes')
SET IDENTITY_INSERT [dbo].[departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[empleado] ON

INSERT [dbo].[empleado] ([cod_emp_in], [nom_emp_vc], [cod_dep_in]) VALUES (1, N'Hugo', 1)
INSERT [dbo].[empleado] ([cod_emp_in], [nom_emp_vc], [cod_dep_in]) VALUES (2, N'María', 1)
INSERT [dbo].[empleado] ([cod_emp_in], [nom_emp_vc], [cod_dep_in]) VALUES (3, N'Juan', 2)
INSERT [dbo].[empleado] ([cod_emp_in], [nom_emp_vc], [cod_dep_in]) VALUES (4, N'José', 2)
INSERT [dbo].[empleado] ([cod_emp_in], [nom_emp_vc], [cod_dep_in]) VALUES (5, N'Silvia', 3)
INSERT [dbo].[empleado] ([cod_emp_in], [nom_emp_vc], [cod_dep_in]) VALUES (6, N'Isabel', 4)
INSERT [dbo].[empleado] ([cod_emp_in], [nom_emp_vc], [cod_dep_in]) VALUES (7, N'Carlos', 99)
INSERT [dbo].[empleado] ([cod_emp_in], [nom_emp_vc], [cod_dep_in]) VALUES (8, N'Jimmy', 99)
INSERT [dbo].[empleado] ([cod_emp_in], [nom_emp_vc], [cod_dep_in]) VALUES (9, N'Tereza', 99)
SET IDENTITY_INSERT [dbo].[empleado] OFF
GO