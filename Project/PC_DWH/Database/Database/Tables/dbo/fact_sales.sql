CREATE TABLE [dbo].[fact_sales]
(
	day_id date not null,
	time_id time(0) not null,
	receipt_id int not null,
	model_id smallint not null,
	serial_id int not null,
	customer_id int not null,
	cost money not null,
	gross_sales money not null,
    CONSTRAINT [fact_sales_cost] CHECK (cost >= 0), 
    CONSTRAINT [fact_sales_model] FOREIGN KEY (model_id) REFERENCES dbo.dim_model(model_id),
	CONSTRAINT [fact_sales_customer] FOREIGN KEY (customer_id) REFERENCES dbo.dim_customer(customer_id),
	CONSTRAINT [fact_sales_manufacture] FOREIGN KEY (serial_id) REFERENCES dbo.dim_serial(serial_id)
) on ps_date_year(day_id)
go
create index ix_fact_sales_serial on [dbo].[fact_sales] 
	([serial_id], [day_id]) include ([cost], [gross_sales])
	on [ps_date_year]([day_id])
go