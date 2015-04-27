CREATE TABLE [dbo].[dim_hardware]
(
	[hardware_id] INT NOT NULL PRIMARY KEY, 
    [hardware_barcode] VARCHAR(14) NOT NULL, 
    [hardware_name] NVARCHAR(255) NOT NULL, 
    [hardware_type_id] SMALLINT NOT NULL, 
    [supplier_id] SMALLINT NOT NULL, 
    CONSTRAINT [fk_hardware_supplier] FOREIGN KEY (supplier_id) REFERENCES dbo.dim_supplier(supplier_id), 
    CONSTRAINT [fk_dim_hardware_type] FOREIGN KEY ([hardware_type_id]) REFERENCES dbo.dim_hardware_type([hardware_type_id])
)

GO

CREATE unique nonclustered INDEX [ix_hardware_barcode] ON [dbo].[dim_hardware] ([hardware_barcode])

GO

CREATE INDEX [ix_hardware_type_id] ON [dbo].[dim_hardware] ([hardware_type_id])

GO

CREATE INDEX [ix_hardware_supplier_id] ON [dbo].[dim_hardware] ([supplier_id])
