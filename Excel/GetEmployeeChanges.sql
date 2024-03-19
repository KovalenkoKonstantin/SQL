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

