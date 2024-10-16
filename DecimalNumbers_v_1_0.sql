-- Этот код создает хранимую процедуру,
-- которая возвращает все записи из таблицы DecimalNumbers.
-- Создание хранимой процедуры с именем DecimalNumbers_v_1_0

CREATE PROCEDURE DecimalNumbers_v_1_0
AS
BEGIN
    -- Отключение вывода сообщения "1 row affected" для каждой операции
    SET NOCOUNT ON;

    -- Основной запрос для процедуры
    SELECT
        * -- Извлечение всех столбцов из таблицы DecimalNumbers
    FROM
        DecimalNumbers; -- Указание таблицы для выборки
END
GO

