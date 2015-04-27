/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*
use master 
go

drop database [pc_dwh]
go

CREATE DATABASE [pc_dwh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pc_dwh', FILENAME = N'$(DataPath)\pc_dwh.mdf' , SIZE = 15360KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'pc_dwh_log', FILENAME = N'$(LogPath)\pc_dwh_log.ldf' , SIZE = 15360KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [pc_dwh] SET COMPATIBILITY_LEVEL = 120
GO
ALTER DATABASE [pc_dwh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pc_dwh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pc_dwh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pc_dwh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pc_dwh] SET ARITHABORT OFF 
GO
ALTER DATABASE [pc_dwh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pc_dwh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pc_dwh] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [pc_dwh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pc_dwh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pc_dwh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pc_dwh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pc_dwh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pc_dwh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pc_dwh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pc_dwh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pc_dwh] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO
ALTER DATABASE [pc_dwh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pc_dwh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pc_dwh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pc_dwh] SET  READ_WRITE 
GO
ALTER DATABASE [pc_dwh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pc_dwh] SET  MULTI_USER 
GO
ALTER DATABASE [pc_dwh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pc_dwh] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [pc_dwh] SET DELAYED_DURABILITY = DISABLED 
GO
USE [pc_dwh]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [pc_dwh] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
*/