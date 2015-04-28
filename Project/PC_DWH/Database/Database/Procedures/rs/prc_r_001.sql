create proc rs.prc_r_001
@day_from date,
@day_to date 

as
set nocount on 
---  exec rs.prc_r_001 '20150101', '20150425'

/*
При создании отчета использовался универсальный подход - использование временных таблиц для логического 
и физического разбиения данных отчета. Это возволяет задействовать индексы и статистику на временных таблицах,
упростить нахождение оптимального плана запроса и обратабывать значительные объемы данных.   
Однако, если объем выпускаемой продукции невелик - 1000 компьютеров и 15 000 комплектующих - , то, возможно, 
что окажется эффективнее использовать табличные переменные с опцией recompile или объединить тыблицы 
fact_sales, fact_return и fact_manufacture в одном запросе.
*/

--- продажи
create table #sales
(serial_id int not null primary key,
start_date date not null,
end_date date not null,
cost money not null,
gross_sales money not null, 
margin numeric(12, 8) not null)

--- маржинальность товара нужна чтобы вычислить маржинальность коплектующих и прибыль
insert into #sales(serial_id, start_date, cost, gross_sales, margin)
select serial_id, day_id as start_date, cost, gross_sales,
	margin = iif(gross_sales<>0, 1 - cost/gross_sales, 0)
from [rs].[fact_sales] 
where day_id between @day_from and @day_to

--- если был возврат, то получаем убыток и ставим день окончания службы товара
update s
set s.end_date = isnull(r.day_id, @day_to), 
	s.gross_sales = iif(r.[serial_id] is null, s.gross_sales, -1 * s.cost)
from #sales s
left join [rs].[fact_return] r on s.[serial_id]=r.[serial_id]
where r.[day_id] between @day_from and @day_to

--- использование комплектующих в днях и прибыль
create table #hw_usage 
(hardware_id int not null,
life_time int,
cost money not null,
gross_sales money not null
)

create clustered index cix_hw_usage on #hw_usage (hardware_id)

insert into #hw_usage
select m.hardware_id, datediff(dd, s.start_date, s.end_date), 
	m.cost, m.cost * (1 + s.margin) as gross_sales
from [rs].[fact_manufacture] m
join #sales s on m.serial_id=s.serial_id
order by m.hardware_id

--- использование комплектующих по группам и поставщикам в днях и прибыль
select h.hardware_type_name, h.supplier_name,
	avg(u.life_time) as life_time,
	sum(u.gross_sales - u.cost) as profit
from #hw_usage u
join [rs].[dim_hardware] h on h.hardware_id=u.hardware_id
group by h.hardware_type_name, h.supplier_name
order by h.hardware_type_name, h.supplier_name
go
