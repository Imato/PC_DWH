create view [rs].[dim_calendar]
as
select day_id, day_name, month_key, month_name, year_key, year_name
from [dbo].[dim_calendar]
go