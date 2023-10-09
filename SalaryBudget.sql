alter table SalaryBudget
    drop constraint FK_SalaryBudget_tab_N;

alter table SalaryBudget alter column tab_N varchar(10) not null;

alter table SalaryBudget
	add constraint FK_SalaryBudget_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from SalaryBudget;