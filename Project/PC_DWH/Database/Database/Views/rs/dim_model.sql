create view [rs].[dim_model]
as
select model_id, model_name, model_barcode, create_date
from [dbo].[dim_model]
go