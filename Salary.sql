alter table Salary
    drop constraint FK_Salary_tab_N;

alter table Salary alter column tab_N varchar(10) not null;

alter table Salary
	add constraint FK_Salary_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from Salary;

alter table Salary
	add constraint FK_Salary_tab_N
		foreign key (tab_N) references Employee;

select * from Salary;

select * from Salary
inner join Employee E on Salary.tab_N = E.tab_N
where employee_name = 'Фефилов Александр Валерьевич'
and year_id = 23
and month_id between 9 and 10
and accrual_id = 4;