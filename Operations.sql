drop table if exists Operations;
create table Operations
(
	operation_id int identity
		constraint Operations_pk
			primary key nonclustered,
	operation_name varchar(150)
);
insert into Operations(operation_name)
values ('Оформление формуляра'),
       ('Комплектование'),
       ('Контроль комплектующих'),
       ('Регистрация изделия в 1С'),
       ('Выгрузка ПО и ЭД'),
       ('Установка СПО'),
       ('Программирование BIOS'),
       ('Контроль работоспособности'),
       ('Печать этикеток'),
       ('Пломбирование и маркирование'),
       ('Запись диска'),
       ('Упаковка'),
       ('Приемо-сдаточные испытания'),
       ('Завершение работы'),
       ('Подготовка аппаратной платформы'),
       ('Выгрузка ПО'),
       ('Программирование модуля ДНСД'),
       ('Сборка АП'),
       ('Взвешивание');

select * from Operations


-- Этот код создает хранимую процедуру,
-- которая возвращает все записи из таблицы Operations.
-- Создание хранимой процедуры с именем GetAllOperations

CREATE PROCEDURE GetAllOperations
AS
BEGIN
    -- Отключение вывода сообщения "1 row affected" для каждой операции
    SET NOCOUNT ON;

    -- Основной запрос для процедуры
    SELECT
        * -- Извлечение всех столбцов из таблицы Operations
    FROM
        Operations; -- Указание таблицы для выборки
END
GO