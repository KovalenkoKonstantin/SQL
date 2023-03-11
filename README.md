/*        # SQL
            Let's begin*/

CREATE TABLE genre
(
    genre_id   INT identity (1, 1) primary key,
    name_genre VARCHAR(30)
);

CREATE TABLE book
(
    book_id INT identity (1, 1) primary key,
    title   VARCHAR(50),
    author  varchar(30),
    price   decimal(8, 2),
    amount  int
);

/*INSERT INTO genre (name_genre)
VALUES ('Диман');*/

/*drop table genre
go*/

/*drop table book
go*/

-- SELECT * FROM genre;
-- select * from book;
-- select *from таблица;
/*insert into book (title, author, price, amount)
values ('Мастер и Маргарита','Булгаков М.А.',670.99,3);
insert into book (title, author, price, amount)
values ('Белая гвардия','Булгаков М.А.',540.50,5);
insert into book (title, author, price, amount)
values ('Идиот','Достоевский Ф.М.',460.00,10);
insert into book (title, author, price, amount)
values ('Братья Карамазовы','Достоевский Ф.М.',799.01,2);*/
/*insert into book (title, author, price, amount)
values ('Стихотворения и поэмы','Есенин С.А.',650.00,15);*/
-- select *from book;
-- select *from book;
-- select author, title, price from book;
-- SELECT title AS Название, amount FROM book;
-- SELECT title AS Название, author as Автор FROM book;
/*SELECT title, author, price, amount,
       price * amount AS total
FROM book;*/
/*SELECT title, amount,
       1.65 * amount AS pack
FROM book;*/
/*SELECT title,
       price,
       ROUND((price*18/100)/(1+18/100),2) AS tax,
       ROUND(price/(1+18/100),2) AS price_tax
FROM book;*/
/*SELECT title,author, amount,
       ROUND(price*0.7,2) AS new_price
FROM book;*/
/*SELECT title, amount, price,
--     IF(amount<4, price*0.5, price*0.7) AS sale
    iif(amount<4, price*0.5, price*0.7) AS sale
FROM book;*/

/*SELECT title, amount, price,
       ROUND(IIF(amount<4, price*0.5, price*0.7),2) AS sale
FROM book;*/
/*SELECT title, amount, price,
    ROUND(iIF(amount < 4, price * 0.5, iIF(amount < 11, price * 0.7, price * 0.9)), 2) AS sale,
    IiF(amount < 4, 'скидка 50%', IiF(amount < 11, 'скидка 30%', 'скидка 10%')) AS Ваша_скидка
FROM book;*/
/*SELECT author, title,
--        ROUND(iIF(author = 'Булгаков М.А.', price * 1.1, iIF(author = 'Есенин С.А.', price * 1.05, price)), 2) AS new_price
       ROUND(IF(author = 'Булгаков М.А.', price * 1.1, IF(author = 'Есенин С.А.', price * 1.05, price)), 2) AS new_price
FROM book;*/
/*SELECT title, price
FROM book
WHERE price < 600;*/
/*SELECT title, author, price * amount AS total
FROM book
WHERE price * amount > 4000;*/


/*select author, title, price
from book
where amount<10;*/
/*SELECT title, author, price
FROM book
WHERE price > 600 AND author = 'Булгаков М.А.';*/
/*SELECT title, author, price
FROM book
WHERE (author = 'Булгаков М.А.' OR author = 'Есенин С.А.') AND price > 600;*/
/*select title, author, price, amount
from book
where ((price<500 or price>600) and price*amount>=5000);*/
/*SELECT title, amount
FROM book
WHERE amount BETWEEN 5 AND 14;*/
/*SELECT title, amount
FROM book
WHERE amount >= 5 AND amount <=14;*/
/*SELECT title, price
FROM book
WHERE author IN ('Булгаков М.А.', 'Достоевский Ф.М.');*/
/*SELECT title, price
FROM book
WHERE author = 'Булгаков М.А.' OR author = 'Достоевский Ф.М.';*/
/*select title, author
from book
where price between 540.50 and 800 and amount in (2, 3, 5, 7);*/
/*SELECT title, author, price
FROM book
ORDER BY title;*/
/*SELECT title, author, price
FROM book
ORDER BY 1;*/
/*SELECT author, title, amount AS Количество
FROM book
WHERE price < 750
ORDER BY author, amount DESC;*/
/*SELECT author, title, amount AS Количество
FROM book
WHERE price < 750
ORDER BY author, Количество DESC;*/
/*SELECT author, title, amount AS Количество
FROM book
WHERE price < 750
ORDER BY 1, 3 DESC;*/
/*select author, title
from book
where amount between 2 and 14 order by author desc, title ASC;*/
-- SELECT * FROM book WHERE author LIKE '%М.%'; --выполняет поиск и выдает все книги, инициалы авторов которых содержат «М.»
-- SELECT * FROM book WHERE title LIKE 'Поэм_'; --выполняет поиск и выдает все книги, названия которых либо «Поэма», либо «Поэмы» и пр.
/*SELECT title
FROM book
WHERE title LIKE 'Б%';*/
/* эквивалентное условие
title LIKE 'б%'
*/
--Строчные и прописные буквы в строках эквивалентны.
/*SELECT title FROM book
WHERE title LIKE '_____'; */-- _ Любой одиночный символ
/*SELECT title FROM book
WHERE title LIKE '______%';*/
/* эквивалентные условия
title LIKE "%______"
title LIKE "%______%"
*/
/*SELECT title FROM book
WHERE   title LIKE '_% и _%' /*отбирает слово И внутри названия */
   OR title LIKE 'и _%' /*отбирает слово И в начале названия */
   OR title LIKE '_% и' /*отбирает слово И в конце названия */
   OR title LIKE 'и' /* отбирает название, состоящее из одного слова И */*/
/*SELECT title FROM book
WHERE title NOT LIKE '% %';*/
/*select title,author
from book
where title like '% %'
  and title not like ' '
  and author like '%С.%'--or author like '%.с.'
order by title ASC;*/
/*select * from book
insert into book(author, price, amount)
values ('Иванов С.С.',50.00,10);
insert into book(title, author, price, amount)
values ('Дети полуночи', 'Рушди Салман',950.00,5);
insert into book(title, author, price, amount)
values ('Лирика', 'Гумилев Н.С.',460.00,10);
insert into book(title, author, price, amount)
values ('Поэмы', 'Бехтерев С.С.',460.00,10);
insert into book(title, author, price, amount)
values ('Капитанская дочка', 'Пушкин А.С.',520.00,7);
select * from book;*/
/*select *
from book;*/
/*SELECT DISTINCT author
FROM book;*/
/*SELECT  author
FROM book
GROUP BY author;*/
/*select distinct amount from book;*/
/*SELECT author, sum(amount)as'общее колличество', count(amount)as'количество отдельных позиций'
FROM book
GROUP BY author;*/
/*SELECT author, SUM(amount)
FROM book
GROUP BY author;*/
/*insert into book(title, author)
values ('Черный человек','Есенин С.А.');*/
/*SELECT author, COUNT(author)as 'автор', COUNT(amount)as 'кол-во', COUNT(*)as'все'
FROM book
GROUP BY author
order by author ASC;*/
-- select *from book;
/*delete from book where book.book_id>4;
-- select *from book;guest
insert into book(title, author, price, amount)
values ('Игрок', 'Достоевский Ф.М.',480.50,10);
insert into book(title, author, price, amount)
values ('Стихотворения и поэмы', 'Есенин С.А.',650.00,15);
select *from book;
select * from sys.index_columns;*/
/*update book set book_id=6 where book_id=12;
select * from book;*/
-- update book set amount=3 where book_id=4;
/*select author as'Автор',
       count(title) as 'Различных_книг',
       sum(amount)as'Количество_экземпляров'
from book
group by author;*/
/*SELECT author, MIN(price) AS min_price
FROM book
GROUP BY author;*/
/*select author,
       min(price) as 'Минимальная_цена',
       max(price) as 'Максимальная_цена',
       avg(price) as 'Средняя_цена'
       from book
group by author;*/
/*SELECT author, SUM(price * amount) AS Стоимость
FROM book
GROUP BY author;*/
/*SELECT author, ROUND(AVG(price),2) AS Средняя_цена
FROM book
GROUP BY author;*/
/*select author,
       round(sum(price*amount),2) as 'Стоимость',
       round(sum(price*amount)/118*18,2) as 'НДС',
       round(sum(price*amount)/1.18,2) as 'Стоимость_без_НДС'
from book
group by author;*/
/*SELECT SUM(amount) AS Количество
FROM book;*/
/*SELECT SUM(amount) AS Количество,
       SUM(price * amount) AS Стоимость
FROM book;*/
/*select min(price) as 'Минимальная_цена',
    max(price) as'Максимальная_цена',
    round(avg(price),2) as 'Средняя_цена'
from book;*/
/*SELECT author,
       MIN(price) AS Минимальная_цена,
       MAX(price) AS Максимальная_цена
FROM book
GROUP BY author
HAVING SUM(price * amount) > 5000;*/
/*SELECT author,
       MIN(price) AS Минимальная_цена,
       MAX(price) AS Максимальная_цена
FROM book
GROUP BY author
HAVING SUM(price * amount) > 5000
ORDER BY Минимальная_цена DESC;*/
/*select round(avg(price), 2) as 'Средняя_цена',
round(sum(price*amount),2) as 'Стоимость'
from book
where amount between 5 and 14;*/
/*SELECT author,
       MIN(price) AS Минимальная_цена,
       MAX(price) AS Максимальная_цена
FROM book
WHERE author <> 'Есенин С.А.'
GROUP BY author
HAVING SUM(amount) > 10;*/
/*SELECT author,
       MIN(price) AS Минимальная_цена,
       MAX(price) AS Максимальная_цена
FROM book
GROUP BY author
HAVING SUM(amount) > 10 AND author <> 'Есенин С.А.';*/
/*select author, sum(price*amount) as 'Стоимость'
from book
where title<>'Идиот' and title<>'Белая гвардия'
group by author
having sum(price*amount)>5000
order by Стоимость desc;*/

