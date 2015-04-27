/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_2011],
		FILENAME = N'$(DefaultDataPath)\fact_2011.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_2011]
go

ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_2012],
		FILENAME = N'$(DefaultDataPath)\fact_2012.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_2012]
go

ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_2013],
		FILENAME = N'$(DefaultDataPath)\fact_2013.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_2013]
go

ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_2014],
		FILENAME = N'$(DefaultDataPath)\fact_2014.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_2014]
go

ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [fact_2015],
		FILENAME = N'$(DefaultDataPath)\fact_2015.ndf' , SIZE = 15360KB , FILEGROWTH = 10%
	) TO FILEGROUP [fact_2015]
go