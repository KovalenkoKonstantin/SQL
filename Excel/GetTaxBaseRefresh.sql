create procedure GetTaxBaseRefresh
@organization_id as integer,
@year_number as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name,
       month_name, year_number, tax_base_ammount from TaxBase
inner join Employee E on TaxBase.tab_N = E.tab_N
inner join Month M on TaxBase.month_id = M.month_id
inner join Year Y on TaxBase.year_id = Y.year_id
where employee_name <> ''
and organization_id = @organization_id
and year_number >= year_number
order by employee_name, year_number;
end
go

