# SQL
Let's begin

/*CREATE TABLE genre(
    genre_id INT identity (1, 1) primary key,
    name_genre VARCHAR(30)
);*/

/*CREATE TABLE book(
    book_id INT identity (1, 1) primary key,
    title VARCHAR(50),
    author varchar(30),
    price decimal(8,2),
    amount int
);*/

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
