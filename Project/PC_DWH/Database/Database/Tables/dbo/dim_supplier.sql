CREATE TABLE [dbo].[dim_supplier]
(
	[supplier_id] smallint NOT NULL primary key, 
	supplier_name nvarchar(255) not null,
    [country_name] NVARCHAR(150) not null, 
    [region_name] NVARCHAR(150) not null
)
