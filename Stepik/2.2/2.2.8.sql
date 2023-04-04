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
/* Вывести информацию о книгах (название книги, фамилию и инициалы автора, название жанра, 
   цену и количество экземпляров книг), написанных в самых популярных жанрах, 
   в отсортированном в алфавитном порядке по названию книг виде. Самым популярным считать жанр, 
   общее количество экземпляров книг которого на складе максимально.*/
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
