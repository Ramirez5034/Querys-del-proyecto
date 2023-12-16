--El "10.235.242.150" viene siendo la ip del otro servidor al que se esta vinculando
EXEC sp_addlinkedserver
@server = '10.235.242.168',
@srvproduct = 'SQL SERVER';
GO

--El "sa" es el usuario que se esta utilizando para poder tener acceso a las bases de datos
exec sp_addlinkedsrvlogin
@rmtsrvname = N'10.235.242.168',
@useself = 'false',
@rmtuser = N'sa',
@rmtpassword = N'Sonic';
GO

Select * from [10.235.242.168].SchoolServices.dbo.Employee


--Aqui se realiza una insercion en las tablas del otro servidor y se muestra la tabla
INSERT INTO [10.235.242.168].SchoolServices.dbo.DocumentType (Name, Description)
	VALUES	('Documento', 'Documento de prueba');

SELECT * FROM [10.235.242.168].SchoolServices.dbo.DocumentType;
GO

--Aqui se realiza lo que seria un cambio en un campo en las tablas del otro servidor y se muestra el cambio
UPDATE [10.235.242.168].SchoolServices.dbo.DocumentType
SET Name = 'Camdio'
WHERE DocumentTypeID = 5;

SELECT * FROM [10.235.242.168].SchoolServices.dbo.DocumentType;
GO

--Aqui se realiza lo que seria la "eliminacion" de un registro en las tablas del otro servidor y se muestra el cambio
DELETE FROM [10.235.242.168].SchoolServices.dbo.DocumentType WHERE DocumentTypeID = 7;

SELECT * FROM [10.235.242.168].SchoolServices.dbo.DocumentType;
GO

SELECT * FROM Course