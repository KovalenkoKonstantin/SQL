CREATE procedure GetEmployee
@org as int,
@startdate as date
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select employee_name, tab_N, format(date_of_dismissal, 'dd.MM.yyyy') as date_of_dismissal from Employee
-- inner join Organization O on Employee.organization_id = O.organization_id
-- where organization_name = 'АО "ПМ"'
where organization_id = @org
and date_of_dismissal > @startdate
or date_of_dismissal = '1753-01-01'
    order by tab_N desc
end
go

