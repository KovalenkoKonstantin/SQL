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
@index as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, month_name, year_number,
       employee_accounting_type, employee_position from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name <> '' and year_number > 2021 and employee_position <> ''
and organization_id = @index
order by employee_name, year_number
end
go

exec GetEmployeeChangesRefresh;
