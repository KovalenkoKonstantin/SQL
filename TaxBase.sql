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