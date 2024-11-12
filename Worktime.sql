alter table Worktime
    add schedule_id int;

alter table Worktime
	add constraint FK_Worktime_schedule_id
		foreign key (schedule_id) references Schedule;

update Worktime
set schedule_id =
        (
            select schedule_id
            from Schedule
            where Worktime.schedule_description = Schedule.schedule_description
        );

select * from Worktime;

alter table Worktime
    drop column schedule_description;

alter table Worktime
    drop constraint FK_Worktime_tab_N;

alter table Worktime alter column tab_N varchar(10) not null;

alter table Worktime
	add constraint FK_Worktime_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from Worktime;

alter table Worktime
    drop constraint FK_Worktime_tab_N;

alter table Worktime alter column tab_N varchar(10) not null;

alter table Worktime
	add constraint FK_Worktime_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from Worktime;

select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_hours, work_hours from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number = 2024
and employee_name = 'Науменко Антон Павлович'
order by employee_name;

select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_hours, work_hours from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number > 2023
and organization_id = 3
order by employee_name;

drop procedure if exists GetWorktimeRefresh;
create procedure GetWorktimeRefresh
@organization_id as integer,
@year_number as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_hours, work_hours from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number >= @year_number
and organization_id = @organization_id
order by employee_name;
end
go

exec GetWorktimeRefresh 3, 2024;

select * from Worktime
where tab_N = '0000000340' and year_id = 24;

select * from Worktime;

drop procedure if exists GetWorktime;
create procedure GetWorktime
@organization_id as integer,
@year_number as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_days, format(date_of_dismissal, 'dd.MM.yyyy')
           as date_of_dismissal from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number >= @year_number
and organization_id = @organization_id
order by employee_name;
end
go

exec GetWorktime 3;


select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_days from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name = 'Пискунов Михаил Борисович'
and year_number = 2025
and month_name = 'Январь'
and organization_id = 3
order by employee_name;

alter table Worktime
	add calendar_days int
go

select * FROM Worktime;

drop procedure if exists GetWorktimeAlt;
create procedure GetWorktimeAlt
@organization_id as integer,
@year_id as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, month_name, year_number,
       calendar_days, format(date_of_dismissal, 'dd.MM.yyyy')
           as date_of_dismissal, E.tab_N from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number >= @year_id
and organization_id = @organization_id
order by employee_name;
end
go

exec GetWorktimeAlt 9, 2023;

select employee_name, month_name, year_number,
       norm_days, norm_hours, work_days, work_hours
from Worktime
         inner join Employee E on Worktime.tab_N = E.tab_N
         inner join Year Y on Worktime.year_id = Y.year_id
         inner join Month M on Worktime.month_id = M.month_id
where employee_name = 'Махмутов Амир Рашитович'
  and month_name = 'Февраль'
  and year_number = 2023;

select norm_hours from Worktime
inner join Employee E on Worktime.tab_N = E.tab_N
where E.employee_name = 'Закиров Ратмир Эльвирович'
and month_id = 4
and year_id = 23;

alter table Worktim
    drop constraint FK_Worktime_tab_N
go

alter table Worktime
	add GUID nvarchar(36)
go

alter table Worktime
	add constraint FK_Worktime_GUID
		foreign key (GUID) references Employee (GUID)
go

select norm_hours from Worktime
inner join Employee E on Worktime.GUID = E.GUID
where month_id = 5
and year_id = 24
and employee_name = 'Давлетшин Александр Сагитович'

select rtrim(employee_name) as employee_name, month_name, year_number,
       norm_hours, work_hours from Worktime
inner join Employee on Worktime.GUID = Employee.GUID
inner join Month M on Worktime.month_id = M.month_id
inner join Year Y on Worktime.year_id = Y.year_id

where employee_name <> ''
and year_number >= 2024
and organization_id = 9
and employee_name = 'Родионов Феликс Николаевич'
and month_name = 'Май'
and year_number = 2024
and date_of_dismissal = '1753-01-01'
order by employee_name;


