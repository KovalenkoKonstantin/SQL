alter table SalaryBudget
    drop constraint FK_SalaryBudget_tab_N;

alter table SalaryBudget alter column tab_N varchar(10) not null;

alter table SalaryBudget
	add constraint FK_SalaryBudget_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from SalaryBudget;

select rtrim(employee_name) as employee_name, month_name, year_number,
       accrual_type, salary_bugget_ammount from SalaryBudget
inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Employee E on SalaryBudget.tab_N = E.tab_N
inner join Month M on SalaryBudget.month_id = M.month_id
inner join Year Y on SalaryBudget.year_id = Y.year_id

where employee_name <> '' --and accrual_type = 'ОКЛАД' or accrual_type = 'НАДБАВКА'
--and year_number = 2023 and month_name = 'Сентябрь'
and organization_id = 3
order by employee_name;