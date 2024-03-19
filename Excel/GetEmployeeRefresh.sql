CREATE procedure GetEmployeeRefresh
@organization_id as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, tab_N from Employee
where employee_name <> ''
and organization_id = @organization_id
order by employee_name
end
go