select * from Worktime
inner join Employee E on Worktime.GUID = E.GUID
where employee_name = 'Мосалев Андрей Вячеславович'
-- where Worktime.tab_N = '0000000029'
and month_id = 6
and year_id = 24
-- and date_of_dismissal = '1753-01-01'


select * from ProjectWork
where tab_N like '%405%'
select * from ProjectWork
where tab_N = '0000000020'

execute GetWorktimeRefresh 9, 2024, 2024;

drop procedure GetWorktimeRefresh;
select * from Worktime;

-- Этот код создает хранимую процедуру,
-- которая возвращает данные о рабочем времени сотрудников
-- для заданной организации и диапазона лет.
-- Создание хранимой процедуры с именем GetWorktimeRefresh
CREATE PROCEDURE GetWorktimeRefresh
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
        norm_hours,                             -- Нормативные часы
        work_hours                              -- Рабочие часы
    FROM
        Worktime
    INNER JOIN
        Employee ON Worktime.GUID = Employee.GUID -- Соединение с таблицей Employee по GUID
    INNER JOIN
        Month M ON Worktime.month_id = M.month_id -- Соединение с таблицей Month по идентификатору месяца
    INNER JOIN
        Year Y ON Worktime.year_id = Y.year_id    -- Соединение с таблицей Year по идентификатору года
    WHERE
        employee_name <> ''                       -- Исключение записей с пустым именем сотрудника
        AND year_number BETWEEN @start_year_number AND @end_year_number -- Фильтрация по диапазону лет
        AND organization_id = @organization_id    -- Фильтрация по идентификатору организации
        -- AND date_of_dismissal = '1753-01-01'   -- Закомментированное условие для фильтрации по дате увольнения
    ORDER BY
        employee_name;                            -- Сортировка по имени сотрудника
END
GO

select * from Worktime
inner join Employee E on Worktime.GUID = E.GUID
where E.tab_N = '000002227'
and year_id = 22
and month_id = 03
and organization_id = 3

BACKUP DATABASE RKM
TO DISK = '\\MSK-FS-01\Kvant\_Свод документов для РКМ\RKM.bak'
WITH INIT;

SELECT name
FROM sys.databases;

select @@VERSION;

select employee_name, schedule_description from Worktime
inner join Employee E on Worktime.GUID = E.GUID
inner join Schedule S on Worktime.schedule_id = S.schedule_id
where employee_name = 'Сущинская Елена Викторовна'
and month_id = 1
and year_id = 24

-- Создаем временную таблицу для хранения нужных значений
CREATE TABLE #WorktimeUpdate (
    GUID UNIQUEIDENTIFIER,
    norm_days INT,
    norm_hours INT,
    schedule_id INT
);

-- Вставляем данные в временную таблицу
INSERT INTO #WorktimeUpdate (GUID, norm_days, norm_hours, schedule_id)
VALUES
('97e3a4f5-1f00-11ee-96b3-4cd98f2f9a07', 3, 24, 44),
('b6b8d521-0c9c-11ec-a66d-b02628f0951d', 17, 136, 44),
-- Добавьте сюда остальные 98 значений
('some-guid-xyz', 10, 80, 44);

-- Обновляем данные в основной таблице, используя временную таблицу
UPDATE Worktime
SET
    Worktime.norm_days = wu.norm_days,
    Worktime.norm_hours = wu.norm_hours,
    Worktime.schedule_id = wu.schedule_id
