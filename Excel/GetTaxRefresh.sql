create procedure GetTaxRefresh
@organization_id as integer,
@year_number as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name,
       Tax.tab_N,
       month_name,
       year_number,
       round(sum(tax_sum), 2) as tax_sum_amount
from Tax
inner join TaxName TN on Tax.tax_name_id = TN.tax_name_id
inner join Employee E on Tax.tab_N = E.tab_N
inner join Month M on Tax.month_id = M.month_id
inner join Year Y on Tax.year_id = Y.year_id
where TN.tax_name_id between 3 and 7
and organization_id = @organization_id
and year_number >= @year_number
group by rtrim(employee_name), Tax.tab_N, month_name, year_number
end
go

