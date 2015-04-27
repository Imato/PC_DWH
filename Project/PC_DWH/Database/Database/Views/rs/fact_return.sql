create view [rs].[fact_return]
as
select day_id, time_id, receipt_id, model_id, serial_id, customer_id, gross_sales
from [dbo].[fact_return]
go
