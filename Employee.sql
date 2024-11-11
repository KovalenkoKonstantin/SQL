select tab_N
from Employee
where employee_name = 'Авраменко Юрий Вячеславович';

alter table Employee
    drop constraint FK_LabourIntensity_project_id;

alter table Employee
    add constraint FK_LabourIntensity_project_id
        foreign key (project_id) references Project (project_id);

alter table Employee
    add organization_id int;

alter table Employee
    add constraint FK_Employee_organization_id
        foreign key (organization_id) references Organization (organization_id);

update Employee
set organization_id =
        (
            select organization_id
            from Organization
            where Organization.organization_inn = Employee.organization_inn
        );

alter table Employee
    drop constraint FK_Employees_organization_inn;

alter table Employee
    drop column organization_inn;

select *
from Employee where organization_id = 9;

alter table Employee
    drop constraint FK_Employee_organization_id;

alter table Employee
    add constraint FK_Employee_organization_id
        foreign key (organization_id) references Organization (organization_id);

select *
from Employee;

alter table Employee
    drop constraint PK_Employee
go

alter table Employee
    alter column tab_N varchar(10) not null;

alter table Employee
    add constraint PK_Employee_tab_N
        primary key nonclustered (tab_N);

update Employee
set employee_name_trimmed = (
    select employee_name
    from Employee
    where employee_name = employee_name_trimmed
);
alter table Employee
    drop column employee_name_trimmed

drop function if exists trim;
CREATE FUNCTION TRIM(@string VARCHAR(max))
    RETURNS VARCHAR(max)
BEGIN
    RETURN LTRIM(RTRIM(@string))
END
GO

SELECT compatibility_level
FROM sys.databases;

ALTER DATABASE RKM
    SET COMPATIBILITY_LEVEL = 140;

update Employee
set employee_name_trimmed = TRIM(employee_name_trimmed);
select TRIM(employee_name_trimmed)
from Employee;
SELECT rTRIM(employee_name) AS Trimmed
from Employee;

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
--and year_number = 2023 and month_name = 'Сентябрь'
order by employee_name;

select tab_N,
       rtrim(employee_name) as employee_name,
       month_name,
       year_number,
       employee_position
from EmployeeChanges
         inner join Employee E on EmployeeChanges.tab_N = E.tab_N
         inner join Month M on EmployeeChanges.month_id = M.month_id
         inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name = 'Бушма Роман Александрович'
  and year_number > 2022
order by month_name;

select tab_N
from Employee
where employee_name = 'Бушма Роман Александрович';

select employee_name
from Employee
where tab_N = '000001762 '

select employee_position
from EmployeeChanges
where tab_N = '000001762 '

update EmployeeChanges
set employee_position = 'Старший специалист'
where tab_N = '000001762 ';

update Employee
set employee_name = 'Бушма Роман Александрович Старый'
where tab_N = '000001762 ';

select rtrim(employee_name) as employee_name, tab_N
from Employee;

select tab_N
from Employee
where rtrim(employee_name) like 'Стенечкина Елена Александровна';

select rtrim(employee_name) as employee_name, tab_N
from Employee
where employee_name <> ''
  and organization_id = 3
order by employee_name;

drop procedure if exists GetEmployeeRefresh;
create procedure GetEmployeeRefresh @index as integer
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select rtrim(employee_name) as employee_name, tab_N
    from Employee
    where employee_name <> ''
      and organization_id = @index
    order by employee_name
end
go

exec GetEmployeeRefresh;

select employee_name, tab_N
from Employee
where tab_N = '0000000162';

select employee_name, tab_N
from Employee
where organization_id = 9
  and employee_name = '';

drop procedure if exists GetEmployee
create procedure GetEmployee @org as int
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select employee_name, tab_N, format(date_of_dismissal, 'dd.MM.yyyy') as date_of_dismissal
    from Employee
