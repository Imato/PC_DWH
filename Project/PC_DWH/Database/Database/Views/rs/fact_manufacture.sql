create view [rs].[fact_manufacture]
as
select serial_id, day_id, model_id, purchase_id, hardware_id, supplier_id, cost
from [dbo].[fact_manufacture]
go