-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY

/*SELECT title, author, price, amount
FROM book
WHERE price = (
    SELECT MIN(price)
    FROM book
);*/

/*select author, title, price
from book
where price<=(
    select avg(price)
    from book
)
order by price desc;*/

/*SELECT title, author, amount
FROM book
WHERE ABS(amount - (SELECT AVG(amount) FROM book)) >3;*/
/*insert into book(title, author, price, amount)
values ('Евгений Онегин','Пушкин А.С.',610.00,10);*/

/*select author, title, price
from book
where (price-(select min(price)
       from book))<=150
order by price ASC;*/
-- select min(price) from book;
/*SELECT title, author, amount, price
FROM book
WHERE author IN (
    SELECT author
    FROM book
    GROUP BY author
    HAVING SUM(amount) >= 12
);*/
-- delete from book where title='Евгений онегин';
/*select author, title, amount
from book
where amount in (
    select amount
    from book
    group by amount
    having count(amount)=1
);*/
/*SELECT title, author, amount, price
FROM book
WHERE amount < ALL (
    SELECT AVG(amount)
    FROM book
    GROUP BY author
);*/
/*SELECT title, author, amount, price
FROM book
WHERE amount < ANY (
    SELECT AVG(amount)
    FROM book
    GROUP BY author
);*/
/*select author, title, price
from book
where price < any (
    select min(price)
    from book
    group by author
);*/
/*SELECT title, author, amount,
       (
           SELECT AVG(amount)
           FROM book
       ) AS Среднее_количество
FROM book
WHERE abs(amount - (SELECT AVG(amount) FROM book)) >3;*/
/*SELECT title, author, amount,
       FLOOR((SELECT AVG(amount) FROM book)) AS Среднее_количество
FROM book
WHERE ABS(amount - (SELECT AVG(amount) FROM book)) >3;*/

-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY
/*select title,author,amount,
       (
select max(amount)
from book)-amount as 'Заказ'
from book
where (
          select max(amount)
          from book)-amount<>0
order by author ASC;*/
/*create table supply(
    supply_id INT identity (1, 1) primary key,
--     supply_id INT primary key auto_increment,
    title VARCHAR(50),
    author varchar(30),
    price decimal(8,2),
    amount int
);*/
-- select *from supply;
/*insert into supply(title, author, price, amount)
values
    ('Лирика','Пастернак Б.Л.',518.99,2),
    ('Черный человек','Есенин С.А.',570.20,6),
    ('Белая гвардия','Булгаков М.А.',540.50,7),
    ('Идиот','Достоевский Ф.М.',360.80,3);
select * from supply;*/
/*INSERT INTO book (title, author, price, amount)
SELECT title, author, price, amount
FROM supply;

SELECT * FROM book;*/
-- drop table book;
/*drop table supply;*/
/*create table book(
    book_id INT identity (1, 1) primary key,
--     book_id INT primary key auto_increment,
    title VARCHAR(50),
    author varchar(30),
    price decimal(8,2),
    amount int
);*/
/*create table supply(
    supply_id INT identity (1, 1) primary key,
--     supply_id INT primary key auto_increment,
    title VARCHAR(50),
    author varchar(30),
    price decimal(8,2),
    amount int
);*/
/*insert into book (title, author, price, amount)
values
    ('Мастер и Маргарита','Булгаков М.А.',670.99,3),
    ('Белая гвардия','Булгаков М.А.',540.50,5),
    ('Идиот','Достоевский Ф.М.',460.00,10),
    ('Братья Карамазовы','Достоевский Ф.М.',799.01,2),
    ('Стихотворения и поэмы','Есенин С.А.',650.00,15);*/
/*insert into supply(title, author, price, amount)
values
    ('Лирика','Пастернак Б.Л.',518.99,2),
    ('Черный человек','Есенин С.А.',570.20,6),
    ('Белая гвардия','Булгаков М.А.',540.50,7),
    ('Идиот','Достоевский Ф.М.',360.80,3);
select * from book;
select * from supply;*/

/*INSERT INTO book (title, author, price, amount)
SELECT title, author, price, amount
FROM supply
where author<>'Булгаков М.А.'and author<>'Достоевский Ф.М.';

SELECT * FROM book;*/
/*INSERT INTO book (title, author, price, amount)
SELECT title, author, price, amount
FROM supply
WHERE title NOT IN (
    SELECT title
    FROM book
);
SELECT * FROM book;*/


/*drop table book;
create table book(
    book_id INT identity (1, 1) primary key,
    title VARCHAR(50),
    author varchar(30),
    price decimal(8,2),
    amount int
);
insert into book (title, author, price, amount)
values
    ('Мастер и Маргарита','Булгаков М.А.',670.99,3),
    ('Белая гвардия','Булгаков М.А.',540.50,5),
    ('Идиот','Достоевский Ф.М.',460.00,10),
    ('Братья Карамазовы','Достоевский Ф.М.',799.01,2),
    ('Стихотворения и поэмы','Есенин С.А.',650.00,15);
select *from book;*/


/*insert into book(title, author, price, amount)
select title, author, price, amount
from supply
where author not in (
    select author
    from book
    );
select * from book;*/
/*UPDATE book
SET price = 0.7 * price;
SELECT * FROM book;*/
/*UPDATE book
SET price = 0.7 * price
WHERE amount < 5;
SELECT * FROM book;*/
/*update book
set price=price*0.9
where amount between 5 and 10;
select *
from book;*/

/*drop table book;
create table book(
book_id INT identity (1, 1) primary key,
title VARCHAR(50),
author varchar(30),
price decimal(8,2),
amount int,
buy int
);
insert into book (title, author, price, amount, buy)
values
    ('Мастер и Маргарита','Булгаков М.А.',670.99,3,0),
    ('Белая гвардия','Булгаков М.А.',540.50,5,3),
    ('Идиот','Достоевский Ф.М.',460.00,10,8),
    ('Братья Карамазовы','Достоевский Ф.М.',799.01,2,0),
    ('Стихотворения и поэмы','Есенин С.А.',650.00,15,18);
UPDATE book
SET buy = iif(amount-buy>0, buy, amount);
UPDATE book
SET price = iif(buy=0, price*0.9, price);
select *from book;*/

