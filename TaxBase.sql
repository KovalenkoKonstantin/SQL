alter table TaxBase
    drop constraint FK_TaxBase_tab_N;

alter table TaxBase alter column tab_N varchar(10) not null;

alter table TaxBase
	add constraint FK_TaxBase_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from TaxBase;

select rtrim(employee_name) as employee_name,
       month_name, year_number, tax_base_ammount from TaxBase
inner join Employee E on TaxBase.tab_N = E.tab_N
inner join Month M on TaxBase.month_id = M.month_id
inner join Year Y on TaxBase.year_id = Y.year_id
where employee_name <> ''
and organization_id = 3
order by employee_name, year_number;

select * from Employee
where rtrim(employee_name) = 'Науменко Антон Павлович';

drop procedure if exists GetTaxBaseRefresh;
create procedure GetTaxBaseRefresh
@index as integer
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
and organization_id = @index
and year_number > 2021
order by employee_name, year_number;
end
go

exec GetTaxBaseRefresh 3, 2024;

alter table TaxBase
    drop constraint FK_TaxBase_tab_N
go

alter table TaxBase
	add GUID nvarchar(36)
go

alter table TaxBase
	add constraint FK_TaxBase_GUID
		foreign key (GUID) references Employee (GUID)
go

alter table TaxBase
	add tax_base_civil_contract_amount float
go

select * from TaxBase
where tab_N = '000000484'
and year_id = 24;