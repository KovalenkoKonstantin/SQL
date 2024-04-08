alter table EmployeeChanges
    add schedule_id int;

alter table EmployeeChanges
	add constraint FK_EmployeeChanges_schedule_id
		foreign key (schedule_id) references Schedule;

update EmployeeChanges
set schedule_id =
        (
            select schedule_id
            from Schedule
            where EmployeeChanges.schedule_description = Schedule.schedule_description
        );

select * from EmployeeChanges;

alter table EmployeeChanges
    drop column schedule_description;

alter table EmployeeChanges
    drop constraint FK_EmployeeChanges_tab_N;

alter table EmployeeChanges alter column tab_N varchar(10) not null;

alter table EmployeeChanges
	add constraint FK_EmployeeChanges_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from EmployeeChanges;

select rtrim(employee_name) as employee_name, month_name, year_number,
       schedule_description from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id

where employee_name <> ''
and year_number > 2022
and employee_position <> NULL
order by employee_name;

select E.tab_N, month_id, year_id, employee_position, employee_nameE from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
where employee_name = 'Юркин Константин Юрьевич';

select rtrim(employee_name) as employee_name, month_name, year_number,
       employee_accounting_type, employee_position from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name <> '' and year_number > 2021 and employee_position <> ''
and organization_id = 3
order by employee_name;

drop procedure if exists GetEmployeeChangesRefresh;
create procedure GetEmployeeChangesRefresh
@organization_id as integer,
@year_number as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_accounting_type) as employee_accounting_type,
       rtrim(employee_position) as employee_position from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name <> '' and year_number > @year_number and employee_position <> ''
and organization_id = @organization_id
order by employee_name, year_number
end
go

exec GetEmployeeChangesRefresh 3, 2021;

select * from EmployeeChanges
where year_id > 23;

select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_accounting_type), employee_position, employee_department from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name = 'Артёмов Виктор Романович'
and year_number > 2023
and employee_position <> ''
and organization_id = 9
order by employee_name, year_number;

drop procedure if exists GetEmployeeChanges;
create procedure GetEmployeeChanges
@index as integer,
@year as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name)            as employee_name,
       EmployeeChanges.tab_N,
       month_name,
       year_number,
       rtrim(employee_accounting_type) as employee_accounting_type,
       rtrim(employee_position)        as employee_position,
       rtrim(employee_department)      as employee_department
from EmployeeChanges
         inner join Employee E on EmployeeChanges.tab_N = E.tab_N
         inner join Month M on EmployeeChanges.month_id = M.month_id
         inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name <> ''
  and year_number > @year
-- and employee_position <> ''
  and organization_id = @index
order by employee_name, year_number
end
go

exec GetEmployeeChanges 3, 2023;

alter table EmployeeChanges
    drop constraint FK_EmployeeChanges_tab_N
go

alter table EmployeeChanges
	add GUID nvarchar(36)
go

alter table EmployeeChanges
	add constraint FK_EmployeeChanges_GUID
		foreign key (GUID) references Employee (GUID)
go

drop procedure if exists GetEmployeeList
create procedure GetEmployeeList
    @organization_id as integer,
    @year_number as integer
    as
    begin
select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_accounting_type) as employee_accounting_type,
       rtrim(employee_position) as employee_position,
       rtrim(schedule_description) as schedule_description
from EmployeeChanges
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
inner join Employee E on EmployeeChanges.GUID = E.GUID
where employee_name <> ''
and year_number >= 2024
and employee_position <> ''
and organization_id = 9
and date_of_dismissal = '1753-01-01'
order by employee_name, year_number
end

select rtrim(employee_name) as employee_name, month_name, year_number,
       accrual_type, salary_bugget_ammount from SalaryBudget
inner join Employee E on SalaryBudget.GUID = E.GUID
inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Month M on SalaryBudget.month_id = M.month_id
inner join Year Y on SalaryBudget.year_id = Y.year_id
where employee_name <> '' and year_number >= 2024
and organization_id = 9
and date_of_dismissal = '1753-01-01'
order by employee_name, year_number

execute GetEmployeeList 9, 2024;
execute GetEmployeeRefresh 9;
execute GetEmployeeChanges 9, 2024;
execute GetEmployeeChangesRefresh 9, 2024;
execute GetEmployeeChangesRefreshAlt 9, 2023;

drop procedure if exists GetEmployeeChangesRefreshAlt
create procedure GetEmployeeChangesRefreshAlt
    @organization_id as integer,
    @year_number as integer
    as
    begin
select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_position) as employee_position,
       rtrim(employee_department) as employee_department
from EmployeeChanges
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
-- inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
inner join Employee E on EmployeeChanges.GUID = E.GUID
where employee_name <> ''
and year_number >= @year_number
and employee_position <> ''
and organization_id = @organization_id
and date_of_dismissal = '1753-01-01'
order by employee_name, year_number
end

execute GetEmployeeChangesRefreshAlt 9, 2024

select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_position) as employee_position,
       rtrim(employee_department) as employee_department
from EmployeeChanges
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
-- inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
inner join Employee E on EmployeeChanges.GUID = E.GUID
where employee_name = 'Лысенко Екатерина Евгеньевна'
and year_number >= 2023
and employee_position <> ''
and organization_id = 9
and date_of_dismissal = '1753-01-01'
order by employee_name, year_number