/*drop table book;
create table book(
                     book_id INT identity (1, 1) primary key,
                     title VARCHAR(50),
                     author varchar(30),
                     price decimal(8,2),
                     amount int
);
insert into book (title, author, price, amount)
values
    ('Мастер и Маргарита','Булгаков М.А.',670.99,3),
    ('Белая гвардия','Булгаков М.А.',540.50,5),
    ('Идиот','Достоевский Ф.М.',460.00,10),
    ('Братья Карамазовы','Достоевский Ф.М.',799.01,2),
    ('Стихотворения и поэмы','Есенин С.А.',650.00,15);
select * from book;


UPDATE book
SET book.amount = book.amount + supply.amount
from supply
WHERE book.title = supply.title AND book.author = supply.author;

SELECT * FROM book;*/
/*drop table book;
drop table supply;
create table book(
                     book_id INT identity (1, 1) primary key,
                     --book_id INT primary key auto_increment,
                     title VARCHAR(50),
                     author varchar(30),
                     price decimal(8,2),
                     amount int
);
create table supply(
                     supply_id INT identity (1, 1) primary key,
                     --supply_id INT primary key auto_increment,
                     title VARCHAR(50),
                     author varchar(30),
                     price decimal(8,2),
                     amount int
);
insert into book (title, author, price, amount)
values
    ('Мастер и Маргарита','Булгаков М.А.',670.99,3),
    ('Белая гвардия','Булгаков М.А.',540.50,5),
    ('Идиот','Достоевский Ф.М.',460.00,10),
    ('Братья Карамазовы','Достоевский Ф.М.',799.01,2),
    ('Стихотворения и поэмы','Есенин С.А.',650.00,15);
insert into supply(title, author, price, amount)
values
    ('Лирика','Пастернак Б.Л.',518.99,2),
    ('Черный человек','Есенин С.А.',570.20,6),
    ('Белая гвардия','Булгаков М.А.',540.50,7),
    ('Идиот','Достоевский Ф.М.',360.80,3);
update book
set book.amount = book.amount + supply.amount
from supply
where book.title = supply.title and book.author = supply.author;
update book
set book.price = (book.price + supply.price)/2
from supply
where book.title = supply.title and book.author = supply.author;
select * from book;*/
/*DELETE FROM supply;

SELECT * FROM supply;*/
drop table book;
drop table supply;
create table book
(
    book_id INT identity (1, 1) primary key,
    title   VARCHAR(50),
    author  varchar(30),
    price   decimal(8, 2),
    amount  int
);
create table supply
(
    supply_id INT identity (1, 1) primary key,
    title     VARCHAR(50),
    author    varchar(30),
    price     decimal(8, 2),
    amount    int
);
insert into book (title, author, price, amount)
values ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3),
       ('Белая гвардия', 'Булгаков М.А.', 540.50, 5),
       ('Идиот', 'Достоевский Ф.М.', 460.00, 10),
       ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2),
       ('Стихотворения и поэмы', 'Есенин С.А.', 650.00, 15);
insert into supply(title, author, price, amount)
values ('Лирика', 'Пастернак Б.Л.', 518.99, 2),
       ('Черный человек', 'Есенин С.А.', 570.20, 6),
       ('Белая гвардия', 'Булгаков М.А.', 540.50, 7),
       ('Идиот', 'Достоевский Ф.М.', 360.80, 3);
delete
from supply
where author in (select author
                 from book
                 where amount >= 10);
select *
from supply;

--CREATE TABLE ordering as
SELECT author, title, 5 AS amount
into ordering
FROM book
WHERE amount < 4;
SELECT *
FROM ordering;

drop table ordering;
--create table ordering as
SELECT author,
       title,
       (SELECT AVG(amount)
        FROM book) AS amount
into ordering
FROM book
WHERE amount < 4;
SELECT *
FROM ordering;

drop table book;
create table book
(
    book_id INT identity (1, 1) primary key,
    title   VARCHAR(50),
    author  varchar(30),
    price   decimal(8, 2),
    amount  int
);
insert into book (title, author, price, amount)
values ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3),
       ('Белая гвардия', 'Булгаков М.А.', 540.50, 5),
       ('Идиот', 'Достоевский Ф.М.', 460.00, 10),
       ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2),
       ('Стихотворения и поэмы', 'Есенин С.А.', 650.00, 15);

drop table ordering;
--create table ordering as
select author,
       title,
       (select avg(amount)
        from book) as amount
into ordering
from book
where amount <
      (select avg(amount)
       from book);
select *
from ordering;

create table trip
(
    trip_id    INT PRIMARY KEY Identity (1,1),
    [name]     varchar(30),
    city       varchar(25),
    per_diem   decimal(8, 2),
    date_first date,
    date_last  date
)
insert into trip ([name], city, per_diem, date_first, date_last)
values ('Баранов П.Е.', 'Москва', 700, '2020-01-12', '2020-01-17'),
       ('Абрамова К.А.', 'Владивосток', 450, '2020-01-14', '2020-01-27'),
       ('Семенов И.В.', 'Москва', 700, '2020-01-23', '2020-01-31'),
       ('Ильиных Г.Р.', 'Владивосток', 450, '2020-01-12', '2020-02-02'),
       ('Колесов С.П.', 'Москва', 700, '2020-02-01', '2020-02-06'),
       ('Баранов П.Е.', 'Москва', 700, '2020-02-14', '2020-02-22'),
       ('Абрамова К.А.', 'Москва', 700, '2020-02-23', '2020-03-01'),
       ('Лебедев Т.К.', 'Москва', 700, '2020-03-03', '2020-03-06'),
       ('Колесов С.П.', 'Новосибирск', 450, '2020-02-27', '2020-03-12'),
       ('Семенов И.В.', 'Санкт-Петербург', 700, '2020-03-29', '2020-04-05'),
       ('Абрамова К.А.', 'Москва', 700, '2020-04-06', '2020-04-14'),
       ('Баранов П.Е.', 'Новосибирск', 450, '2020-04-18', '2020-05-04'),
       ('Лебедев Т.К.', 'Томск', 450, '2020-05-20', '2020-05-31'),
       ('Семенов И.В.', 'Санкт-Петербург', 700, '2020-06-01', '2020-06-03'),
       ('Абрамова К.А.', 'Санкт-Петербург', 700, '2020-05-28', '2020-06-04'),
       ('Федорова А.Ю.', 'Новосибирск', 450, '2020-05-25', '2020-06-04'),
       ('Колесов С.П.', 'Новосибирск', 450, '2020-06-03', '2020-06-12'),
       ('Федорова А.Ю.', 'Томск', 450, '2020-06-20', '2020-06-26'),
       ('Абрамова К.А.', 'Владивосток', 450, '2020-07-02', '2020-07-13'),
       ('Баранов П.Е.', 'Воронеж', 450, '2020-07-19', '2020-07-25');
select *
from trip;

--1.6.1
select [name], city, per_diem, date_first, date_last
from trip
where [name] like '%а %'
order by date_last DESC;

--1.6.2
select distinct [name]
from trip
where city like 'Москва'
order by [name] ASC;

--1.6.3
select city, count(city) as 'Количество'
from trip
group by city
order by city ASC;

SELECT top 1 *
FROM trip
ORDER BY date_first;
--LIMIT 1;

--1.6.4
select top 2 city, count(city) as 'Количество'
from trip
group by city
order by Количество DESC;

--1.6.5
select [name],
       city,
       datediff(day, date_first, date_last) + 1
           as 'Длительность'
from trip
where city not in ('Москва', 'Санкт-Петербург')
order by Длительность DESC, city DESC;

--1.6.6
select *
from trip;
select name, city, date_first, date_last
from trip
where datediff(day, date_first, date_last) =
      (select min(datediff(day, date_first, date_last)) as dif
       from trip);
select name, city, date_first, date_last
from trip
where name like 'Семенов И.В.'
  and date_last like '2020-06-03';

