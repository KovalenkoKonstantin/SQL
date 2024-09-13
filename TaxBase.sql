alter table TaxBase
    drop constraint FK_TaxBase_tab_N;

alter table TaxBase alter column tab_N varchar(10) not null;

alter table TaxBase
	add constraint FK_TaxBase_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from TaxBase;

select rtrim(employee_name) as employee_name,
       month_name, year_number, tax_base_ammount from TaxBase
inner join Employee E on TaxBase.tab_N = E.tab_N
inner join Month M on TaxBase.month_id = M.month_id
inner join Year Y on TaxBase.year_id = Y.year_id
where employee_name <> ''
and organization_id = 3
order by employee_name, year_number;

select * from Employee
where rtrim(employee_name) = 'Науменко Антон Павлович';

drop procedure if exists GetTaxBaseRefresh;
CREATE procedure GetTaxBaseRefresh
@organization_id as integer,
@year_number as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name,
       month_name, year_number, tax_base_ammount from TaxBase
inner join Employee E on TaxBase.tab_N = E.tab_N
inner join Month M on TaxBase.month_id = M.month_id
inner join Year Y on TaxBase.year_id = Y.year_id
where employee_name <> ''
and organization_id = @organization_id
and year_number >= @year_number
order by employee_name, year_number;
end
go

exec GetTaxBaseRefresh 3, 2024;

alter table TaxBase
    drop constraint FK_TaxBase_tab_N
go

alter table TaxBase
	add GUID nvarchar(36)
go

alter table TaxBase
	add constraint FK_TaxBase_GUID
		foreign key (GUID) references Employee (GUID)
go

alter table TaxBase
	add tax_base_civil_contract_amount float
go

select * from TaxBase
where tab_N = '000000484'
and year_id = 24;

-- Создание хранимой процедуры с именем GetTaxBaseRefresh
alter PROCEDURE GetTaxBaseRefresh
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
        tax_base_ammount                        -- Сумма налоговой базы
    FROM
        TaxBase
    INNER JOIN
        Employee E ON TaxBase.tab_N = E.tab_N   -- Соединение с таблицей Employee по табельному номеру
    INNER JOIN
        Month M ON TaxBase.month_id = M.month_id -- Соединение с таблицей Month по идентификатору месяца
    INNER JOIN
        Year Y ON TaxBase.year_id = Y.year_id   -- Соединение с таблицей Year по идентификатору года
    WHERE
        employee_name <> ''                     -- Исключение записей с пустым именем сотрудника
        AND organization_id = @organization_id  -- Фильтрация по идентификатору организации
        AND year_number BETWEEN @start_year_number AND @end_year_number -- Фильтрация по диапазону лет
    ORDER BY
        employee_name,                          -- Сортировка по имени сотрудника
        year_number;                            -- Сортировка по номеру года
END
go

select * from TaxBase
where year_id = 25