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
/*Если в таблицах supply  и book есть одинаковые книги, которые имеют равную цену,
  вывести их название и автора, а также посчитать общее количество экземпляров книг
  в таблицах supply и book,  столбцы назвать Название, Автор  и Количество.*/
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
