alter table SalaryBudget
    drop constraint FK_SalaryBudget_tab_N;

alter table SalaryBudget
    alter column tab_N varchar(10) not null;

alter table SalaryBudget
    add constraint FK_SalaryBudget_tab_N
        foreign key (tab_N) references Employee (tab_N);

select *
from SalaryBudget;

select rtrim(employee_name) as employee_name,
       month_name,
       year_number,
       accrual_type,
       salary_bugget_ammount
from SalaryBudget
         inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
         inner join Employee E on SalaryBudget.tab_N = E.tab_N
         inner join Month M on SalaryBudget.month_id = M.month_id
         inner join Year Y on SalaryBudget.year_id = Y.year_id

where employee_name <> '' --and accrual_type = 'ОКЛАД' or accrual_type = 'НАДБАВКА'
  and year_number > 2021  -- and month_name = 'Сентябрь'
  and organization_id = 3
order by employee_name;

drop procedure if exists GetSalaryBudgetRefresh;
create procedure GetSalaryBudgetRefresh @index as integer,
                                        @year as integer
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select rtrim(employee_name) as employee_name,
           month_name,
           year_number,
           accrual_type,
           salary_bugget_ammount
    from SalaryBudget
             inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
             inner join Employee E on SalaryBudget.tab_N = E.tab_N
             inner join Month M on SalaryBudget.month_id = M.month_id
             inner join Year Y on SalaryBudget.year_id = Y.year_id

    where employee_name <> ''  --and accrual_type = 'ОКЛАД' or accrual_type = 'НАДБАВКА'
--and year_number >= 2021 -- and month_name = 'Сентябрь'
      and year_number >= @year -- and month_name = 'Сентябрь'
      and organization_id = @index
    order by employee_name;
end
go

exec GetSalaryBudgetRefresh;

exec GetSalaryBudgetRefresh 9, 2024;

select *
from SalaryBudget
inner join Employee E on SalaryBudget.GUID = E.GUID
where employee_name = 'Дескат Михаил Витальевич'
  and year_id = 24
and month_id = 1
--   and accrual_id = 3; -- Оклад

select avg(salary_bugget_ammount) as salary
from SalaryBudget
         inner join Employee E on SalaryBudget.tab_N = E.tab_N
         inner join Organization O on E.organization_id = O.organization_id
where E.organization_id = 3
  and accrual_id = 5 -- 5 ОЗП, 3 - Инфотекс
  and year_id = 22;

alter table SalaryBudget
    drop constraint FK_SalaryBudget_tab_N
go

alter table SalaryBudget
    add GUID nvarchar(36)
go

alter table SalaryBudget
    add constraint FK_SalaryBudget_GUID
        foreign key (GUID) references Employee (GUID)
go

select month_id, sum(salary_bugget_ammount)
from SalaryBudget
where tab_N = '000000618'
  and year_id = 24
  and month_id between 1 and 7
group by month_id;

select *
from SalaryBudget
         inner join Employee E on SalaryBudget.GUID = E.GUID
-- where date_of_dismissal != '1753-01-01'
--   and YEAR(date_of_dismissal) > year_id
--   and Month(date_of_dismissal) > month_id
-- and employee_name = 'Лыфенко Николай Дмитриевич';
where employee_name = 'Макеева Антонина Борисовна'
and year_id = 24
and month_id = 4;

drop procedure if exists GetSalaryList
create procedure GetSalaryList
@organization_id as integer,
@year_number as integer
as
begin
    select rtrim(employee_name) as employee_name, month_name, year_number,
       accrual_type, salary_budget_ammount from SalaryBudget
inner join Employee E on SalaryBudget.GUID = E.GUID
inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Month M on SalaryBudget.month_id = M.month_id
inner join Year Y on SalaryBudget.year_id = Y.year_id
where employee_name <> ''
and year_number >= @year_number
and organization_id = @organization_id
and date_of_dismissal = '1753-01-01'
order by employee_name, year_number
end

drop procedure if exists GetSalaryListShchepetova
create procedure GetSalaryListShchepetova
@organization_id as integer,
@year_number as integer
as
begin
    select rtrim(employee_name) as employee_name, month_name, year_number,
       sum(salary_budget_ammount) as salary_budget_ammount, fired from SalaryBudget
