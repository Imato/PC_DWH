create view [rs].[fact_purchase]
as
select day_id, purchase_id, hardware_id, supplier_id, cost
from [dbo].[fact_purchase]
go