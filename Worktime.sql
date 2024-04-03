alter table Worktime
    add schedule_id int;

alter table Worktime
	add constraint FK_Worktime_schedule_id
		foreign key (schedule_id) references Schedule;

update Worktime
set schedule_id =
        (
            select schedule_id
            from Schedule
            where Worktime.schedule_description = Schedule.schedule_description
        );

select * from Worktime;

alter table Worktime
    drop column schedule_description;

alter table Worktime
    drop constraint FK_Worktime_tab_N;

alter table Worktime alter column tab_N varchar(10) not null;

alter table Worktime
	add constraint FK_Worktime_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from Worktime;

alter table Worktime
    drop constraint FK_Worktime_tab_N;

alter table Worktime alter column tab_N varchar(10) not null;

alter table Worktime
	add constraint FK_Worktime_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from Worktime;

select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_hours, work_hours from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number = 2024
and employee_name = 'Науменко Антон Павлович'
order by employee_name;

select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_hours, work_hours from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number > 2023
and organization_id = 3
order by employee_name;

drop procedure if exists GetWorktimeRefresh;
create procedure GetWorktimeRefresh
@organization_id as integer,
@year_number as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_hours, work_hours from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number >= @year_number
and organization_id = @organization_id
order by employee_name;
end
go

exec GetWorktimeRefresh 3, 2024;

select * from Worktime
where tab_N = '0000000340' and year_id = 24;

select * from Worktime;

drop procedure if exists GetWorktime;
create procedure GetWorktime
@organization_id as integer,
@year_number as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_days, format(date_of_dismissal, 'dd.MM.yyyy')
           as date_of_dismissal from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number >= @year_number
and organization_id = @organization_id
order by employee_name;
end
go

exec GetWorktime 3;


select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_days from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name = 'Пискунов Михаил Борисович'
and year_number = 2025
and month_name = 'Январь'
and organization_id = 3
order by employee_name;

alter table Worktime
	add calendar_days int
go

select * FROM Worktime;

drop procedure if exists GetWorktimeAlt;
create procedure GetWorktimeAlt
@index as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, month_name, year_number,
       calendar_days, format(date_of_dismissal, 'dd.MM.yyyy')
           as date_of_dismissal from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number >= 2022
and organization_id = @index
order by employee_name;
end
go

exec GetWorktimeAlt 3;

select employee_name, month_name, year_number,
       norm_days, norm_hours, work_days, work_hours
from Worktime
         inner join Employee E on Worktime.tab_N = E.tab_N
         inner join Year Y on Worktime.year_id = Y.year_id
         inner join Month M on Worktime.month_id = M.month_id
where employee_name = 'Махмутов Амир Рашитович'
  and month_name = 'Февраль'
  and year_number = 2023;

select norm_hours from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
where E.employee_name = 'Закиров Ратмир Эльвирович'
and month_id = 4
and year_id = 23;

alter table Worktime
    drop constraint FK_Worktime_tab_N
go

alter table Worktime
	add GUID nvarchar(36)
go

alter table Worktime
	add constraint FK_Worktime_GUID
		foreign key (GUID) references Employee (GUID)
go

select norm_hours from Worktime
inner join Employee E on Worktime.GUID = E.GUID
where month_id = 5
and year_id = 24
and employee_name = 'Давлетшин Александр Сагитович'

select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_hours, work_hours from Worktime
inner join Employee on Worktime.GUID = Employee.GUID
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number >= 2024
and organization_id = 9
and employee_name = 'Родионов Феликс Николаевич'
and month_name = 'Май'
and year_number = 2024
and date_of_dismissal = '1753-01-01'
order by employee_name;


select * from Worktime
inner join Employee E on Worktime.GUID = E.GUID
where employee_name = 'Кабакова Наталия Вячеславовна'
and month_id = 4
and year_id = 24
and date_of_dismissal = '1753-01-01'


select * from ProjectWork
where tab_N like '%405%'
select * from ProjectWork
where tab_N = '0000000020'

execute GetWorktimeAlt 9, 2023;