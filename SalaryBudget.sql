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
where employee_name = 'Сокуренко Анатолий Алексеевич'
and year_id = 24
and month_id = 8;

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

select month_id, year_id, salary_budget_ammount, accrual_type from SalaryBudget
inner join AccrualType T on SalaryBudget.accrual_id = T.accrual_id
where tab_N = '000002895'
-- and month_id = 06
and year_id = 24
-- and accrual_id = 2
--and salary_budget_ammount = 275870

-- Этот код создает хранимую процедуру,
-- которая возвращает данные о бюджете на зарплату сотрудников
-- для заданной организации и диапазона лет.
-- Создание хранимой процедуры с именем GetSalaryBudgetRefresh
CREATE PROCEDURE GetSalaryBudgetRefresh
    @organization_id AS INTEGER,       -- Входной параметр: идентификатор организации
    @start_year_number AS INTEGER,     -- Входной параметр: начальный год
    @end_year_number AS INTEGER        -- Входной параметр: конечный год
AS
BEGIN
    -- Отключение вывода сообщения "1 row affected" для каждой операции
    SET NOCOUNT ON;

    -- Основной запрос для процедуры
    SELECT
        RTRIM(employee_name) AS employee_name,  -- Удаление пробелов справа от имени сотрудника
        month_name,                             -- Название месяца
        year_number,                            -- Номер года
        accrual_type,                           -- Тип начисления
        salary_budget_ammount                   -- Сумма бюджета на зарплату
    FROM
        SalaryBudget
    INNER JOIN
        AccrualType A ON SalaryBudget.accrual_id = A.accrual_id -- Соединение с таблицей AccrualType по идентификатору начисления
    INNER JOIN
        Employee E ON SalaryBudget.tab_N = E.tab_N              -- Соединение с таблицей Employee по табельному номеру
    INNER JOIN
        Month M ON SalaryBudget.month_id = M.month_id           -- Соединение с таблицей Month по идентификатору месяца
    INNER JOIN
        Year Y ON SalaryBudget.year_id = Y.year_id              -- Соединение с таблицей Year по идентификатору года
    WHERE
        employee_name <> ''                                     -- Исключение записей с пустым именем сотрудника
        -- AND accrual_type = 'ОКЛАД' OR accrual_type = 'НАДБАВКА' -- Закомментированное условие для фильтрации по типу начисления
        -- AND year_number >= 2021 -- AND month_name = 'Сентябрь'  -- Закомментированное условие для фильтрации по году и месяцу
        AND year_number BETWEEN @start_year_number AND @end_year_number -- Фильтрация по диапазону лет
        AND organization_id = @organization_id                  -- Фильтрация по идентификатору организации
        AND date_of_dismissal = '1753-01-01'                    -- Фильтрация по дате увольнения
    ORDER BY
        employee_name;                                          -- Сортировка по имени сотрудника
END
GO

-- Этот код создает хранимую процедуру,
-- которая возвращает данные о бюджете на зарплату сотрудников
-- для заданной организации и диапазона лет.

-- Создание хранимой процедуры с именем GetSalaryList
CREATE PROCEDURE GetSalaryList
    @organization_id AS INTEGER,       -- Входной параметр: идентификатор организации
    @start_year_number AS INTEGER,     -- Входной параметр: начальный год
    @end_year_number AS INTEGER        -- Входной параметр: конечный год
AS
BEGIN
    -- Основной запрос для процедуры
    SELECT
        RTRIM(employee_name) AS employee_name,  -- Удаление пробелов справа от имени сотрудника
        month_name,                             -- Название месяца
        year_number,                            -- Номер года
        accrual_type,                           -- Тип начисления
        salary_budget_ammount                   -- Сумма бюджета на зарплату
    FROM
        SalaryBudget
    INNER JOIN
        Employee E ON SalaryBudget.GUID = E.GUID              -- Соединение с таблицей Employee по GUID
    INNER JOIN
        AccrualType A ON SalaryBudget.accrual_id = A.accrual_id -- Соединение с таблицей AccrualType по идентификатору начисления
    INNER JOIN
        Month M ON SalaryBudget.month_id = M.month_id           -- Соединение с таблицей Month по идентификатору месяца
    INNER JOIN
        Year Y ON SalaryBudget.year_id = Y.year_id              -- Соединение с таблицей Year по идентификатору года
    WHERE
        employee_name <> ''                                     -- Исключение записей с пустым именем сотрудника
        AND year_number BETWEEN @start_year_number AND @end_year_number -- Фильтрация по диапазону лет
        AND organization_id = @organization_id                  -- Фильтрация по идентификатору организации
        AND date_of_dismissal = '1753-01-01'                    -- Фильтрация по дате увольнения
    ORDER BY
        employee_name,                                          -- Сортировка по имени сотрудника
        year_number;                                            -- Сортировка по номеру года
END
GO

SELECT employee_name,
--        salary_budget_ammount,
       employee_position
--        EC.employee_accounting_type,
--        EC.employee_department,
--        S.month_id,
--        S.year_id

FROM SalaryBudget S
         inner join EmployeeChanges EC ON S.GUID = EC.GUID
         INNER JOIN Employee E ON EC.GUID = E.GUID
WHERE S.year_id = 25
  AND S.month_id = 4
  AND EC.employee_department = 'Отдел разработки компонентов инфраструктуры открытых ключей'
  AND fired = 0
GROUP BY E.employee_name,
         EC.employee_position
--          EC.employee_accounting_type,
--          EC.employee_department,
--          S.month_id,
--          S.year_id,
--          S.salary_budget_ammount
ORDER BY E.employee_name;

SELECT employee_name, employee_position
FROM Employee E
INNER JOIN EmployeeChanges EC ON E.GUID = EC.GUID
WHERE employee_department = 'Отдел разработки компонентов инфраструктуры открытых ключей'
  AND year_id = 25
  AND month_id = 4

UNION ALL

SELECT employee_name, employee_position
FROM Employee E
INNER JOIN EmployeeChanges EC ON E.GUID = EC.GUID
WHERE employee_department = 'Отдел разработки (ОП г. Уфа)'
  AND year_id = 25
  AND month_id = 4

ORDER BY employee_name;

execute SalaryBudget_v_1_1 3, 2025, 2025

select salary_budget_ammount, accrual_type, employee_name from SalaryBudget
inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Employee E on SalaryBudget.GUID = E.GUID
where E.tab_N between '000000001' and '000000010'
and month_id = 4
and year_id = 25