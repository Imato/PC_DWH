create view [rs].[dim_hardware]
as
select h.hardware_id, h.hardware_barcode, h.hardware_name, 
	t.hardware_type_id, t.hardware_type_name,
	s.supplier_id, s.supplier_name
from [dbo].[dim_hardware] h
join [dbo].[dim_hardware_type] t on t.[hardware_type_id]=h.[hardware_type_id]
join [dbo].[dim_supplier] s on s.supplier_id=h.supplier_id
go