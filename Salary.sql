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


select * from Salary
where accrual_id = 5;

select employee_name,
       month_name,
       year_number,
       accrual_type,
       wage_fund
from Salary
         inner join Employee E on Salary.tab_N = E.tab_N
         inner join Month M on Salary.month_id = M.month_id
         inner join Year Y on Salary.year_id = Y.year_id
         inner join AccrualType A on Salary.accrual_id = A.accrual_id
where organization_id = 3
  and year_number > 2021;

drop procedure if exists GetSalary
create procedure GetSalary
@org as int,
@year as int
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select employee_name,
       month_name,
       year_number,
       accrual_type,
       wage_fund
from Salary
         inner join Employee E on Salary.tab_N = E.tab_N
         inner join Month M on Salary.month_id = M.month_id
         inner join Year Y on Salary.year_id = Y.year_id
         inner join AccrualType A on Salary.accrual_id = A.accrual_id
where organization_id = @org
  and year_number > @year
end

exec GetSalary 3, 2021;

alter table Salary
    drop constraint FK_Salary_tab_N
go

alter table Salary
	add GUID nvarchar(36)
go

alter table Salary
	add constraint FK_Salary_GUID
		foreign key (GUID) references Employee (GUID)
go