--2.5.1
--delete procedures
drop procedure if exists ClearTables24, GenreCreation24, GenreInsertion24, AuthorCreation24, AuthorInsertion24,
        BookCreation24, BookInsertion24, CityCreation24, CityInsertion24, ClientCreation24, ClientInsertion24,
        StepCreation24, StepInsertion24, BuyCreation24, BuyInsertion24, Buy_stepCreation24,
        Buy_stepInsertion24, Buy_bookCreation24, Buy_bookInsertion24, Buy_archiveCreation24, Buy_archiveInsertion24
go
--delete tables
create procedure ClearTables24 as
begin
    drop table if exists buy_book,buy_step,book, genre,author, buy,client,city, step, buy_archive
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
        foreign key (author_id) references author (author_id) on delete cascade,
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
    values (N'Москва', 5),
           (N'Санкт-Петербург', 3),
           (N'Владивосток', 12)
end go

--client
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
    values (N'Баранов Павел', 3, 'baranov@test'),
           (N'Абрамова Катя', 1, 'abramova@test'),
           (N'Семенонов Иван', 2, 'semenov@test'),
           (N'Яковлева Галина', 1, 'yakovleva@test')
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
    values (N'Доставка только вечером', 1),
           (NULL, 3),
           (N'Упаковать каждую книгу по отдельности', 2),
           (NULL, 1)
end go

--step
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
    values (N'Оплата'),
           (N'Упаковка'),
           (N'Транспортировка'),
           (N'Доставка')
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
           (1, 3, 1),
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
        foreign key (buy_id) references buy (buy_id),
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
end go

--buy_archive
drop table if exists buy_archive;
create procedure Buy_archiveCreation24 as
begin
    create table buy_archive
    (
        buy_archive_id      int primary key identity,
        buy_id              int,
        client_id           int,
        book_id             int,
        date_payment        date,
        price               decimal(8, 2),
        amount              int
    )
end go
drop procedure if exists Buy_archiveInsertion24;
create procedure Buy_archiveInsertion24 as
begin
    insert into buy_archive(buy_id, client_id, book_id, date_payment, price, amount)
    values (2, 1, 1, '2019-02-21', 670.60,2),
           (2, 1, 3, '2019-02-21',450.90,1),
           (1, 2, 2, '2019-02-10',520.30,2),
           (1, 2, 4, '2019-02-10',780.90,3),
           (1, 2, 3, '2019-02-10',450.90,1),
           (3, 4, 4, '2019-03-05',780.90,4),
           (3, 4, 5, '2019-03-05',480.90,2),
           (4, 1, 6, '2019-03-12',650.00,1),
           (5, 2, 1, '2019-03-18',670.60,2),
           (5, 2, 4, '2019-03-18',780.90,1)
end;

--creation
exec ClearTables24 go exec GenreCreation24 go exec AuthorCreation24 go exec BookCreation24
go exec CityCreation24 go exec ClientCreation24 go exec BuyCreation24 go exec StepCreation24
go exec Buy_bookCreation24 go exec Buy_stepCreation24 go exec GenreInsertion24 go exec
AuthorInsertion24 go exec BookInsertion24 go exec CityInsertion24 go exec ClientInsertion24
go exec BuyInsertion24 go exec StepInsertion24 go exec Buy_bookInsertion24; go exec
Buy_stepInsertion24 go exec Buy_archiveCreation24 go exec Buy_archiveInsertion24

--check
select * from genre;
select * from author;
select * from city;
select * from client;
select * from book;
select * from step;
select * from buy;
select * from buy_step;
select * from buy_book;
select * from buy_archive