-- inner join Organization O on Employee.organization_id = O.organization_id
-- where organization_name = 'АО "ПМ"'
    where organization_id = @org
    order by tab_N desc
end
    exec GetEmployee 9;

select employee_name, tab_N
from Employee
where employee_name = 'Кислова Татьяна Константиновна';

select *
from Employee
where employee_name = 'Ганжа Юрий Сергеевич';


select employee_name, tab_N, format(date_of_dismissal, 'dd.MM.yyyy') as date_of_dismissal
from Employee
where organization_id = 9
  and employee_name = 'Родионов Феликс Николаевич'
order by employee_name;

select *
from Employee
where employee_name like '%(%'

select *
from Employee
where employee_name like 'Юркин Константин Юрьевич';

select top 50 *
from Employee
where employment != '';

select *
from Employee
where employee_name = 'Булавкин Даниил Сергеевич';

select *
from Employee
where tab_N like '0000000075'
order by employee_name;

select *
from Employee
where organization_id = 6
order by employee_name;

    drop index PK_Employee_tab_N on Employee
go
alter table Employee
    drop constraint PK_Employee_tab_N
go
alter table Employee
    add GUID varchar(100)
go
alter table Employee
    alter column GUID nvarchar(36) null
go

alter procedure GetEmployee
    @org as int,
    @startdate as date
    as
    begin
        --prevent the "1 row affected" message from being returned for every operation
        set nocount on
--statement for the procedure
        select employee_name, tab_N, format(date_of_dismissal, 'dd.MM.yyyy') as date_of_dismissal
        from Employee
-- inner join Organization O on Employee.organization_id = O.organization_id
-- where organization_name = 'АО "ПМ"'
        where organization_id = @org
            and date_of_dismissal > @startdate
           or date_of_dismissal = '1753-01-01'
        and fired = 0
        order by tab_N desc
    end
    exec GetEmployee 3, '2022-06-01';

    select *
    from Employee
    where tab_N = '0000000129'
    alter table Employee
        drop constraint PK_Employee_tab_N
go

select *
from Employee
where GUID is null
--and employee_name <> ''
order by employee_name;

delete
from Employee
where GUID is null;

alter table Employee
    alter column GUID nvarchar(36) not null
go

alter table Employee
    add constraint PK_Employee_GUID
        primary key nonclustered (GUID)
go

select *
from Employee
where employee_name = 'Дескат Михаил Витальевич'

exec GetEmployeeRefresh 9;

drop procedure if exists GetEmployeeRefreshAlt;
create procedure GetEmployeeRefreshAlt @index as integer
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select rtrim(employee_name) as employee_name, tab_N
    from Employee
    where employee_name <> ''
      and organization_id = @index
      and date_of_dismissal = '1753-01-01'
      and fired = 0
    order by employee_name
end
go

execute GetEmployeeRefreshAlt 9;

update Employee
set city_id = 4;

select employee_name,
       replace(city_name, N'г. ', '') as city_name
from Employee
         inner join City C on Employee.city_id = C.city_id
where organization_id = 3;

exec GetEmployeeRefresh 9;

drop procedure if exists GetEmployeeListShchepetova;
create procedure GetEmployeeListShchepetova @organization_id as integer
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select employee_name,
           replace(city_name, N'г. ', '')               as city_name,
           replace(employment_date, '1753-01-01', '')   as employment_date,
           replace(date_of_dismissal, '1753-01-01', '') as date_of_dismissal
    from Employee
             inner join City C on Employee.city_id = C.city_id
    where organization_id = @organization_id
-- and employment_date <> '1753-01-01'
    order by employee_name,
             employment_date desc
end
go

execute GetEmployeeListShchepetova 9;

select employee_name, city_name, fired, employment_date
from Employee
         inner join City C on Employee.city_id = C.city_id
where employee_name = 'Бреус Данил Евгеньевич'

