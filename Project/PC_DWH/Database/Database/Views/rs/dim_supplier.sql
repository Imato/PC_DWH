create view [rs].[dim_supplier]
as
select supplier_id, supplier_name, country_name, region_name
from [dbo].[dim_supplier]