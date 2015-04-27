CREATE TABLE [dbo].[fact_return]
(
	day_id date not null,
	time_id time(0) not null,
	receipt_id int not null,
	model_id smallint not null,
	serial_id int not null,
	customer_id int not null,
	gross_sales money not null,
    CONSTRAINT [fact_returns_model] FOREIGN KEY (model_id) REFERENCES dbo.dim_model(model_id),
	CONSTRAINT [fact_return_customer] FOREIGN KEY (customer_id) REFERENCES dbo.dim_customer(customer_id),
	CONSTRAINT [fact_return_serial] FOREIGN KEY (serial_id) REFERENCES dbo.fact_manufacture(serial_id)
) on ps_date_year(day_id)
go
create index ix_fact_return_serial on [dbo].[fact_return] 
	([serial_id], [day_id]) include ([gross_sales])
	on [ps_date_year]([day_id])
go