--1.6.7
select name, city, date_first, date_last
from trip
where month(date_first) = month(date_last)
order by city, name;

--1.6.8
select Format(date_first, N'MMMM', N'en-EN')        as Месяц,
       count(Format(date_first, N'MMMM', N'en-EN')) as Количество
from trip
group by Format(date_first, N'MMMM', N'en-EN')
order by Количество desc, Месяц;

--1.6.9
select name, city, date_first, (datediff(day, date_first, date_last) + 1) * per_diem as Сумма
from trip
where month(date_first) = 2
   or month(date_first) = 3
order by name, Сумма desc;
select *
from trip;

--1.6.10
select name, sum((datediff(day, date_first, date_last) + 1) * per_diem) as Сумма
from trip
group by name
having count(name) > 3
order by Сумма desc;

drop table fine, traffic_violation
go
create table fine
(
    fine_id        int primary key identity (1, 1),
    [name]         VARCHAR(30),
    number_plate   VARCHAR(6),
    violation      VARCHAR(50),
    sum_fine       DECIMAL(8, 2),
    date_violation date,
    date_payment   date
)
go
insert into fine ([name], number_plate, violation, sum_fine, date_violation, date_payment)
VALUES ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', 500.00, '2020-01-12', '2020-01-17'),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 1000.00, '2020-01-14', '2020-02-27'),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Превышение скорости(от 20 до 40)', 500.00, '2020-01-23', '2020-02-23'),
       ('Яковлев Г.Р.', 'М701АА', 'Превышение скорости(от 20 до 40)', NULL, '2020-01-12', NULL),
       ('Колесов С.П.', 'К892АХ', 'Превышение скорости(от 20 до 40)', NULL, '2020-02-01', NULL),
       ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', NULL, '2020-02-14', NULL),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', NULL, '2020-02-23', NULL),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', NULL, '2020-03-03', NULL)
go
CREATE TABLE traffic_violation
(
    violation_id int PRIMARY KEY identity (1, 1),
    violation    varchar(50),
    sum_fine     decimal(8, 2)
)
go
INSERT INTO traffic_violation (violation, sum_fine)
VALUES ('Превышение скорости(от 20 до 40)', 500),
       ('Превышение скорости(от 40 до 60)', 1000),
       ('Проезд на запрещающий сигнал', 1000);

select *
from fine;
select *
from traffic_violation;

SELECT f.name,
       f.number_plate,
       f.violation,
       iif(
                   f.sum_fine = tv.sum_fine, 'Стандартная сумма штрафа',
                   iif(
                               f.sum_fine < tv.sum_fine, 'Уменьшенная сумма штрафа', 'Увеличенная сумма штрафа'
                       )
           ) AS description
FROM fine f,
     traffic_violation tv
WHERE tv.violation = f.violation
  and f.sum_fine IS NOT Null;

select *
from fine;
select *
from traffic_violation;

--1.7.4
update fine
set fine.sum_fine = t.sum_fine
from traffic_violation t
where fine.sum_fine is null
  and fine.violation = t.violation;
select *
from fine;

SELECT name, number_plate, violation, count(*)
FROM fine
GROUP BY name, number_plate, violation;

--1.7.5
select name, number_plate, violation
from fine
group by name, number_plate, violation
having count(violation) > 1
order by name, number_plate, violation;

--1.7.6
--recreate fine table
drop table fine
go
create table fine
(
    fine_id        int primary key identity (1, 1),
    [name]         VARCHAR(30),
    number_plate   VARCHAR(6),
    violation      VARCHAR(50),
    sum_fine       DECIMAL(8, 2),
    date_violation date,
    date_payment   date
)
go
insert into fine ([name], number_plate, violation, sum_fine, date_violation, date_payment)
VALUES ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', 500.00, '2020-01-12', '2020-01-17'),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 1000.00, '2020-01-14', '2020-02-27'),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Превышение скорости(от 20 до 40)', 500.00, '2020-01-23', '2020-02-23'),
       ('Яковлев Г.Р.', 'М701АА', 'Превышение скорости(от 20 до 40)', NULL, '2020-01-12', NULL),
       ('Колесов С.П.', 'К892АХ', 'Превышение скорости(от 20 до 40)', NULL, '2020-02-01', NULL),
       ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', NULL, '2020-02-14', NULL),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', NULL, '2020-02-23', NULL),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', NULL, '2020-03-03', NULL)
go
update fine
set fine.sum_fine = t.sum_fine
from traffic_violation t
where fine.sum_fine is null
  and fine.violation = t.violation;
--create temporary table
select [name], number_plate, violation
into temp_table
from fine
group by name, number_plate, violation
having count(*) > 1
order by name, number_plate, violation;
--update fine table with temporary table values
update fine
set sum_fine=sum_fine * 2
from temp_table t
where date_payment is null
  and fine.name = t.name
  and fine.number_plate = t.number_plate
  and fine.violation = t.violation;
--get rid of temp table
drop table temp_table;
--check
select *
from fine;
select *
from temp_table;
--create payment table
create table payment
(
    payment_id     int primary key identity (1,1),
    [name]         varchar(30) null,
    number_plate   varchar(6)  null,
    violation      varchar(50) null,
    date_violation date        null,
    date_payment   date        null
)
go
INSERT INTO payment([name], number_plate, violation, date_violation, date_payment)
VALUES ('Яковлев Г.Р.', 'М701АА', 'Превышение скорости(от 20 до 40)', '2020-01-12', '2020-01-22'),
       ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', '2020-02-14', '2020-03-06'),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', '2020-03-03', '2020-03-23');
--1.7.7
update fine
set sum_fine          = iif(datediff(day, p.date_violation, p.date_payment) <= 20, sum_fine / 2, sum_fine),
    fine.date_payment = p.date_payment
from payment p
where fine.date_payment is null
  and fine.name = p.name
  and fine.number_plate = p.number_plate
  and fine.violation = p.violation;

--1.7.8
--create back_payment table
select [name], number_plate, violation, sum_fine, date_violation
into back_payment
from fine
where date_payment is null;

--pre steps
drop table fine
go
create table fine
(
    fine_id        int primary key identity (1, 1),
    [name]         VARCHAR(30),
    number_plate   VARCHAR(6),
    violation      VARCHAR(50),
    sum_fine       DECIMAL(8, 2),
    date_violation date,
    date_payment   date
)
go
insert into fine ([name], number_plate, violation, sum_fine, date_violation, date_payment)
VALUES ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', 500.00, '2020-01-12', '2020-01-17'),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 1000.00, '2020-01-14', '2020-02-27'),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Превышение скорости(от 20 до 40)', 500.00, '2020-01-23', '2020-02-23'),
       ('Яковлев Г.Р.', 'М701АА', 'Превышение скорости(от 20 до 40)', NULL, '2020-01-12', NULL),
       ('Колесов С.П.', 'К892АХ', 'Превышение скорости(от 20 до 40)', NULL, '2020-02-01', NULL),
       ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', NULL, '2020-02-14', NULL),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', NULL, '2020-02-23', NULL),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', NULL, '2020-03-03', NULL)
go
update fine
set fine.sum_fine = t.sum_fine
from traffic_violation t
where fine.sum_fine is null
  and fine.violation = t.violation
go
--create temporary table
select [name], number_plate, violation
into temp_table
from fine
group by name, number_plate, violation
having count(*) > 1
order by name, number_plate, violation;
--update fine table with temporary table values
update fine
set sum_fine=sum_fine * 2
from temp_table t
where date_payment is null
  and fine.name = t.name
  and fine.number_plate = t.number_plate
  and fine.violation = t.violation;
--get rid of temp table
drop table temp_table
go
--decrease fines
update fine
set sum_fine          = iif(datediff(day, p.date_violation, p.date_payment) <= 20, sum_fine / 2, sum_fine),
    fine.date_payment = p.date_payment
from payment p
where fine.date_payment is null
  and fine.name = p.name
  and fine.number_plate = p.number_plate
  and fine.violation = p.violation;
--1.7.9
delete
from fine
where date_violation < '2020-02-01'
DBCC CHECKIDENT (fine, RESEED, 0);

select *
from fine;

--2.1.6
create table author
(
    author_id   int primary key identity (1, 1),
    name_author varchar(50)
);
--2.1.7
INSERT INTO author (name_author)
VALUES ('Булгаков М.А.'),
       ('Достоевский Ф.М.'),
       ('Есенин С.А.'),
       ('Пастернак Б.Л.');

--2.1.8
drop table book
go
create table book
(
    book_id   INT PRIMARY KEY identity (1,1),
    title     varchar(50),
    author_id int not null,
    genre_id  int not null,
    price     decimal(8, 2),
    amount    int,
    foreign key (author_id) references author (author_id),
    foreign key (genre_id) references genre (genre_id)
);

select *
from author;
drop table book;
CREATE TABLE book
(
    book_id   INT PRIMARY KEY identity (1,1),
    title     VARCHAR(50),
    author_id INT NOT NULL,
    price     DECIMAL(8, 2),
    amount    INT,
    FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE CASCADE
);
select *
from book;

--2.1.9
drop table book
go
create table book
(
    book_id   INT PRIMARY KEY identity (1,1),
    title     varchar(50),
    author_id int not null,
    genre_id  int,
    price     decimal(8, 2),
    amount    int,
    foreign key (author_id) references author (author_id) on delete cascade,
    foreign key (genre_id) references genre (genre_id) on delete set null
);
select *
from author;
select *
from genre;
select *
from book;
insert into genre(name_genre)
values ('Роман'),
       ('Поэзия');
--2.1.10
insert into book(title, author_id, genre_id, price, amount)
values ('Мастер и Маргарита', 1, 1, 670.99, 3),
       ('Белая гвардия', 1, 1, 540.50, 5),
       ('Идиот', 2, 1, 460.00, 10),
       ('Братья Карамазовы', 2, 1, 799.01, 3),
       ('Игрок', 2, 1, 480.50, 10),
       ('Стихотворения и поэмы', 3, 2, 650.00, 15);
select *
from book;
--2.1.11
drop table book
go
create table book
(
    book_id   INT PRIMARY KEY identity (1,1),
    title     varchar(50),
    author_id int not null,
    genre_id  int,
    price     decimal(8, 2),
    amount    int,
    foreign key (author_id) references author (author_id) on delete cascade,
    foreign key (genre_id) references genre (genre_id) on delete set null
)
go
insert into book(title, author_id, genre_id, price, amount)
values ('Мастер и Маргарита', 1, 1, 670.99, 3),
       ('Белая гвардия', 1, 1, 540.50, 5),
       ('Идиот', 2, 1, 460.00, 10),
       ('Братья Карамазовы', 2, 1, 799.01, 3),
       ('Игрок', 2, 1, 480.50, 10),
       ('Стихотворения и поэмы', 3, 2, 650.00, 15),
       ('Черный человек', 3, 2, 570.20, 6),
       ('Лирика', 4, 2, 518.99, 2);
select *
from book;
--2.2
drop table book, genre, author
go
create table genre
(
    genre_id   int primary key identity (1, 1),
    name_genre varchar(30)
)
go
create table author
(
    author_id   int primary key identity (1, 1),
    name_author varchar(50)
)
go
insert into genre(name_genre)
values ('Роман'),
       ('Поэзия'),
       ('Приключения')
go
insert into author (name_author)
values ('Булгаков М.А.'),
       ('Достоевский Ф.М.'),
       ('Есенин С.А.'),
       ('Пастернак Б.Л.'),
       ('Лермонтов М.Ю.')
go
create table book
(
    book_id   INT PRIMARY KEY identity (1,1),
    title     varchar(50),
    author_id int not null,
    genre_id  int,
    price     decimal(8, 2),
    amount    int,
    foreign key (author_id) references author (author_id) on delete cascade,
    foreign key (genre_id) references genre (genre_id) on delete set null
)
go
insert into book(title, author_id, genre_id, price, amount)
values ('Мастер и Маргарита', 1, 1, 670.99, 3),
       ('Белая гвардия', 1, 1, 540.50, 5),
       ('Идиот', 2, 1, 460.00, 10),
       ('Братья Карамазовы', 2, 1, 799.01, 3),
       ('Игрок', 2, 1, 480.50, 10),
       ('Стихотворения и поэмы', 3, 2, 650.00, 15),
       ('Черный человек', 3, 2, 570.20, 6),
       ('Лирика', 4, 2, 518.99, 2);
--2.2.1
SELECT title, name_author
FROM author a
         INNER JOIN book b
                    ON a.author_id = b.author_id;
select *
from book;

select title, name_genre, price
from book b
         inner join genre g on b.genre_id = g.genre_id
where amount > 8
order by price desc;
--2.2.2
SELECT name_author, title
FROM author a
         LEFT JOIN book b
                   ON a.author_id = b.author_id
ORDER BY name_author;

select name_genre
from book b
         right join genre g on b.genre_id = g.genre_id
where title is null
select name_genre
from genre g
         left join book b on g.genre_id = b.genre_id
where title is null
--2.2.3
SELECT name_author, name_genre
FROM author,
     genre;
create table city
(
    city_id   int primary key identity (1,1),
    name_city varchar(30)
)
go
insert into city(name_city)
values ('Москва'),
       ('Санкт-Петербург'),
       ('Владивосток')
go
select *
from city;

select name_city, name_author, dateadd(day, floor(rand() * 365), '2020-01-01') as Дата
from city,
     author
order by name_city, Дата desc;
--2.2.4
SELECT title, name_author, name_genre, price, amount
FROM author
         INNER JOIN book b ON author.author_id = b.author_id
         INNER JOIN genre g ON g.genre_id = b.genre_id
WHERE price BETWEEN 500 AND 700;

select name_genre, title, name_author
from genre g
         inner join book b on g.genre_id = b.genre_id
         inner join author a on b.author_id = a.author_id
where name_genre like 'Роман'
order by title;
--2.2.5
SELECT name_author, count(title) AS Количество
FROM author
         INNER JOIN book b
                    on author.author_id = b.author_id
GROUP BY name_author
ORDER BY name_author;
SELECT name_author, count(title) AS Количество
FROM author
         LEFT JOIN book b
                   on author.author_id = b.author_id
GROUP BY name_author
ORDER BY name_author;
--2.2.6
select name_author, sum(amount) as Количество
from author a
         left join book b
                   on a.author_id = b.author_id
group by name_author
having sum(amount) < 10
    or sum(amount) is null
order by Количество;
select *
from book;
--2.2.7
SELECT b.author_id, SUM(amount) AS sum_amount
FROM book b
GROUP BY b.author_id;
SELECT MAX(sum_amount) AS max_sum_amount
FROM (SELECT b.author_id, SUM(amount) AS sum_amount
      FROM book b
      GROUP BY b.author_id) query_in;
SELECT name_author, SUM(amount) as Количество
FROM author a
         INNER JOIN book b
                    on a.author_id = b.author_id
GROUP BY name_author;
SELECT name_author, SUM(amount) as Количество
FROM author a
         INNER JOIN book b
                    on a.author_id = b.author_id
GROUP BY name_author
HAVING SUM(amount) =
       (/* вычисляем максимальное из общего количества книг каждого автора */
           SELECT MAX(sum_amount) AS max_sum_amount
           FROM (/* считаем количество книг каждого автора */
                    SELECT author_id, SUM(amount) AS sum_amount
                    FROM book
                    GROUP BY author_id) query_in --обязательно задать имя, в противном случае не работает
       );
select *
from genre;
select *
from author;
select *
from book;
update book
set genre_id = 3
where book_id = 2
go
update book
set genre_id = 1
where book_id = 7;
--отбираем только тех авторов у которых количество жанров не превышает 1
select name_author
from (--вычисляем общее количество жанров каждого автора
         select name_author, count(name_author) AS Количество_Жанров
         from (--объединяем книги одинаковых жанров по авторам
                  select a.name_author, count(name_genre) AS book_same_genre
                  from genre g
                           inner join book b on g.genre_id = b.genre_id
                           inner join author a on b.author_id = a.author_id
                  group by a.name_author, name_genre) one
         group by name_author) two