inner join Employee E on SalaryBudget.GUID = E.GUID
-- inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Month M on SalaryBudget.month_id = M.month_id
inner join Year Y on SalaryBudget.year_id = Y.year_id
where employee_name <> ''
and year_number >= @year_number
and organization_id = @organization_id
-- and employee_name = 'Дымов Виктор Викторович'
-- and year_number = 2024
-- and SalaryBudget.month_id = 4
-- and organization_id = 9
-- and date_of_dismissal = '1753-01-01'
and accrual_id in (2, 3, 13, 14)
-- or accrual_id between 13 and 14
group by rtrim(employee_name), month_name, year_number, fired
order by employee_name, year_number
end

drop procedure if exists GetSalaryListShchepetovaGPC
create procedure GetSalaryListShchepetovaGPC
@organization_id as integer,
@year_number as integer
as
begin
    select rtrim(employee_name) as employee_name, month_name, year_number,
       sum(salary_budget_ammount) as salary_budget_ammount, fired from SalaryBudget
inner join Employee E on SalaryBudget.GUID = E.GUID
-- inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Month M on SalaryBudget.month_id = M.month_id
inner join Year Y on SalaryBudget.year_id = Y.year_id
where employee_name <> ''
-- and year_number >= @year_number
-- and organization_id = @organization_id
and year_number >= 2024
and organization_id = 9
and employee_name = 'Бреус Данил Евгеньевич'
and accrual_id = 1
group by rtrim(employee_name), month_name, year_number, fired
order by employee_name, year_number
end

drop procedure if exists GetSalaryListShchepetovaAlt
create procedure GetSalaryListShchepetovaAlt
@month_id as integer,
@year_number as integer,
@organization_id as integer
as
begin
    select rtrim(employee_name) as employee_name, month_name, year_number,
       sum(salary_budget_ammount) as salary_budget_ammount, fired from SalaryBudget
inner join Employee E on SalaryBudget.GUID = E.GUID
-- inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Month M on SalaryBudget.month_id = M.month_id
inner join Year Y on SalaryBudget.year_id = Y.year_id
where employee_name <> ''
and SalaryBudget.month_id = @month_id
and year_number = @year_number
and organization_id = @organization_id
-- and employee_name = 'Дымов Виктор Викторович'
-- and year_number = 2024
-- and SalaryBudget.month_id = 4
-- and organization_id = 9
-- and date_of_dismissal = '1753-01-01'
and accrual_id in (2, 3, 13, 14)
-- or accrual_id between 13 and 14
group by rtrim(employee_name), month_name, year_number, fired
order by employee_name, year_number
end

drop procedure if exists GetSalaryListShchepetovaRK
create procedure GetSalaryListShchepetovaRK
@organization_id as integer,
@year_number as integer

as
begin
    select rtrim(employee_name) as employee_name, month_name, year_number,
       sum(salary_budget_ammount) as salary_budget_ammount, fired from SalaryBudget
inner join Employee E on SalaryBudget.GUID = E.GUID
-- inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Month M on SalaryBudget.month_id = M.month_id
inner join Year Y on SalaryBudget.year_id = Y.year_id
where employee_name <> ''
-- and SalaryBudget.month_id = @month_id
and year_number >= @year_number
and organization_id = @organization_id
-- and employee_name = 'Дымов Виктор Викторович'
-- and year_number = 2024
-- and SalaryBudget.month_id = 4
-- and organization_id = 9
-- and date_of_dismissal = '1753-01-01'
and accrual_id = 13
-- or accrual_id between 13 and 14
group by rtrim(employee_name), month_name, year_number, fired
order by employee_name, year_number
end

execute GetSalaryList 9, 2024;
execute GetSalaryListShchepetova 9, 2023;
execute GetSalaryListShchepetovaAlt 04, 2024,9;
execute GetSalaryListShchepetovaRK 9,2024;
execute GetSalaryListShchepetovaGPC 9, 2024;
execute GetSalaryBudgetRefresh 6, 2023;


select rtrim(employee_name) as employee_name,
            SalaryBudget.tab_N,
           month_name,
           year_number,
           accrual_type,
           salary_budget_ammount
    from SalaryBudget
             inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
             inner join Employee E on SalaryBudget.tab_N = E.tab_N
             inner join Month M on SalaryBudget.month_id = M.month_id
             inner join Year Y on SalaryBudget.year_id = Y.year_id

    where employee_name = 'Плешаков Алексей Сергеевич'  --and accrual_type = 'ОКЛАД' or accrual_type = 'НАДБАВКА'
and month_name = 'Июнь'
      and year_number = 2024 -- and month_name = 'Сентябрь'
      and organization_id = 6
    order by employee_name;

delete from SalaryBudget
where tab_N = '0000000084'
-- and month_id = 06
-- and year_id = 24
-- and accrual_id = 2
and salary_budget_ammount = 275870