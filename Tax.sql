alter table Tax
    add tax_name_id int;

alter table Tax
    add constraint FK_Tax_tax_name_id
        foreign key (tax_name_id) references TaxName;

update Tax
set tax_name_id =
        (
            select tax_name_id
            from TaxName
            where Tax.tax_name = TaxName.tax_name
        );

alter table Tax
    drop column tax_name

select *
from Tax;

alter table Tax
    drop constraint FK_Tax_tab_N;

alter table Tax
    alter column tab_N varchar(10) not null;

alter table Tax
    add constraint FK_Tax_tab_N
        foreign key (tab_N) references Employee (tab_N);

select *
from Tax;

select month_id, year_id, tab_N, sum(tax_sum) as tottal
from Tax
group by month_id, year_id, tab_N;

select employee_name,
       month_name,
       year_number,
       tax_base_ammount,
       (select sum(tax_sum)
        from Tax
--inner join Employee E on Tax.tab_N = E.tab_N
--inner join Year Y on Tax.year_id = Y.year_id
--inner join Month M on Tax.month_id = M.month_id
        where tax_name_id between 3 and 7) as tax_sum_ammount
       --tax_base_ammount / tax_sum as percentage
from TaxBase
         inner join Tax T on TaxBase.month_id = T.month_id
         inner join Employee E on TaxBase.tab_N = E.tab_N
         inner join Month M on TaxBase.month_id = M.month_id
         inner join Year Y on TaxBase.year_id = Y.year_id
where --tax_name_id between 3 and 7
  --and
    year_number > 2021
  and employee_name <> ''
  and employee_name = 'Абдрафиков Ахат Раушанович'
  and month_name = 'Январь'
  and year_number = 2022
group by employee_name, month_name, year_number, tax_base_ammount;

select tax_base_ammount
from TaxBase
         inner join Month M on TaxBase.month_id = M.month_id
         inner join Year Y on TaxBase.year_id = Y.year_id
         inner join Employee E on TaxBase.tab_N = E.tab_N
where employee_name = 'Абдрафиков Ахат Раушанович'
  and month_name = 'Январь'
  and year_number = 2022;

select sum(tax_sum) as tax_sum_ammount
from Tax
         inner join Employee E on Tax.tab_N = E.tab_N
         inner join Year Y on Tax.year_id = Y.year_id
         inner join Month M on Tax.month_id = M.month_id
where tax_name_id between 3 and 7
  and employee_name = 'Абдрафиков Ахат Раушанович'
  and month_name = 'Январь'
  and year_number = 2022;

alter table Tax
    add tax_sum_amount float;

select rtrim(employee_name) as employee_name,
       month_name,
       year_number,
       round(sum(tax_sum), 2) as tax_sum_amount
from Tax
         inner join Employee E on Tax.tab_N = E.tab_N
         inner join Month M on Tax.month_id = M.month_id
         inner join Year Y on Tax.year_id = Y.year_id
where tax_name_id between 3 and 7
and employee_name <> ''
and organization_id = 3
group by employee_name, month_name, year_number
order by employee_name, year_number;

drop procedure if exists GetTaxRefresh;
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
and year_number > @year_number
group by rtrim(employee_name), Tax.tab_N, month_name, year_number
end
go

exec GetTaxRefresh 3, 2021;

select * from Tax;

select rtrim(employee_name)            as employee_name,
       --month_name,
       --year_number,
       --round(sum(tax_sum), 2)          as tax_sum_amount,
       tax_name, tax_sum,
       rtrim(employee_accounting_type) as employee_accounting_type,
       Tax.tab_N
from Tax
         inner join Employee E on Tax.tab_N = E.tab_N
         inner join Month M on Tax.month_id = M.month_id
         inner join Year Y on Tax.year_id = Y.year_id
         inner join EmployeeChanges EC on Tax.tab_N = EC.tab_N
         inner join TaxName TN on Tax.tax_name_id = TN.tax_name_id
where TN.tax_name_id between 3 and 7
  and employee_name = 'Якушин Вадим Андреевич'
  and organization_id = 3
  and year_number = 2023
  and M.month_id = 7
  and employee_accounting_type != ''
  --and TN.tax_name_id != 2 -- исключаю НДФЛ
group by employee_name, month_name, year_number,
         employee_accounting_type, Tax.tab_N, tax_sum, TN.tax_name
order by employee_name, employee_accounting_type;

select rtrim(employee_name) as employee_name,
       Tax.tab_N,
       --month_id,
       month_name,
       --year_id,
       year_number,
       --tax_name,
       employee_accounting_type,
       round(sum(tax_sum), 2) as tax_sum_amount
from Tax
inner join TaxName TN on Tax.tax_name_id = TN.tax_name_id
inner join Employee E on Tax.tab_N = E.tab_N
inner join Month M on Tax.month_id = M.month_id
inner join Year Y on Tax.year_id = Y.year_id
inner join EmployeeChanges EC on Tax.tab_N = EC.tab_N
where TN.tax_name_id between 3 and 7
and employee_name = 'Якушин Вадим Андреевич'
and Tax.month_id = 7
and Tax.year_id = 23
group by rtrim(employee_name), Tax.tab_N, month_name,
         year_number,
         employee_accounting_type;

alter table Tax
    drop constraint FK_Tax_tab_N
go

alter table Tax
	add GUID nvarchar(36)
go

alter table Tax
	add constraint FK_Tax_GUID
		foreign key (GUID) references Employee (GUID)
go