create view [rs].[fact_sales]
as
select day_id, time_id, receipt_id, model_id, serial_id, customer_id, cost, gross_sales
from [dbo].[fact_sales]
go