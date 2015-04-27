/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_id_100000]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_id_200000]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_id_300000]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_id_400000]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILEGROUP [fact_id_500000]
go