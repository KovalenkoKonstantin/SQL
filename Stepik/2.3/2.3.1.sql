--2.3.1
select * from author;
select * from genre;
select * from book;
select * from supply;
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
select * from author;
select * from genre;
select * from book;
select * from supply;
