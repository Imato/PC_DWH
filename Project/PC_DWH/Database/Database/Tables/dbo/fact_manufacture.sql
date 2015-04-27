CREATE TABLE [dbo].[fact_manufacture]
(
	serial_id int not null,
	day_id date not null,
	model_id smallint not null,
	purchase_id int not null,
	hardware_id int not null,
	supplier_id smallint not null,
	cost money not null, 
    CONSTRAINT [fact_manufacture_hardware] FOREIGN KEY (hardware_id) REFERENCES dbo.dim_hardware(hardware_id), 
    CONSTRAINT [fact_manufacture_supplier] FOREIGN KEY (supplier_id) REFERENCES dbo.dim_supplier(supplier_id), 
    CONSTRAINT [fact_manufacture_cost] CHECK (cost >= 0), 
    CONSTRAINT [fk_fact_manufacture_model] FOREIGN KEY (model_id) REFERENCES dbo.dim_model(model_id),
	CONSTRAINT [fact_manufacture_purchase] FOREIGN KEY (purchase_id) REFERENCES dbo.dim_purchase(purchase_id),
	CONSTRAINT [fact_manufacture_serial] FOREIGN KEY (serial_id) REFERENCES dbo.dim_serial(serial_id)
) on ps_id(serial_id)
go