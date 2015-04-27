﻿/*
Deployment script for pc_dwh

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "pc_dwh"
:setvar DefaultFilePrefix "pc_dwh"
:setvar DefaultDataPath "C:\Data\SQL\Data\"
:setvar DefaultLogPath "C:\Data\SQL\Data\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)] COLLATE Cyrillic_General_CI_AS
GO
PRINT N'Creating [fact_2011]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILEGROUP [fact_2011];


GO
PRINT N'Creating [fact_2012]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILEGROUP [fact_2012];


GO
PRINT N'Creating [fact_2013]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILEGROUP [fact_2013];


GO
PRINT N'Creating [fact_2014]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILEGROUP [fact_2014];


GO
PRINT N'Creating [fact_2015]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILEGROUP [fact_2015];


GO
PRINT N'Creating [fact_2011]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [fact_2011], FILENAME = '$(DefaultDataPath)\fact_2011.ndf', SIZE = 15360 KB, FILEGROWTH = 10 %) TO FILEGROUP [fact_2011];


GO
PRINT N'Creating [fact_2012]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [fact_2012], FILENAME = '$(DefaultDataPath)\fact_2012.ndf', SIZE = 15360 KB, FILEGROWTH = 10 %) TO FILEGROUP [fact_2012];


GO
PRINT N'Creating [fact_2013]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [fact_2013], FILENAME = '$(DefaultDataPath)\fact_2013.ndf', SIZE = 15360 KB, FILEGROWTH = 10 %) TO FILEGROUP [fact_2013];


GO
PRINT N'Creating [fact_2014]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [fact_2014], FILENAME = '$(DefaultDataPath)\fact_2014.ndf', SIZE = 15360 KB, FILEGROWTH = 10 %) TO FILEGROUP [fact_2014];


GO
PRINT N'Creating [fact_2015]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [fact_2015], FILENAME = '$(DefaultDataPath)\fact_2015.ndf', SIZE = 15360 KB, FILEGROWTH = 10 %) TO FILEGROUP [fact_2015];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS OFF,
                ANSI_PADDING OFF,
                ANSI_WARNINGS OFF,
                ARITHABORT OFF,
                CONCAT_NULL_YIELDS_NULL OFF,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER OFF,
                ANSI_NULL_DEFAULT OFF,
                CURSOR_DEFAULT GLOBAL,
                RECOVERY SIMPLE,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC ON,
                PAGE_VERIFY CHECKSUM,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
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
GO

GO
PRINT N'Creating [rs]...';


GO
CREATE SCHEMA [rs]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [pf_date_year]...';


GO
CREATE PARTITION FUNCTION [pf_date_year](DATE)
    AS RANGE
    FOR VALUES ('20120101', '20130101', '20140101', '20150101');


GO
PRINT N'Creating [ps_date_year]...';


GO
CREATE PARTITION SCHEME [ps_date_year]
    AS PARTITION [pf_date_year]
    TO ([fact_2011], [fact_2012], [fact_2013], [fact_2014], [fact_2015]);


GO
PRINT N'Creating [dbo].[dim_customer]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[dim_customer] (
    [customer_id]    INT            NOT NULL,
    [customer_name]  NVARCHAR (255) NOT NULL,
    [customer_phone] VARCHAR (14)   NOT NULL,
    PRIMARY KEY CLUSTERED ([customer_id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[dim_customer].[ix_dim_customer_customer_phone]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [ix_dim_customer_customer_phone]
    ON [dbo].[dim_customer]([customer_phone] ASC);


GO
PRINT N'Creating [dbo].[dim_hardware]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[dim_hardware] (
    [hardware_id]      INT            NOT NULL,
    [hardware_barcode] VARCHAR (14)   NOT NULL,
    [hardware_name]    NVARCHAR (255) NOT NULL,
    [hardware_type_id] SMALLINT       NOT NULL,
    [supplier_id]      SMALLINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([hardware_id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[dim_hardware].[ix_hardware_barcode]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [ix_hardware_barcode]
    ON [dbo].[dim_hardware]([hardware_barcode] ASC);


GO
PRINT N'Creating [dbo].[dim_hardware].[ix_hardware_type_id]...';


GO
CREATE NONCLUSTERED INDEX [ix_hardware_type_id]
    ON [dbo].[dim_hardware]([hardware_type_id] ASC);


GO
PRINT N'Creating [dbo].[dim_hardware].[ix_hardware_supplier_id]...';


GO
CREATE NONCLUSTERED INDEX [ix_hardware_supplier_id]
    ON [dbo].[dim_hardware]([supplier_id] ASC);


GO
PRINT N'Creating [dbo].[dim_hardware_type]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[dim_hardware_type] (
    [hardware_type_id]   SMALLINT       NOT NULL,
    [hardware_type_name] NVARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([hardware_type_id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[dim_model]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[dim_model] (
    [model_id]      SMALLINT       NOT NULL,
    [model_name]    NVARCHAR (255) NOT NULL,
    [model_barcode] VARCHAR (14)   NOT NULL,
    [create_date]   DATE           NOT NULL,
    PRIMARY KEY CLUSTERED ([model_id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[dim_model].[ix_dim_model_barcode]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [ix_dim_model_barcode]
    ON [dbo].[dim_model]([model_barcode] ASC);


GO
PRINT N'Creating [dbo].[dim_purchase]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[dim_purchase] (
    [purchase_id]   INT           NOT NULL,
    [purchase_date] SMALLDATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([purchase_id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[dim_sales_type]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[dim_sales_type] (
    [sales_type_id]   SMALLINT     NOT NULL,
    [sales_type_name] VARCHAR (25) NOT NULL,
    PRIMARY KEY CLUSTERED ([sales_type_id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[dim_supplier]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[dim_supplier] (
    [supplier_id]   SMALLINT       NOT NULL,
    [supplier_name] NVARCHAR (255) NOT NULL,
    [country_name]  NVARCHAR (150) NOT NULL,
    [region_name]   NVARCHAR (150) NOT NULL,
    PRIMARY KEY CLUSTERED ([supplier_id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[fact_manufacture]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[fact_manufacture] (
    [day_id]      DATE     NOT NULL,
    [serial_id]   INT      NOT NULL,
    [model_id]    SMALLINT NOT NULL,
    [purchase_id] INT      NOT NULL,
    [hardware_id] INT      NOT NULL,
    [supplier_id] SMALLINT NOT NULL,
    [cost]        MONEY    NOT NULL,
    PRIMARY KEY CLUSTERED ([serial_id] ASC)
) ON [ps_date_year] ([day_id]);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[fact_purchase]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[fact_purchase] (
    [day_id]      DATE     NOT NULL,
    [purchase_id] INT      NOT NULL,
    [hardware_id] INT      NOT NULL,
    [supplier_id] SMALLINT NOT NULL,
    [cost]        MONEY    NOT NULL
) ON [ps_date_year] ([day_id]);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[fact_sales]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[fact_sales] (
    [day_id]        DATE     NOT NULL,
    [time_id]       TIME (0) NOT NULL,
    [model_id]      SMALLINT NOT NULL,
    [serial_id]     INT      NOT NULL,
    [customer_id]   INT      NOT NULL,
    [sales_type_id] SMALLINT NOT NULL,
    [cost]          MONEY    NOT NULL,
    [gross_sales]   MONEY    NOT NULL
) ON [ps_date_year] ([day_id]);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[fk_hardware_supplier]...';


GO
ALTER TABLE [dbo].[dim_hardware]
    ADD CONSTRAINT [fk_hardware_supplier] FOREIGN KEY ([supplier_id]) REFERENCES [dbo].[dim_supplier] ([supplier_id]);


GO
PRINT N'Creating [dbo].[fk_dim_hardware_type]...';


GO
ALTER TABLE [dbo].[dim_hardware]
    ADD CONSTRAINT [fk_dim_hardware_type] FOREIGN KEY ([hardware_type_id]) REFERENCES [dbo].[dim_hardware_type] ([hardware_type_id]);


GO
PRINT N'Creating [dbo].[fact_manufacture_hardware]...';


GO
ALTER TABLE [dbo].[fact_manufacture]
    ADD CONSTRAINT [fact_manufacture_hardware] FOREIGN KEY ([hardware_id]) REFERENCES [dbo].[dim_hardware] ([hardware_id]);


GO
PRINT N'Creating [dbo].[fact_manufacture_supplier]...';


GO
ALTER TABLE [dbo].[fact_manufacture]
    ADD CONSTRAINT [fact_manufacture_supplier] FOREIGN KEY ([supplier_id]) REFERENCES [dbo].[dim_supplier] ([supplier_id]);


GO
PRINT N'Creating [dbo].[fk_fact_manufacture_model]...';


GO
ALTER TABLE [dbo].[fact_manufacture]
    ADD CONSTRAINT [fk_fact_manufacture_model] FOREIGN KEY ([model_id]) REFERENCES [dbo].[dim_model] ([model_id]);


GO
PRINT N'Creating [dbo].[fact_manufacture_purchase]...';


GO
ALTER TABLE [dbo].[fact_manufacture]
    ADD CONSTRAINT [fact_manufacture_purchase] FOREIGN KEY ([purchase_id]) REFERENCES [dbo].[dim_purchase] ([purchase_id]);


GO
PRINT N'Creating [dbo].[fact_purchase_hardware]...';


GO
ALTER TABLE [dbo].[fact_purchase]
    ADD CONSTRAINT [fact_purchase_hardware] FOREIGN KEY ([hardware_id]) REFERENCES [dbo].[dim_hardware] ([hardware_id]);


GO
PRINT N'Creating [dbo].[fact_purchase_supplier]...';


GO
ALTER TABLE [dbo].[fact_purchase]
    ADD CONSTRAINT [fact_purchase_supplier] FOREIGN KEY ([supplier_id]) REFERENCES [dbo].[dim_supplier] ([supplier_id]);


GO
PRINT N'Creating [dbo].[fact_purchase_purchase]...';


GO
ALTER TABLE [dbo].[fact_purchase]
    ADD CONSTRAINT [fact_purchase_purchase] FOREIGN KEY ([purchase_id]) REFERENCES [dbo].[dim_purchase] ([purchase_id]);


GO
PRINT N'Creating [dbo].[fact_sales_model]...';


GO
ALTER TABLE [dbo].[fact_sales]
    ADD CONSTRAINT [fact_sales_model] FOREIGN KEY ([model_id]) REFERENCES [dbo].[dim_model] ([model_id]);


GO
PRINT N'Creating [dbo].[fact_sales_part]...';


GO
ALTER TABLE [dbo].[fact_sales]
    ADD CONSTRAINT [fact_sales_part] FOREIGN KEY ([serial_id]) REFERENCES [dbo].[fact_manufacture] ([serial_id]);


GO
PRINT N'Creating [dbo].[fact_sales_sales_type]...';


GO
ALTER TABLE [dbo].[fact_sales]
    ADD CONSTRAINT [fact_sales_sales_type] FOREIGN KEY ([sales_type_id]) REFERENCES [dbo].[dim_sales_type] ([sales_type_id]);


GO
PRINT N'Creating [dbo].[fact_sales_customer]...';


GO
ALTER TABLE [dbo].[fact_sales]
    ADD CONSTRAINT [fact_sales_customer] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[dim_customer] ([customer_id]);


GO
PRINT N'Creating [dbo].[fact_manufacture_cost]...';


GO
ALTER TABLE [dbo].[fact_manufacture]
    ADD CONSTRAINT [fact_manufacture_cost] CHECK (cost >= 0);


GO
PRINT N'Creating [dbo].[ck_fact_purchase_cost]...';


GO
ALTER TABLE [dbo].[fact_purchase]
    ADD CONSTRAINT [ck_fact_purchase_cost] CHECK (cost >= 0);


GO
PRINT N'Creating [dbo].[fact_sales_cost]...';


GO
ALTER TABLE [dbo].[fact_sales]
    ADD CONSTRAINT [fact_sales_cost] CHECK (cost >= 0);


GO
PRINT N'Creating [rs].[dim_hardware]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
create view [rs].[dim_hardware]
as
select h.hardware_id, h.hardware_barcode, h.hardware_name, 
	t.hardware_type_id, t.hardware_type_name
from [dbo].[dim_hardware] h
join [dbo].[dim_hardware_type] t on t.[hardware_type_id]=h.[hardware_type_id]
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO