--3.4.6.
--Для вставки нового столбца используется SQL запросы:
/*ALTER TABLE таблица ADD имя_столбца тип; - вставляет столбец после последнего
ALTER TABLE таблица ADD имя_столбца тип FIRST; - вставляет столбец перед первым
ALTER TABLE таблица ADD имя_столбца тип AFTER имя_столбца_1; - вставляет столбец после укзанного столбца*/
--Для удаления столбца используется SQL запросы:
/*ALTER TABLE таблица DROP COLUMN имя_столбца; - удаляет столбец с заданным именем
ALTER TABLE таблица DROP имя_столбца; - ключевое слово COLUMN не обязательно указывать
ALTER TABLE таблица DROP имя_столбца,
                    DROP имя_столбца_1; - удаляет два столбца*/
--Для переименования столбца используется  запрос (тип данных указывать обязательно):
/*ALTER TABLE таблица CHANGE имя_столбца новое_имя_столбца ТИП ДАННЫХ;*/
--Для изменения типа  столбца используется запрос (два раза указывать имя столбца обязательно):
/*ALTER TABLE таблица CHANGE имя_столбца имя_столбца НОВЫЙ_ТИП_ДАННЫХ;*/

select * from applicant_order;

/*Включить в таблицу applicant_order новый столбец str_id целого типа , расположить его перед первым.*/
--For MYSQL
--alter table applicant_order add str_id int first;
alter table applicant_order add str_id int;