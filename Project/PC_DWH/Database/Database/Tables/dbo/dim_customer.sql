CREATE TABLE [dbo].[dim_customer]
(
	customer_id int not null primary key,
	customer_name nvarchar(255) not null,
	customer_phone varchar(14) not null
)
go

create unique index ix_dim_customer_customer_phone on [dbo].[dim_customer](customer_phone)
go
