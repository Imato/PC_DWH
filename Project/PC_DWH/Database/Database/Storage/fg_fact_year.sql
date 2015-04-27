/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_2011]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_2012]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_2013]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_2014]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_2015]
go
