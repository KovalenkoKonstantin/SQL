-- Этот код создает хранимую процедуру,
-- которая возвращает список сотрудников для заданной компании,
-- которые не уволены, и сортирует их по табельному номеру в порядке убывания.
-- Создание хранимой процедуры с именем GetEmployee
CREATE PROCEDURE Employee_v_1_3
    @company_id AS INT  -- Входной параметр: идентификатор компании
AS
BEGIN
    -- Отключение вывода сообщения "1 row affected" для каждой операции
    SET NOCOUNT ON;

    -- Основной запрос для процедуры
    SELECT
        employee_name,  -- Имя сотрудника
        tab_N,           -- Табельный номер сотрудника
        date_of_dismissal
    FROM
        Employee
    -- INNER JOIN Organization O ON Employee.organization_id = O.organization_id
    -- WHERE organization_name = 'АО "ПМ"'
    WHERE
        organization_id = @company_id  -- Фильтрация по идентификатору компании
        AND fired = 0                  -- Фильтрация по статусу увольнения (0 - не уволен)
    ORDER BY
        employee_name;  -- Сортировка по табельному номеру в порядке убывания
END
GO