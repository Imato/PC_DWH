CREATE TABLE [dbo].[dim_model]
(
	[model_id] SMALLINT NOT NULL PRIMARY KEY, 
    [model_name] NVARCHAR(255) NOT NULL, 
    [model_barcode] VARCHAR(14) NOT NULL, 
    [create_date] DATE NOT NULL
)
go

create unique nonclustered index [ix_dim_model_barcode] on [dbo].[dim_model] ([model_barcode])
go