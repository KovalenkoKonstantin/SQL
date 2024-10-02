alter table EmployeeChanges
    add schedule_id int;

alter table EmployeeChanges
	add constraint FK_EmployeeChanges_schedule_id
		foreign key (schedule_id) references Schedule;

update EmployeeChanges
set schedule_id =
        (
            select schedule_id
            from Schedule
            where EmployeeChanges.schedule_description = Schedule.schedule_description
        );

select * from EmployeeChanges;

alter table EmployeeChanges
    drop column schedule_description;

alter table EmployeeChanges
    drop constraint FK_EmployeeChanges_tab_N;

alter table EmployeeChanges alter column tab_N varchar(10) not null;

alter table EmployeeChanges
	add constraint FK_EmployeeChanges_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from EmployeeChanges;

select rtrim(employee_name) as employee_name, month_name, year_number,
       schedule_description from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id

where employee_name <> ''
and year_number > 2022
and employee_position <> NULL
order by employee_name;

select E.tab_N, month_id, year_id, employee_position, employee_name, E.GUID from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
where employee_name = 'Макеева Антонина Борисовна'
and month_id = 10
and year_id = 24
and organization_id = 9;

select rtrim(employee_name) as employee_name, month_name, year_number,
       employee_accounting_type, employee_position from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name <> '' and year_number > 2021 and employee_position <> ''
and organization_id = 3
order by employee_name;

drop procedure if exists GetEmployeeChangesRefresh;
create procedure GetEmployeeChangesRefresh
@organization_id as integer,
@year_number as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_accounting_type) as employee_accounting_type,
       rtrim(employee_position) as employee_position from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name <> '' and year_number > @year_number and employee_position <> ''
and organization_id = @organization_id
order by employee_name, year_number
end
go

exec GetEmployeeChangesRefresh 3, 2021;

select * from EmployeeChanges
where year_id > 23;

select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_accounting_type), employee_position, employee_department from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name = 'Артёмов Виктор Романович'
and year_number > 2023
and employee_position <> ''
and organization_id = 9
order by employee_name, year_number;

drop procedure if exists GetEmployeeChanges;
create procedure GetEmployeeChanges
@index as integer,
@year as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name)            as employee_name,
       EmployeeChanges.tab_N,
       month_name,
       year_number,
       rtrim(employee_accounting_type) as employee_accounting_type,
       rtrim(employee_position)        as employee_position,
       rtrim(employee_department)      as employee_department
from EmployeeChanges
         inner join Employee E on EmployeeChanges.tab_N = E.tab_N
         inner join Month M on EmployeeChanges.month_id = M.month_id
         inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name <> ''
  and year_number > @year
-- and employee_position <> ''
  and organization_id = @index
order by employee_name, year_number
end
go

exec GetEmployeeChanges 3, 2023;

alter table EmployeeChanges
    drop constraint FK_EmployeeChanges_tab_N
go

alter table EmployeeChanges
	add GUID nvarchar(36)
go

alter table EmployeeChanges
	add constraint FK_EmployeeChanges_GUID
		foreign key (GUID) references Employee (GUID)
go

drop procedure if exists GetEmployeeList
create procedure GetEmployeeList
    @organization_id as integer,
    @year_number as integer
    as
    begin
select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_accounting_type) as employee_accounting_type,
       rtrim(employee_position) as employee_position,
       rtrim(schedule_description) as schedule_description
from EmployeeChanges
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
inner join Employee E on EmployeeChanges.GUID = E.GUID
where employee_name <> ''
and year_number >= 2024
and employee_position <> ''
and organization_id = 9
and date_of_dismissal = '1753-01-01'
order by employee_name, year_number
end

select rtrim(employee_name) as employee_name, month_name, year_number,
       accrual_type, salary_bugget_ammount from SalaryBudget
