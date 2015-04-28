CREATE TABLE [dbo].[dim_calendar]
(
	day_id date not null primary key,
	day_name varchar(10) not null,
	month_key int not null,
	month_name varchar(10) not null,
	year_key smallint not null,
	year_name varchar(10) not null
)
