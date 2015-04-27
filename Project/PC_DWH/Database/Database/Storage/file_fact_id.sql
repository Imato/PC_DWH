/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_id_100000],
		FILENAME = N'$(DefaultDataPath)\fact_id_100000.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_id_100000]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_id_200000],
		FILENAME = N'$(DefaultDataPath)\fact_id_200000.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_id_200000]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_id_300000],
		FILENAME = N'$(DefaultDataPath)\fact_id_300000.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_id_300000]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_id_400000],
		FILENAME = N'$(DefaultDataPath)\fact_id_400000.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_id_400000]
go
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_id_500000],
		FILENAME = N'$(DefaultDataPath)\fact_id_500000.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_id_500000]
go