inner join Employee E on SalaryBudget.GUID = E.GUID
inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Month M on SalaryBudget.month_id = M.month_id
inner join Year Y on SalaryBudget.year_id = Y.year_id
where employee_name <> '' and year_number >= 2024
and organization_id = 9
and date_of_dismissal = '1753-01-01'
order by employee_name, year_number

execute GetEmployeeList 9, 2024;
execute GetEmployeeRefresh 9;
execute GetEmployeeChanges 9, 2024;
execute GetEmployeeChangesRefresh 9, 2024;
execute GetEmployeeChangesRefreshAlt 9, 2023;

drop procedure if exists GetEmployeeChangesRefreshAlt
create procedure GetEmployeeChangesRefreshAlt
    @organization_id as integer,
    @year_number as integer,
    @date as date
    as
    begin
select distinct rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_position) as employee_position,
       rtrim(employee_department) as employee_department,
       EmployeeChanges.tab_N
from EmployeeChanges
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
-- inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
inner join Employee E on EmployeeChanges.GUID = E.GUID
where employee_name <> ''
and year_number >= @year_number
and employee_position <> ''
and organization_id = @organization_id
and date_of_dismissal > @date
-- order by employee_name, year_number
        union
select distinct rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_position) as employee_position,
       rtrim(employee_department) as employee_department,
       EmployeeChanges.tab_N
from EmployeeChanges
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
-- inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
inner join Employee E on EmployeeChanges.GUID = E.GUID
where employee_name <> ''
and year_number >= @year_number
and employee_position <> ''
and organization_id = @organization_id
and fired = 0
order by employee_name, year_number
end

execute GetEmployeeChangesRefreshAlt 9,
    2024,'2023-07-30'

select rtrim(employee_name) as employee_name, month_name, year_number,
       rtrim(employee_position) as employee_position,
       rtrim(employee_department) as employee_department
from EmployeeChanges
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
-- inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
inner join Employee E on EmployeeChanges.GUID = E.GUID
where employee_name = 'Лысенко Екатерина Евгеньевна'
and year_number >= 2023
and employee_position <> ''
and organization_id = 9
and date_of_dismissal > '2023-07-30'
order by employee_name, year_number

drop procedure if exists GetEmployeeListShchepetova
create procedure GetEmployeeListShchepetova
@month_id as integer,
@year_number as integer,
@organization_id as integer
    as
    begin
select rtrim(employee_name) as employee_name,
       rtrim(
           replace(
           replace(
           substring(
               employee_accounting_type,
               charindex('г. ', employee_accounting_type),
               20
                    ),
           'г. ', ''),
           '*', '')
           ) as City
             from EmployeeChanges
             inner join Month M on EmployeeChanges.month_id = M.month_id
             inner join Year Y on EmployeeChanges.year_id = Y.year_id
             inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
             inner join Employee E on EmployeeChanges.GUID = E.GUID
             where employee_name <> ''
                 and year_number >= @year_number
                 and EmployeeChanges.month_id = @month_id
                 and employee_accounting_type <> ''
                 and organization_id = @organization_id
                 and date_of_dismissal = '1753-01-01'
             order by employee_name, year_number
end

execute GetEmployeeListShchepetova 4, 2024, 9;
execute GetEmployeeList 9, 2024;

select rtrim(employee_name) as employee_name,
       rtrim(
           replace(
           replace(
           substring(
               employee_accounting_type,
               charindex('г. ', employee_accounting_type),
               20
                    ),
           'г. ', ''),
           '*', '')
           ) as City
             from EmployeeChanges
             inner join Month M on EmployeeChanges.month_id = M.month_id
             inner join Year Y on EmployeeChanges.year_id = Y.year_id
             inner join Schedule S on EmployeeChanges.schedule_id = S.schedule_id
             inner join Employee E on EmployeeChanges.GUID = E.GUID
             where employee_name <> ''
                 and year_number >= 2024
                 and EmployeeChanges.month_id = 4
                 and employee_accounting_type <> ''
                 and organization_id = 3
                 and date_of_dismissal = '1753-01-01'
             order by employee_name, year_number

