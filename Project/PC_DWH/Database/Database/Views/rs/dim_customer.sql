create view [rs].[dim_customer]
as
select customer_id, customer_name, customer_phone
from [dbo].[dim_customer]
go