group by name_author, Количество_Жанров
having Количество_Жанров = 1;
select *
from book;
--2.2.8
update book
set amount = 10
where book_id = 8
go
select *
from book;
insert into book (title, author_id, genre_id, price, amount)
values ('Герой нашего времени', 5, 3, 570.59, 2),
       ('Доктор Живаго', 4, 3, 740.5, 5)
go
select *
from book;
SELECT top 1 b.genre_id, SUM(amount) AS sum_amount
FROM book b
GROUP BY b.genre_id
ORDER BY sum_amount DESC;
select *
from genre;
select *
from author;
select *
from book;
SELECT query_in_1.genre_id
FROM (/* выбираем код жанра и количество произведений, относящихся к нему */
         SELECT b.genre_id, SUM(amount) AS sum_amount
         FROM book b
         GROUP BY b.genre_id) query_in_1
         INNER JOIN
     (/* выбираем запись, в которой указан код жанр с максимальным количеством книг */
         SELECT top 1 b.genre_id, SUM(amount) AS sum_amount
         FROM book b
         GROUP BY b.genre_id
         ORDER BY sum_amount DESC) query_in_2
     ON query_in_1.sum_amount = query_in_2.sum_amount;
SELECT name_author, name_genre
FROM author
         INNER JOIN book b ON author.author_id = b.author_id
         INNER JOIN genre ON b.genre_id = genre.genre_id
GROUP BY name_author, name_genre, genre.genre_id
HAVING genre.genre_id IN
       (/* выбираем автора, если он пишет книги в самых популярных жанрах*/
           SELECT query_in_1.genre_id
           FROM ( /* выбираем код жанра и количество произведений, относящихся к нему */
                    SELECT genre_id, SUM(amount) AS sum_amount
                    FROM book
                    GROUP BY genre_id) query_in_1
                    INNER JOIN
                ( /* выбираем запись, в которой указан код жанр с максимальным количеством книг */
                    SELECT top 1 genre_id, SUM(amount) AS sum_amount
                    FROM book
                    GROUP BY genre_id
                    ORDER BY sum_amount DESC) query_in_2
                ON query_in_1.sum_amount = query_in_2.sum_amount);

select *
from genre;
select *
from author;
select *
from book;
drop table book, genre, author
go
create table genre
(
    genre_id   int primary key identity (1, 1),
    name_genre varchar(30)
)
go
create table author
(
    author_id   int primary key identity (1, 1),
    name_author varchar(50)
)
go
insert into genre(name_genre)
values ('Роман'),
       ('Поэзия'),
       ('Приключения')
go
insert into author (name_author)
values ('Булгаков М.А.'),
       ('Достоевский Ф.М.'),
       ('Есенин С.А.'),
       ('Пастернак Б.Л.'),
       ('Лермонтов М.Ю.')
go
create table book
(
    book_id   INT PRIMARY KEY identity (1,1),
    title     varchar(50),
    author_id int not null,
    genre_id  int,
    price     decimal(8, 2),
    amount    int,
    foreign key (author_id) references author (author_id) on delete cascade,
    foreign key (genre_id) references genre (genre_id) on delete set null
)
go
insert into book(title, author_id, genre_id, price, amount)
values ('Мастер и Маргарита', 1, 1, 670.99, 3),
       ('Белая гвардия', 1, 1, 540.50, 5),
       ('Братья Карамазовы', 2, 1, 799.01, 3),
       ('Игрок', 2, 1, 480.50, 10),
       ('Стихотворения и поэмы', 3, 2, 650.00, 15),
       ('Черный человек', 3, 2, 570.20, 6),
       ('Лирика', 4, 2, 518.99, 10),
       ('Идиот', 2, 1, 460.00, 10),
       ('Герой нашего времени', 5, 3, 570.59, 2),
       ('Доктор Живаго', 4, 3, 740.50, 5)
go
select *
from book;

select title, name_author, name_genre, price, amount
from book b
         inner join genre g on b.genre_id = g.genre_id
         inner join author a on b.author_id = a.author_id
group by title, name_author, name_genre, price, amount, g.genre_id
having g.genre_id in
       (select one.genre_id
        from (SELECT b.genre_id, SUM(amount) AS sum_amount
              FROM book b
              GROUP BY b.genre_id) one
                 inner join
             (SELECT top 1 SUM(amount) AS sum_amount
              FROM book b
              GROUP BY b.genre_id
              order by b.genre_id) two
             on one.sum_amount = two.sum_amount)
order by title;
--2.2.9
SELECT title, name_author, a.author_id /* явно указать таблицу - обязательно */
FROM author a
         INNER JOIN book b
                    ON a.author_id = b.author_id;
/*SELECT title, name_author, author_id /* имя таблицы, из которой берется author_id, указывать не обязательно*/
FROM
    author INNER JOIN book
        USING(author_id);*/ -- в MS SQL не работает
select *
from supply;
select *
from book;

drop table book, genre, author
go
create table supply
(
    supply_id INT PRIMARY KEY identity (1,1),
    title     varchar(50),
    author    varchar(50),
    price     decimal(8, 2),
    amount    int
)
go
insert into supply(title, author, price, amount)
values ('Доктор Живаго', 'Пастернак Б.Л.', 618.99, 3),
       ('Черный человек', ' Есенин С.А.', 570.20, 6),
       ('Евгений Онегин', 'Пушкин А.С.', 440.80, 5),
       ('Идиот', 'Достоевский Ф.М.', 360.80, 3)
go
create table author
(
    author_id   int primary key identity (1, 1),
    name_author varchar(50)
)
go
insert into author (name_author)
values ('Булгаков М.А.'),
       ('Достоевский Ф.М.'),
       ('Есенин С.А.'),
       ('Пастернак Б.Л.'),
       ('Лермонтов М.Ю.')
go
create table book
(
    book_id   INT PRIMARY KEY identity (1,1),
    title     varchar(50),
    author_id int not null,
    genre_id  int,
    price     decimal(8, 2),
    amount    int,
    foreign key (author_id) references author (author_id) on delete cascade
)
go
insert into book(title, author_id, genre_id, price, amount)
values ('Мастер и Маргарита', 1, 1, 670.99, 3),
       ('Белая гвардия', 1, 1, 540.50, 5),
       ('Идиот', 2, 1, 460.00, 10),
       ('Братья Карамазовы', 2, 1, 799.01, 3),
       ('Игрок', 2, 1, 480.50, 10),
       ('Стихотворения и поэмы', 3, 2, 650.00, 15),
       ('Черный человек', 3, 2, 570.20, 6),
       ('Лирика', 4, 2, 518.99, 10)
go
select *
from supply;
select *
from author;
select *
from book;

select b.title as Название, a.name_author as Автор, (b.amount) + (s.amount) as Количество
from book b
         inner join author a
                    on b.author_id = a.author_id
         inner join supply s
                    on b.title = s.title
group by b.title, a.name_author, b.amount, s.amount
having b.title in
       (select one.title
        from (select s.title, s.price
              from supply s
                       inner join book b
                                  on s.title = b.title
              group by s.title, s.price) one
                 inner join
             (select b.title, b.price
              from book b
                       inner join supply s
                                  on b.price = s.price
              group by b.title, b.price) two
             on one.title = two.title)
order by b.title;
--2.3.1
select *
from author;
select *
from genre;
select *
from book;
select *
from supply;
drop table if exists book,genre,author,supply
go
create table genre
(
    genre_id   int primary key identity (1, 1),
    name_genre varchar(30)
)
go
create table author
(
    author_id   int primary key identity (1, 1),
    name_author varchar(50)
)
go
create table supply
(
    supply_id INT PRIMARY KEY identity (1,1),
    title     varchar(50),
    author    varchar(50),
    price     decimal(8, 2),
    amount    int
)
go
create table book
(
    book_id   INT PRIMARY KEY identity (1,1),
    title     varchar(50),
    author_id int not null,
    genre_id  int,
    price     decimal(8, 2),
    amount    int,
    foreign key (author_id) references author (author_id) on delete cascade,
    foreign key (genre_id) references genre (genre_id) on delete set null
)
go
insert into genre(name_genre)
values ('Роман'),
       ('Поэзия'),
       ('Приключения')