select employee_name, city_id
from Employee
where employee_name = 'Бреус Данил Евгеньевич'

update Employee
set city_id = 6
where employee_name = 'Шкуратов Дмитрий Борисович'

drop procedure if exists GetEmployeeRefreshAltДМС;
create procedure GetEmployeeRefreshAltДМС
    @organization_id as integer,
    @date as date
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
    --statement for the procedure
--     set @year_id = convert(date, @year_id, 101)
    select distinct rtrim(employee_name) as employee_name, Employee.tab_N
    from Employee
    inner join VHI V on Employee.GUID = V.GUID
    where employee_name <> ''
      and Employee.organization_id = @organization_id
      and date_of_dismissal > @date
      and insurance_program <> ''
      and policy_issue_date > @date
    -- order by employee_name
    UNION
    select distinct rtrim(employee_name) as employee_name, Employee.tab_N
    from Employee
    inner join VHI V on Employee.GUID = V.GUID
    where employee_name <> ''
      and Employee.organization_id = @organization_id
      and fired = 0
      and insurance_program <> ''
      and policy_issue_date > @date
    union
    select relative, E.tab_N from VHI
    inner join Employee E on VHI.GUID = E.GUID
    where [relative's_insurance ] = 1
    and E.organization_id = 9
    order by employee_name
end
go

execute GetEmployeeRefreshAltДМС 9, '2023-07-30';


select distinct rtrim(employee_name) as employee_name, Employee.tab_N
from Employee
inner join VHI V on Employee.GUID = V.GUID
where employee_name <> ''
  and Employee.organization_id = 9
  and date_of_dismissal > '2023-07-30'
  and insurance_program <> ''
-- order by employee_name
UNION
select distinct rtrim(employee_name) as employee_name, Employee.tab_N
from Employee
inner join VHI V on Employee.GUID = V.GUID
where employee_name <> ''
  and Employee.organization_id = 9
  and fired = 0
  and insurance_program <> ''
union
select relative, E.tab_N from VHI
inner join Employee E on VHI.GUID = E.GUID
where [relative's_insurance ] = 1
and E.organization_id = 9
order by employee_name

select * from Employee
inner join VHI V on Employee.GUID = V.GUID
where Employee.tab_N = '0000000357'

select employee_name, relative, E.tab_N from VHI
inner join Employee E on VHI.GUID = E.GUID
where employee_insurance = 1
and E.organization_id = 9

drop procedure if exists GetEmployeeList
create procedure GetEmployeeList
    @organization_id as integer,
    @year_number as integer
    as
    begin
select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_accounting_type) as employee_accounting_type,
       rtrim(employee_position) as employee_position,
       rtrim(schedule_description) as schedule_description,
       rtrim(employee_department) as employee_department
from EmployeeChanges
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
inner join Employee E on EmployeeChanges.GUID = E.GUID
where employee_name <> ''
and year_number >= @year_number
and employee_position <> ''
and organization_id = @organization_id
and date_of_dismissal = '1753-01-01'
order by employee_name, year_number
end
go

execute GetEmployeeList 9, 2024, 2025;

execute GetEmployee 3;

select * from Employee
where employee_name = 'Коновалов Павел Сергеевич';

-- Этот код создает хранимую процедуру,
-- которая возвращает список сотрудников
-- для заданной организации и диапазона лет.
-- Создание хранимой процедуры с именем GetEmployeeList
CREATE PROCEDURE GetEmployeeList
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
        RTRIM(employee_accounting_type) AS employee_accounting_type, -- Удаление пробелов справа от типа учета сотрудника
        RTRIM(employee_position) AS employee_position, -- Удаление пробелов справа от должности сотрудника
        RTRIM(schedule_description) AS schedule_description, -- Удаление пробелов справа от описания графика
        RTRIM(employee_department) AS employee_department -- Удаление пробелов справа от отдела сотрудника
    FROM
        EmployeeChanges
    INNER JOIN
        Month M ON EmployeeChanges.month_id = M.month_id -- Соединение с таблицей Month по идентификатору месяца
    INNER JOIN
        Year Y ON EmployeeChanges.year_id = Y.year_id    -- Соединение с таблицей Year по идентификатору года
    INNER JOIN
        Schedule S ON EmployeeChanges.schedule_id = S.schedule_id -- Соединение с таблицей Schedule по идентификатору графика
    INNER JOIN
        Employee E ON EmployeeChanges.GUID = E.GUID      -- Соединение с таблицей Employee по GUID
    WHERE
        employee_name <> ''                              -- Исключение записей с пустым именем сотрудника
        AND year_number BETWEEN @start_year_number AND @end_year_number -- Фильтрация по диапазону лет
        AND employee_position <> ''                      -- Исключение записей с пустой должностью сотрудника
        AND organization_id = @organization_id           -- Фильтрация по идентификатору организации
        AND fired = 0                                    -- Фильтрация по статусу увольнения (0 - не уволен)
    ORDER BY
        employee_name,                                   -- Сортировка по имени сотрудника
        year_number;                                     -- Сортировка по номеру года
END
GO

-- Этот код создает хранимую процедуру,
-- которая возвращает список сотрудников для заданной компании,
-- которые не уволены, и сортирует их по табельному номеру в порядке убывания.
-- Создание хранимой процедуры с именем GetEmployee
CREATE PROCEDURE GetEmployee
    @company_id AS INT  -- Входной параметр: идентификатор компании
AS
BEGIN
    -- Отключение вывода сообщения "1 row affected" для каждой операции
    SET NOCOUNT ON;

    -- Основной запрос для процедуры
    SELECT
        employee_name,  -- Имя сотрудника
        tab_N           -- Табельный номер сотрудника
    FROM
        Employee
    -- INNER JOIN Organization O ON Employee.organization_id = O.organization_id
    -- WHERE organization_name = 'АО "ПМ"'
    WHERE
        organization_id = @company_id  -- Фильтрация по идентификатору компании
        AND fired = 0                  -- Фильтрация по статусу увольнения (0 - не уволен)
    ORDER BY
        tab_N DESC;  -- Сортировка по табельному номеру в порядке убывания
END
GO

-- Этот код создает хранимую процедуру, которая возвращает данные о сотрудниках,
-- работающих в заданной организации, и их статусах по страховке.
-- Процедура GetEmployeeRefreshAltДМС принимает два параметра:
-- идентификатор организации и дату, и возвращает список несократимых
-- дробей между 0 и 1, где знаменатель не превышает заданного значения.

CREATE PROCEDURE GetEmployeeRefreshAltДМС
    @organization_id AS INTEGER,  -- Параметр для передачи ID организации
    @date AS DATE                   -- Параметр для передачи даты
AS
BEGIN
    -- Предотвращение сообщения "1 row affected" для каждой операции
    SET NOCOUNT ON;

    -- Определение текущей даты для фильтрации
    DECLARE @currentYear AS INT = YEAR(GETDATE());
    DECLARE @currentMonth AS INT = MONTH(GETDATE());

    -- Основной запрос процедуры
    SELECT DISTINCT
        RTRIM(employee_name) AS employee_name,  -- Выбор уникальных имен сотрудников с удалением пробелов справа
        Employee.tab_N                            -- Выбор табельного номера сотрудника
    FROM
        Employee
    INNER JOIN
        VHI V ON Employee.GUID = V.GUID            -- Соединение таблиц Employee и VHI по GUID
    WHERE
        employee_name <> ''                        -- Исключение пустых имен сотрудников
        AND Employee.organization_id = @organization_id  -- Фильтрация по ID организации
        AND date_of_dismissal > @date             -- Условие для даты увольнения
        AND insurance_program <> ''                -- Исключение пустых значений страховки
        AND policy_issue_date > @date              -- Условие для даты выдачи полиса
        AND NOT (YEAR(policy_issue_date) = @currentYear AND @currentMonth >= 8) -- Исключение полисов текущего года начиная с августа
    UNION  -- Объединение результатов
    SELECT DISTINCT
        RTRIM(employee_name) AS employee_name,    -- Также выбираем уникальные имена сотрудников
        Employee.tab_N                              -- И табельный номер сотрудника
    FROM
        Employee
    INNER JOIN
        VHI V ON Employee.GUID = V.GUID            -- Соединение таблиц Employee и VHI по GUID
    WHERE
        employee_name <> ''                        -- Исключение пустых имен сотрудников
        AND Employee.organization_id = @organization_id  -- Фильтрация по ID организации
        AND fired = 0                              -- Условия для сотрудников, которые не уволены
        AND insurance_program <> ''                -- Исключение пустых значений страховки
        AND policy_issue_date > @date              -- Условие для даты выдачи полиса
        AND NOT (YEAR(policy_issue_date) = @currentYear AND @currentMonth >= 8) -- Исключение полисов текущего года начиная с августа
    UNION  -- Объединение результатов
    SELECT
        relative, E.tab_N                          -- Выбор родственников из VHI и табельного номера
    FROM
        VHI
    INNER JOIN
        Employee E ON VHI.GUID = E.GUID           -- Соединение таблиц VHI и Employee по GUID
    WHERE
        [relative's_insurance] = 1                 -- Условие для проверки, есть ли страховка у родственников
        AND E.organization_id = 9                  -- Фильтрация по ID организации (9)

    ORDER BY
        employee_name                               -- Сортировка результатов по имени сотрудника
END
GO

create procedure GetEmployeeRefreshAltДМС
    @organization_id as integer,
    @date as date
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
    -- Определение текущей даты для фильтрации
    DECLARE @currentYear AS INT = YEAR(GETDATE());
    DECLARE @currentMonth AS INT = MONTH(GETDATE());
    --statement for the procedure
--     set @year_id = convert(date, @year_id, 101)
    select distinct rtrim(employee_name) as employee_name, Employee.tab_N
    from Employee
    inner join VHI V on Employee.GUID = V.GUID
    where employee_name <> ''
      and Employee.organization_id = @organization_id
      and date_of_dismissal > @date
      and insurance_program <> ''
      and policy_issue_date > @date
      AND (YEAR(policy_issue_date) = @currentYear if @currentMonth >= 8
                 or YEAR(policy_issue_date) = @currentYear - 1 if @currentMonth < 8)
    -- order by employee_name
    UNION
    select distinct rtrim(employee_name) as employee_name, Employee.tab_N
    from Employee
    inner join VHI V on Employee.GUID = V.GUID
    where employee_name <> ''
      and Employee.organization_id = @organization_id
      and fired = 0
      and insurance_program <> ''
      and policy_issue_date > @date
      AND (YEAR(policy_issue_date) = @currentYear if @currentMonth >= 8
                 or YEAR(policy_issue_date) = @currentYear - 1 if @currentMonth < 8)
    union
    select relative, E.tab_N from VHI
    inner join Employee E on VHI.GUID = E.GUID
    where [relative's_insurance ] = 1
    and E.organization_id = 9
    order by employee_name
end
go

SELECT
        relative, E.tab_N                          -- Имя родственника и табельный номер сотрудника
    FROM
        VHI
    INNER JOIN
        Employee E ON VHI.GUID = E.GUID           -- Соединение таблиц VHI и Employee по GUID
    WHERE
        [relative's_insurance] = 1                 -- Условие для проверки, есть ли страховка у родственников
        AND E.organization_id = 9                -- Фильтрация по ID организации (9)
        AND (   -- Условие для фильтрации по году полиса в зависимости от месяца
            (YEAR(policy_issue_date) = 2024 AND 8 >= 8
                and MONTH(policy_issue_date) >= 8)  -- Полисы текущего года и текущий месяц >= август
            OR
            (YEAR(policy_issue_date) = 2024 - 1 AND 8 < 8
                and MONTH(policy_issue_date) < 8)  -- Полисы предыдущего года, если текущий месяц < август
        )

    ORDER BY
        employee_name

    SELECT DISTINCT
        RTRIM(employee_name) AS employee_name,    -- Уникальные имена сотрудников с удалением пробелов справа
        Employee.tab_N                              -- Табельный номер сотрудника
    FROM
        Employee
    INNER JOIN
        VHI V ON Employee.GUID = V.GUID            -- Соединение таблиц Employee и VHI по GUID
    WHERE
        employee_name <> ''                        -- Исключение пустых имен сотрудников
        AND Employee.organization_id = 9  -- Фильтрация по ID организации
        AND fired = 0                              -- Условия для сотрудников, которые не уволены
        AND insurance_program <> ''                -- Исключение пустых значений страховки
        AND policy_issue_date > '2024-07-31'              -- Условие для даты выдачи полиса
        AND (   -- Условие для фильтрации по году полиса в зависимости от месяца
            (YEAR(policy_issue_date) = 2024 AND 8 >= 8
                and MONTH(policy_issue_date) >= 8)  -- Полисы текущего года и текущий месяц >= август
            OR
            (YEAR(policy_issue_date) = 2024 - 1 AND 8 < 8
                and MONTH(policy_issue_date) < 8)  -- Полисы предыдущего года, если текущий месяц < август
        )

    SELECT DISTINCT
        RTRIM(employee_name) AS employee_name,  -- Уникальные имена сотрудников с удалением пробелов справа
        Employee.tab_N                            -- Табельный номер сотрудника
    FROM
        Employee
    INNER JOIN
        VHI V ON Employee.GUID = V.GUID            -- Соединение таблиц Employee и VHI по GUID
    WHERE
        employee_name <> ''                        -- Исключение пустых имен сотрудников
        AND Employee.organization_id = 9  -- Фильтрация по ID организации
        AND date_of_dismissal > '2024-07-31'            -- Условие для даты увольнения
        AND insurance_program <> ''                -- Исключение пустых значений страховки
        AND policy_issue_date > '2024-07-31'             -- Условие для даты выдачи полиса
        AND (   -- Условие для фильтрации по году полиса в зависимости от месяца
            (YEAR(policy_issue_date) = 2024 AND 8 >= 8
                and MONTH(policy_issue_date) >= 8)  -- Полисы текущего года и текущий месяц >= август
            OR
            (YEAR(policy_issue_date) = 2024 - 1 AND 8 < 8
                and MONTH(policy_issue_date) < 2024)  -- Полисы предыдущего года, если текущий месяц < август
        )

execute GetEmployeeRefreshAltДМС 9, '2023-07-31', 2023;

select * from Employee
where tab_N = '000002895'

exec EmployeeList_v_1_1 9

-- Этот код создает хранимую процедуру,
-- которая возвращает список сотрудников для заданной компании,
-- которые не уволены, и сортирует их по табельному номеру в порядке убывания.
-- Создание хранимой процедуры с именем GetEmployee
CREATE PROCEDURE EmployeeList_v_1_0
    @company_id AS INT  -- Входной параметр: идентификатор компании
AS
BEGIN
    -- Отключение вывода сообщения "1 row affected" для каждой операции
    SET NOCOUNT ON;

    -- Основной запрос для процедуры
    SELECT
        employee_name  -- Имя сотрудника
    FROM
        Employee
    WHERE
        organization_id = @company_id  -- Фильтрация по идентификатору компании
        AND fired = 0                  -- Фильтрация по статусу увольнения (0 - не уволен)
    ORDER BY
        employee_name;  -- Сортировка по табельному номеру в порядке убывания
END
GO