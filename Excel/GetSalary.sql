create procedure GetSalary
@org as int,
@year as int
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select employee_name,
       month_name,
       year_number,
       accrual_type,
       wage_fund
from Salary
         inner join Employee E on Salary.tab_N = E.tab_N
         inner join Month M on Salary.month_id = M.month_id
         inner join Year Y on Salary.year_id = Y.year_id
         inner join AccrualType A on Salary.accrual_id = A.accrual_id
where organization_id = @org
  and year_number >= @year
end
go

