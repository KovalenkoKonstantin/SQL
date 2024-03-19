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