go
insert into author (name_author)
values ('Булгаков М.А.'),
       ('Достоевский Ф.М.'),
       ('Есенин С.А.'),
       ('Пастернак Б.Л.'),
       ('Лермонтов М.Ю.')
go
insert into supply(title, author, price, amount)
values ('Доктор Живаго', 'Пастернак Б.Л.', 380.80, 4),
       ('Черный человек', 'Есенин С.А.', 570.20, 6),
       ('Белая гвардия', 'Булгаков М.А.', 540.50, 7),
       ('Идиот', 'Достоевский Ф.М.', 360.80, 3),
       ('Стихотворения и поэмы', 'Лермонтов М.Ю.', 255.90, 4),
       ('Остров сокровищ', 'Стивенсон Р.Л.', 599.99, 5)
go
insert into book(title, author_id, genre_id, price, amount)
values ('Мастер и Маргарита', 1, 1, 670.99, 3),
       ('Белая гвардия', 1, 1, 540.50, 5),
       ('Идиот', 2, 1, 460.00, 10),
       ('Братья Карамазовы', 2, 1, 799.01, 3),
       ('Игрок', 2, 1, 480.50, 10),
       ('Стихотворения и поэмы', 3, 2, 650.00, 15),
       ('Черный человек', 3, 2, 570.20, 6),
       ('Лирика', 4, 2, 518.99, 2)
go
select *
from author;
select *
from genre;
select *
from book;
select *
from supply;
--2.3.2☺☻♥♦♣♠•◘○
update b
set b.amount = b.amount + s.amount--,
    --s.amount = 0
from book b
         inner join author a ON a.author_id = b.author_id
         inner join supply s ON b.title = s.title
    and s.author = a.name_author
where b.price = s.price
go
update s
set --b.amount = b.amount + s.amount--,
    s.amount = 0
from book b--только для MSSQL
         inner join author a ON a.author_id = b.author_id--только в MSSQL join после set, from
         inner join supply s ON b.title = s.title
    and s.author = a.name_author
where b.price = s.price
go
update b
set b.price = (b.price * b.amount +
               s.price * s.amount) / (b.amount + s.amount)
from book b
         inner join author a ON a.author_id = b.author_id
         inner join supply s ON b.title = s.title
    and s.author = a.name_author
where b.price <> s.price;

SELECT *
FROM book;
SELECT *
FROM supply;
SELECT *
FROM author;
--2.3.3
SELECT name_author, supply.author
FROM author
         RIGHT JOIN supply ON author.name_author = supply.author;

SELECT supply.author
FROM author
         RIGHT JOIN supply on author.name_author = supply.author
WHERE name_author IS Null;

insert into author(name_author)
SELECT supply.author
FROM author
         RIGHT JOIN supply on author.name_author = supply.author
WHERE name_author IS Null;
select *
from author;
--2.3.4
create procedure ClearTables as
begin
    drop table if exists book,genre,author,supply
end;
    create procedure GenreCreation as
    begin
        create table genre
        (
            genre_id   int primary key identity (1, 1),
            name_genre varchar(30)
        )
    end;
        create procedure AuthorCreation as
        begin
            create table author
            (
                author_id   int primary key identity (1, 1),
                name_author varchar(50)
            )
        end;
            create procedure SupplyCreation as
            begin
                create table supply
                (
                    supply_id INT PRIMARY KEY identity (1,1),
                    title     varchar(50),
                    author    varchar(50),
                    price     decimal(8, 2),
                    amount    int
                )
            end;
                create procedure BookCreation as
                begin
                    create table book
                    (
                        book_id   INT PRIMARY KEY identity (1,1),
                        title     varchar(50),
                        author_id int not null,
                        genre_id  int,
                        price     decimal(8, 2),
                        amount    int,
                        foreign key (author_id) references author (author_id) on delete cascade,
                        foreign key (genre_id) references genre (genre_id) on delete set null
                    )
                end;
                    create procedure GenreInsertion as
                    begin
                        insert into genre(name_genre)
                        values ('Роман'),
                               ('Поэзия'),
                               ('Приключения')
                    end;
                        drop procedure AuthorInsertion
                        create procedure AuthorInsertion as
                        begin
                            insert into author (name_author)
                            values ('Булгаков М.А.'),
                                   ('Достоевский Ф.М.'),
                                   ('Есенин С.А.'),
                                   ('Пастернак Б.Л.'),
                                   ('Лермонтов М.Ю.'),
                                   ('Стивенсон Р.Л.')
                        end;
                            drop procedure SupplyInsertion
                            create procedure SupplyInsertion as
                            begin
                                insert into supply(title, author, price, amount)
                                values ('Доктор Живаго', 'Пастернак Б.Л.', 380.80, 4),
                                       ('Черный человек', 'Есенин С.А.', 570.20, 6),
                                       ('Белая гвардия', 'Булгаков М.А.', 540.50, 7),
                                       ('Идиот', 'Достоевский Ф.М.', 360.80, 3),
                                       ('Стихотворения и поэмы', 'Лермонтов М.Ю.', 255.90, 4),
                                       ('Остров сокровищ', 'Стивенсон Р.Л.', 599.99, 5)
                            end;
                                drop procedure BookInsertion
                                create procedure BookInsertion as
                                begin
                                    insert into book(title, author_id, genre_id, price, amount)
                                    values ('Мастер и Маргарита', 1, 1, 670.99, 3),
                                           ('Белая гвардия', 1, 1, 540.50, 12),
                                           ('Идиот', 2, 1, 437.11, 13),
                                           ('Братья Карамазовы', 2, 1, 799.01, 3),
                                           ('Игрок', 2, 1, 480.50, 10),
                                           ('Стихотворения и поэмы', 3, 2, 650.00, 15),
                                           ('Черный человек', 3, 2, 570.20, 12),
                                           ('Лирика', 4, 2, 518.99, 2),
                                           ('Доктор Живаго', 4, 1, 380.80, 4),
                                           ('Стихотворения и поэмы', 5, 2, 255.90, 4),
                                           ('Остров сокровищ', 6, 3, 599.99, 5)
                                end;
                                    exec ClearTables
go
exec GenreCreation
go
exec AuthorCreation
go
exec SupplyCreation
go
exec BookCreation
go
exec GenreInsertion
go
exec AuthorInsertion
go
exec SupplyInsertion
go
exec BookInsertion;
select *
from author;
select *
from genre;
select *
from book;
select *
from supply;

SELECT title, author_id, price, amount
FROM author
         INNER JOIN supply ON author.name_author = supply.author;
SELECT title, author_id, price, amount
FROM author
         INNER JOIN supply ON author.name_author = supply.author
WHERE amount <> 0;

insert into book(title, author_id, price, amount)
select title, author_id, price, amount
from author
         inner join supply
                    on author.name_author = supply.author
where amount <> 0;
select *
from book;
--2.3.5
UPDATE book
SET genre_id = 1
WHERE book_id = 9;

SELECT *
FROM book;
UPDATE book
SET genre_id =
        (SELECT genre_id
         FROM genre
         WHERE name_genre = 'Роман')
WHERE book_id = 9;

SELECT *
FROM book;

update book
set genre_id = (select genre_id
                from genre
                where name_genre = 'Поэзия')
where title like 'Стихотворения и поэмы';
update book
set genre_id = (select genre_id
                from genre
                where name_genre = 'Приключения')
where title like 'Остров сокровищ';
--2.3.6
DELETE
FROM author
WHERE name_author LIKE 'Д%';
SELECT *
FROM author;
SELECT *
FROM book;

exec ClearTables
go
exec GenreCreation
go
exec AuthorCreation
go
exec SupplyCreation
go
exec BookCreation
go
exec GenreInsertion
go
exec AuthorInsertion
go
exec SupplyInsertion
go
exec BookInsertion;
select *
from author;
select *
from genre;
select *
from book;
select *
from supply;

