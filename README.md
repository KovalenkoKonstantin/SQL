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
values ('Мастер и Маргарита','Булгаков М.А.',670.99,3);*/
-- select *from book;

/*insert into book (title, author, price, amount)
values ('Белая гвардия','Булгаков М.А.',540.50,5);
insert into book (title, author, price, amount)
values ('Идиот','Достоевский Ф.М.',460.00,10);
insert into book (title, author, price, amount)
values ('Братья Карамазовы','Достоевский Ф.М.',799.01,2);*/
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

/*insert into book (title, author, price, amount)
values ('Стихотворения и поэмы','Есенин С.А.',650.00,15);
select *from book;*/
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
