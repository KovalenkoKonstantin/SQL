alter table Salary
    drop constraint FK_Salary_tab_N;

alter table Salary alter column tab_N varchar(10) not null;

alter table Salary
	add constraint FK_Salary_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from Salary;