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

--средняя заработная плата по АО ПМ в 2023г.
select round(avg(wage_fund), 2) as wage from Salary
inner join Employee E on Salary.tab_N = E.tab_N
inner join Organization O on E.organization_id = O.organization_id
where E.organization_id = 9 and accrual_id = 5
and year_id = 23; -- 5 ОЗП, 9 - ПМ

--средняя заработная плата по АО ИнфоТеКС в 2023 г.
select round(avg(wage_fund), 2) as wage from Salary
inner join Employee E on Salary.tab_N = E.tab_N
inner join Organization O on E.organization_id = O.organization_id
where E.organization_id = 3 and accrual_id = 5
and year_id = 23; -- 5 ОЗП, 3 - Инфотекс