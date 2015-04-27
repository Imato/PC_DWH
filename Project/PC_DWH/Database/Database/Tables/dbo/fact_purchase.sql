CREATE TABLE [dbo].[fact_purchase]
(
	day_id date not null,
	purchase_id int not null,
	hardware_id int not null,
	supplier_id smallint not null,
	cost money not null, 
    CONSTRAINT [fact_purchase_hardware] FOREIGN KEY (hardware_id) REFERENCES dbo.dim_hardware(hardware_id), 
    CONSTRAINT [fact_purchase_supplier] FOREIGN KEY (supplier_id) REFERENCES dbo.dim_supplier(supplier_id), 
	CONSTRAINT [fact_purchase_purchase] FOREIGN KEY (purchase_id) REFERENCES dbo.dim_purchase(purchase_id), 
    CONSTRAINT [ck_fact_purchase_cost] CHECK (cost >= 0)
) on ps_date_year(day_id)
go