-- Этот код создает хранимую процедуру,
-- которая возвращает данные о изменениях сотрудников
-- для заданной организации и диапазона лет.
-- Создание хранимой процедуры с именем GetEmployeeChangesRefresh
CREATE PROCEDURE GetEmployeeChangesRefresh
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
        RTRIM(employee_accounting_type) AS employee_accounting_type, -- Удаление пробелов справа от типа учета сотрудника
        RTRIM(employee_position) AS employee_position -- Удаление пробелов справа от должности сотрудника
    FROM
        EmployeeChanges
    INNER JOIN
        Employee E ON EmployeeChanges.GUID = E.GUID -- Соединение с таблицей Employee по табельному номеру
    INNER JOIN
        Month M ON EmployeeChanges.month_id = M.month_id -- Соединение с таблицей Month по идентификатору месяца
    INNER JOIN
        Year Y ON EmployeeChanges.year_id = Y.year_id    -- Соединение с таблицей Year по идентификатору года
    WHERE
        employee_name <> ''                    -- Исключение записей с пустым именем сотрудника
        AND employee_position <> ''            -- Исключение записей с пустой должностью сотрудника
        AND organization_id = @organization_id -- Фильтрация по идентификатору организации
        AND year_number BETWEEN @start_year_number AND @end_year_number -- Фильтрация по диапазону лет
    ORDER BY
        employee_name,                         -- Сортировка по имени сотрудника
        year_number;                           -- Сортировка по номеру года
END
GO

select * from EmployeeChanges
--where year_id = 24
where tab_N = '0000000270'
--and month_id = 8
order by month_id;

execute GetEmployeeChangesRefreshAlt 9, 2024, '2024-07-31'

SELECT DISTINCT
        RTRIM(E.employee_name) AS employee_name,   -- Убираем пробелы справа от имени сотрудника
        M.month_name,                               -- Название месяца
        Y.year_number,                              -- Номер года
        RTRIM(employee_position) AS employee_position,   -- Убираем пробелы справа от должности сотрудника
        RTRIM(employee_department) AS employee_department, -- Убираем пробелы справа от отдела сотрудника
        EC.tab_N,                                   -- Табельный номер сотрудника
        employee_division                          -- Подразделение сотрудника
    FROM
        EmployeeChanges EC                           -- Используем алиас (EC) для таблицы EmployeeChanges
    INNER JOIN
        Month M ON EC.month_id = M.month_id        -- Соединяем таблицу EmployeeChanges с таблицей Month по идентификатору месяца
    INNER JOIN
        Year Y ON EC.year_id = Y.year_id            -- Соединяем таблицу EmployeeChanges с таблицей Year по идентификатору года
    INNER JOIN
        Employee E ON EC.GUID = E.GUID              -- Соединяем с таблицей Employee по уникальному идентификатору сотрудника
    WHERE
        E.employee_name <> ''                        -- Исключаем записи, где имя сотрудника пустое
        AND Y.year_number >= 2023          -- Фильтруем по номеру года, чтобы выбрать только записи с годом больше или равным переданному
        AND employee_position <> ''                -- Исключаем записи, где должность сотрудника пустая
        AND E.organization_id = 9    -- Фильтруем записи по идентификатору организации
        AND (E.date_of_dismissal = '1753-01-01' OR E.date_of_dismissal > '2023-07-31')
    ORDER BY
        employee_name,                                -- Сортируем результат по имени сотрудника
        year_number;


select  * from EmployeeChanges
inner join Employee E on EmployeeChanges.GUID = E.GUID
where employee_name = 'Коновалов Павел Сергеевич'
and year_id = 24
and month_id>5
and organization_id = 9

EXEC GetSalaryBudgetRefresh
    @organization_id = 3,
    @start_year_number = 2025,
    @end_year_number = 2025,
    @employee_names = 'Лялин Денис Александрович,Филипьев Дмитрий Алексеевич';