FROM Worktime wt
JOIN #WorktimeUpdate wu ON wt.GUID = wu.GUID
WHERE wt.GUID IN (SELECT GUID FROM #WorktimeUpdate);

-- Удаляем временную таблицу после выполнения запроса
DROP TABLE #WorktimeUpdate;


MERGE INTO Worktime AS target
USING (VALUES
('97e3a4f5-1f00-11ee-96b3-4cd98f2f9a07', 3, 24.0, 44, '000003317', 24, 1),
('b6b8d521-0c9c-11ec-a66d-b02628f0951d', 17, 136.0, 44, '000002497', 24, 1),
('56c821b0-511b-11ed-a7c4-b02628f0951d', 3, 12.0, 13, '000002983', 24, 1),
('1a718cfc-506c-11ed-a7c3-b02628f0951d', 7, 33.6, 16, '000002971', 24, 2),
('12207577-247c-11ee-96b8-4cd98f2f9a07', 2, 8.0, 13, '000003336', 24, 2),
('76d53537-09b2-11ee-969f-4cd98f2f9a07', 7, 42.0, 19, '000003285', 24, 2),
('20b1f7d7-760a-11ed-9612-4cd98f2f9a07', 18, 114.2, 22, '000003062', 24, 2),
('50a38c8f-28b6-11ee-96bc-4cd98f2f9a07', 16, 95.0, 20, '000003349', 24, 2),
('2d1986c6-46cc-11ec-a6b5-b02628f0951d', 13, 77.0, 19, '000002604', 24, 2),
('36940257-260f-11ee-96ba-4cd98f2f9a07', 2, 12.0, 19, '000003344', 24, 2),
('6fbf193d-aaac-11ec-a723-b02628f0951d', 16, 63.0, 13, '000002724', 24, 2),
('c6b4fd97-8cd5-11ee-9719-4cd98f2f9a07', 5, 30.0, 19, '000003578', 24, 3),
('7ff52d66-2076-11ee-96b5-4cd98f2f9a07', 5, 40.0, 44, '000003325', 24, 3),
('3329e00a-1f0d-11ee-96b3-4cd98f2f9a07', 10, 60.0, 19, '000003319', 24, 3),
('7bb8c835-c1b4-11ee-974c-4cd98f2f9a07', 5, 30.0, 19, '000003690', 24, 4),
('a8a30fc2-8ff9-11ed-962a-4cd98f2f9a07', 11, 88.0, 44, '000003079', 24, 4),
('ec180701-aa93-11ec-a723-b02628f0951d', 8, 64.0, 44, '000002715', 24, 4),
('858d3fb8-3196-11ec-a69c-b02628f0951d', 5, 30.0, 19, '000002566', 24, 4),
('a2420fc4-be6f-11ee-9748-4cd98f2f9a07', 10, 60.0, 19, '000003667', 24, 4),
('59fc489d-b120-11ed-9649-4cd98f2f9a07', 15, 119.0, 44, '000003110', 24, 5),
('61735d06-ba9b-11ee-9745-4cd98f2f9a07', 15, 120.0, 44, '000003650', 24, 5),
('be7e2f8c-aaa7-11ec-a723-b02628f0951d', 15, 120.0, 44, '000002722', 24, 5),
('82d9ac9a-9801-11ee-9724-4cd98f2f9a07', 15, 59.0, 13, '000003607', 24, 5),
('9d0817c9-c0e0-11ee-974b-4cd98f2f9a07', 5, 19.0, 13, '000003681', 24, 5),
('8f463ae9-da07-11ee-9761-4cd98f2f9a07', 10, 80.0, 44, '000003724', 24, 6),
('51d7fdd0-512b-11ed-a7c4-b02628f0951d', 14, 111.0, 44, '000002985', 24, 6),
('34451473-a210-11ed-963b-4cd98f2f9a07', 17, 136.0, 44, '000003099', 24, 7),
('ddba3305-c417-11ee-974d-4cd98f2f9a07', 18, 144.0, 46, '000003697', 24, 7),
('dc841072-bd19-11ee-9747-4cd98f2f9a07', 10, 40.0, 13, '000003660', 24, 7),
('d3e7dc75-bd17-11ee-9747-4cd98f2f9a07', 10, 60.0, 19, '000003659', 24, 7),
('c1b026aa-5208-11ed-a7c5-b02628f0951d', 12, 96.0, 44, '000002988', 24, 7),
('a81480c5-0be3-11ed-a783-b02628f0951d', 9, 36.0, 13, '000002843', 24, 7),
('b2d09bad-1195-11ed-a788-b02628f0951d', 5, 30.0, 19, '000002856', 24, 7),
('b9ad7cac-a64c-11eb-a5e7-b02628f0951d', 12, 96.0, 44, '000002412', 24, 7),
('61a69c45-1482-11ec-a677-b02628f0951d', 11, 44.0, 13, '000002511', 24, 7),
('17a46296-e86d-11eb-a63e-b02628f0951d', 12, 96.0, 44, '000002464', 24, 7),
('12207577-247c-11ee-96b8-4cd98f2f9a07', 5, 24.0, 16, '000003336', 24, 7),
('fcd25bb8-c419-11ee-974d-4cd98f2f9a07', 8, 64.0, 44, '000003699', 24, 7),
('5e4d33e9-3769-11ee-96cc-4cd98f2f9a07', 5, 30.0, 19, '000003391', 24, 7),
('ee3fef90-925d-11ee-971e-4cd98f2f9a07', 12, 96.0, 44, '000003586', 24, 7),
('978b99a3-9ee7-11e8-a379-00155ddc1c07', 12, 96.0, 44, '000001799', 24, 7),
('943f2104-9920-11ec-a713-b02628f0951d', 6, 24.0, 13, '000002678', 24, 7),
('965b6279-286e-11e9-a409-00155ddc1c07', 17, 136.0, 44, '000001893', 24, 7),
('1513fdd7-2b7d-11ee-96bf-4cd98f2f9a07', 18, 144.0, 46, '000003357', 24, 7),
('4f62522a-ac41-11ec-a725-b02628f0951d', 6, 24.0, 13, '000002734', 24, 7),
('a9d768d0-2607-11ee-96ba-4cd98f2f9a07', 10, 60.0, 19, '000003343', 24, 7),
('85d73843-4b15-11ee-96dd-4cd98f2f9a07', 11, 44.0, 13, '000003416', 24, 7),
('a3f35fae-2fa1-11ee-96c3-4cd98f2f9a07', 10, 40.0, 13, '000003365', 24, 8),
('c6b4fd97-8cd5-11ee-9719-4cd98f2f9a07', 14, 84.0, 19, '000003578', 24, 8),
('334eb35e-6db8-11ea-919d-00155ddc1c0b', 6, 35.0, 106, '000002151', 24, 8),
('e4236b3a-d374-11ed-966c-4cd98f2f9a07', 6, 35.0, 106, '000003219', 24, 8),
('4d4e7e31-3573-11ec-a6a1-b02628f0951d', 14, 154.0, 29, '000002582', 24, 8),
('092fb8fa-1a73-11ea-9142-00155ddc1c0b', 6, 35.0, 106, '000002069', 24, 8),
('b6182760-c406-11ee-974d-4cd98f2f9a07', 5, 40.0, 45, '000003695', 24, 8),
('18a5cd0a-55ff-11ee-96e7-4cd98f2f9a07', 7, 28.0, 13, '000003430', 24, 8),
('2f772fc0-4f8a-11ed-a7c2-b02628f0951d', 12, 48.0, 13, '000002952', 24, 8),
('00ab008b-2a61-11ec-a693-b02628f0951d', 12, 96.0, 44, '000002531', 24, 8),
('a7150260-14e8-11ee-96aa-4cd98f2f9a07', 7, 38.5, 107, '000003302', 24, 8),
('1013b72d-ba6b-11ee-9745-4cd98f2f9a07', 2, 8.0, 13, '000003648', 24, 8),
('fdce513f-f378-11eb-a64d-b02628f0951d', 12, 96.0, 44, '000002480', 24, 8),
('a3bc0f91-2cda-11eb-9131-00155ddc2a03', 9, 99.0, 29, '000002281', 24, 8),
('6aa8f47c-f30a-11ed-9688-4cd98f2f9a07', 5, 30.0, 20, '000003252', 24, 8),
('8e804800-d1ec-11ed-966a-4cd98f2f9a07', 7, 38.5, 107, '000003206', 24, 8),
('e0192ea3-4ec5-11ed-a7c1-b02628f0951d', 15, 120.0, 44, '000002937', 24, 8),
('874e3c51-ca77-11ea-9201-00155ddc1c0b', 10, 80.0, 44, '000002133', 24, 8),
('586696ff-4edc-11ed-a7c1-b02628f0951d', 10, 80.0, 46, '000002944', 24, 8),
('9fe2b3d3-aa89-11ec-a723-b02628f0951d', 5, 40.0, 46, '000002711', 24, 9),
('5dff3292-3cec-11ef-97c0-4cd98f2f9a07', 16, 112.0, 105, '000003888', 24, 9),
('2f772fc0-4f8a-11ed-a7c2-b02628f0951d', 16, 96.0, 19, '000002952', 24, 9),
('60396b35-5891-11ef-97d9-4cd98f2f9a07', 10, 64.0, 22, '000003964', 24, 9),
('fab529f0-7174-11ee-9700-4cd98f2f9a07', 9, 100.0, 28, '000003544', 24, 9),
('12207577-247c-11ee-96b8-4cd98f2f9a07', 5, 30.0, 19, '000003336', 24, 9),
('fe6ba4cb-415b-11ec-a6b1-b02628f0951d', 15, 120.0, 44, '000002599', 24, 9),
('489bd13b-4812-11ef-97ca-4cd98f2f9a07', 6, 36.0, 19, '000003933', 24, 9),
('e6ebdd89-530a-11ef-97d4-4cd98f2f9a07', 11, 88.0, 44, '000003953', 24, 9),
('a229688d-5086-11ed-a7c3-b02628f0951d', 10, 80.0, 44, '000002980', 24, 9),
('4e409476-334b-11ec-a69e-b02628f0951d', 11, 88.0, 44, '000002577', 24, 9),
('e89279b8-487a-11ed-a7bb-b02628f0951d', 12, 96.0, 44, '000002931', 24, 10),
('d7996c19-3578-11ec-a6a1-b02628f0951d', 9, 36.0, 13, '000002583', 24, 10),
('dfd74cf0-4eca-11ed-a7c1-b02628f0951d', 4, 24.0, 19, '000002938', 24, 10),
('2b682a7d-e12a-11ea-921b-00155ddc1c0b', 12, 96.0, 44, '000002210', 24, 10),
('e2038386-6ccb-11e0-b453-00155d045e0d', 21, 168.0, 100, '000000612', 24, 10),
('0f4eabe7-59d5-11ed-95f8-4cd98f2f9a07', 18, 143.0, 46, '000003011', 24, 10),
('39ffa08e-6109-11ee-96f1-4cd98f2f9a07', 4, 32.0, 47, '0000000363', 24, 3),
('4943c8c2-7914-11e8-a34f-00155ddc1c07', 10, 80.0, 44, '0000000137', 24, 4),
('a3112da0-daf5-11ee-9762-4cd98f2f9a07', 10, 79.0, 46, '0000000404', 24, 5),
('a30a78b9-0f64-11ee-96a4-4cd98f2f9a07', 5, 40.0, 44, '0000000332', 24, 5),
('0243c6d1-a47f-11e8-a37f-00155ddc1c07', 4, 16.0, 32, '0000000141', 24, 8),
('792ad29a-c1c9-11ee-974c-4cd98f2f9a07', 10, 80.0, 45, '0000000386', 24, 8),
('59168321-caf1-11e8-a3a9-00155ddc1c07', 10, 80.0, 44, '0000000143', 24, 8),
('98afa152-44d9-11e9-a429-00155ddc1c07', 11, 33.0, 101, '0000000146', 24, 10),
('b9df127a-2d54-11ef-97b2-4cd98f2f9a07', 13, 76.0, 79, '0000000419', 24, 10),
('69b5f88c-4b06-11ee-96dd-4cd98f2f9a07', 13, 83.2, 22, '0000000134', 24, 7),
('79ff9c4e-cf07-11ee-9757-4cd98f2f9a07', 9, 36.0, 13, '0000000146', 24, 7)

) AS source (GUID, norm_days, norm_hours, schedule_id, tab_N, year_id, month_id)
ON target.GUID = source.GUID
    AND target.year_id = source.year_id
    AND target.month_id = source.month_id
WHEN MATCHED THEN
    UPDATE SET
        target.norm_days = source.norm_days,
        target.norm_hours = source.norm_hours,
        target.schedule_id = source.schedule_id,
        target.tab_N = source.tab_N;