delete
from book
where amount < 20;

delete
from author
where author_id in (select b.author_id
                    from book b
                    group by b.author_id
                    having sum(amount) < 20);
--2.3.7
DELETE
FROM genre
WHERE name_genre LIKE '%я';
SELECT *
FROM genre;
SELECT *
FROM book;

delete
from genre
where genre_id = (select distinct b.genre_id
                  from book b
                  group by b.genre_id
                  having count(b.title) <= 2);
select *
from genre;
select *
from book;
--2.3.8
DELETE
FROM author USING
    author
    INNER JOIN book
ON author.author_id = book.author_id
WHERE book.amount < 3;
SELECT *
FROM author;
SELECT *
FROM book;
SELECT *
FROM supply;
SELECT *
FROM genre;

DELETE
FROM author USING
    author
    INNER JOIN book
ON author.author_id = book.author_id
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE name_genre = 'Поэзия';
--2.3.9
select *
from book;
--2.4.4
--delete procedures
drop procedure if exists ClearTables24, GenreCreation24, GenreInsertion24, AuthorCreation24, AuthorInsertion24,
    BookCreation24, BookInsertion24, CityCreation24, CityInsertion24, ClientCreation24, ClientInsertion24,
    StepCreation24, StepInsertion24, BuyCreation24, BuyInsertion24, Buy_stepCreation24,
    Buy_stepInsertion24, Buy_bookCreation24, Buy_bookInsertion24
go
--delete tables
create procedure ClearTables24 as
begin
drop table if exists genre,author, book, city, client, buy, step, buy_book, buy_step
end go

--genre
create procedure GenreCreation24 as
begin
create table genre
(
    genre_id   int primary key identity,
    name_genre varchar(30)
)
end go

create procedure GenreInsertion24 as
begin
insert into genre(name_genre)
values ('Роман'),
       ('Поэзия'),
       ('Приключения')
end go

--author
create procedure AuthorCreation24 as
begin
create table author
(
    author_id   int primary key identity,
    name_author varchar(50)
)
end go

create procedure AuthorInsertion24 as
begin
insert into author(name_author)
values ('Булгаков М.А.'),
       ('Достоевский Ф.М.'),
       ('Есенин С.А.'),
       ('Пастернак Б.Л.'),
       ('Лермонтов М.Ю.')
end go

--book
create procedure BookCreation24 as
begin
create table book
        (
        book_id   int primary key identity,
        title     varchar(50),
        author_id int not null,
        genre_id  int,
        price     decimal(8, 2),
        amount    int,
        --constraint "FK_book_author"
        foreign key (author_id) references author (author_id) on delete cascade,
        --constraint "FK_book_genre"
        foreign key (genre_id) REFERENCES genre (genre_id) on delete set null
        )
end go

create procedure BookInsertion24 as
begin
insert into book(title, author_id, genre_id, price, amount)
values ('Мастер и Маргарита', 1, 1, 670.99, 3),
       ('Белая гвардия', 1, 1, 540.50, 5),
       ('Идиот', 2, 1, 460.00, 10),
       ('Братья Карамазовы', 2, 1, 799.01, 2),
       ('Игрок', 2, 1, 480.50, 10),
       ('Стихотворения и поэмы', 3, 2, 650.00, 15),
       ('Черный человек', 3, 2, 570.20, 6),
       ('Лирика', 4, 2, 518.99, 2)
end go

--city
create procedure CityCreation24 as
begin
create table city
        (
        city_id       int primary key identity,
        name_city     varchar(30),
        days_delivery int
        )
end go
create procedure CityInsertion24 as
begin
insert into city(name_city,days_delivery)
values ('Москва', 5),
       ('Санкт-Петербург', 3),
       ('Владивосток', 12)
end go

--client
/*CREATE EXTENSION IF NOT EXISTS citext;
DROP DOMAIN IF EXISTS email;
CREATE DOMAIN email AS citext
CHECK ( value ~
'^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );*/
create procedure ClientCreation24 as
begin
create table client
       (
       client_id   int primary key identity,
       name_client varchar(50),
       city_id     int,
       email       varchar(30),
       --CONSTRAINT "FK_client_city"
       foreign key (city_id) references city (city_id)
       )
end go

create procedure ClientInsertion24 as
begin
insert into client(name_client, city_id, email)
values ('Баранов Павел', 3, 'baranov@test'),
       ('Абрамова Катя', 1, 'abramova@test'),
       ('Семенонов Иван', 2, 'semenov@test'),
       ('Яковлева Галина', 1, 'yakovleva@test')
end go

--buy
create procedure BuyCreation24 as
begin
create table buy
        (
        buy_id          int primary key identity,
        buy_description varchar(100),
        client_id       int default (null),
        --CONSTRAINT "FK_buy_client"
        foreign key (client_id) references client (client_id)
        )
end go

create procedure BuyInsertion24 as
begin
insert into buy (buy_description, client_id)
values ('Доставка только вечером', 1),
       (NULL, 3),
       ('Упаковать каждую книгу по отдельности', 2),
       (NULL, 1)
end go

---step
create procedure StepCreation24 as
begin
create table step
        (
        step_id   int primary key identity,
        name_step varchar(30)
        )
end go

create procedure StepInsertion24 as
begin
insert into step(name_step)
values ('Оплата'),
       ('Упаковка'),
       ('Транспортировка'),
       ('Доставка')
end go

--buy_book
create procedure Buy_bookCreation24 as
begin
create table buy_book
        (
        buy_book_id int primary key identity,
        buy_id      int,
        book_id     int,
        amount      int,
        --CONSTRAINT "FK_buy_book_buy"
        foreign key (buy_id) references buy (buy_id),
        --CONSTRAINT "FK_buy_book_book"
        foreign key (book_id) references book (book_id)
        )
end go

create procedure Buy_bookInsertion24 as
begin
insert into buy_book(buy_id, book_id, amount)
values (1, 1, 1),
       (1, 7, 2),
       (2, 8, 2),
       (3, 3, 2),
       (3, 2, 1),
       (3, 1, 1),
       (4, 5, 1)
end go

--buy_step
create procedure Buy_stepCreation24 as
begin
create table buy_step
        (
        buy_step_id   int primary key identity,
        buy_id        int,
        step_id       int,
        date_step_beg date,
        date_step_end date,
        --CONSTRAINT "FK_buy_step_buy"
        foreign key (buy_id) references buy (buy_id),
        --CONSTRAINT "FK_buy_step_step"
        foreign key (step_id) references step (step_id)
        )
end go

create procedure Buy_stepInsertion24 as
begin
insert into buy_step(buy_id, step_id, date_step_beg, date_step_end)
values (1, 1, '2020-02-20', '2020-02-20'),
       (1, 2, '2020-02-20', '2020-02-21'),
       (1, 3, '2020-02-22', '2020-03-07'),
       (1, 4, '2020-03-08', '2020-03-08'),
       (2, 1, '2020-02-28', '2020-02-28'),
       (2, 2, '2020-02-29', '2020-03-01'),
       (2, 3, '2020-03-02', null),
       (2, 4, null, null),
       (3, 1, '2020-03-05', '2020-03-05'),
       (3, 2, '2020-03-05', '2020-03-06'),
       (3, 3, '2020-03-06', '2020-03-10'),
       (3, 4, '2020-03-11', null),
       (4, 1, '2020-03-20', null),
       (4, 2, null, null),
       (4, 3, null, null),
       (4, 4, null, null)
end;

exec ClearTables24 go exec GenreCreation24 go exec AuthorCreation24 go exec BookCreation24
go exec CityCreation24 go exec ClientCreation24 go exec BuyCreation24 go exec StepCreation24
go exec Buy_bookCreation24 go exec Buy_stepCreation24 go exec GenreInsertion24 go exec
AuthorInsertion24 go exec BookInsertion24 go exec CityInsertion24 go exec ClientInsertion24
go exec BuyInsertion24 go exec StepInsertion24 go exec Buy_bookInsertion24 go exec
Buy_stepInsertion24;
