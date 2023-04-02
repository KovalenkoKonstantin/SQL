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
go exec GenreCreation go exec AuthorCreation go exec SupplyCreation go exec BookCreation
go exec GenreInsertion go exec AuthorInsertion go exec SupplyInsertion go exec BookInsertion;
select * from author;
select * from genre;
select * from book;
select * from supply;

SELECT title, author_id, price, amount
FROM author
         INNER JOIN supply ON author.name_author = supply.author;
SELECT title, author_id, price, amount
FROM author
         INNER JOIN supply ON author.name_author = supply.author
WHERE amount <> 0;
/*Добавить новые книги из таблицы supply в таблицу book на основе сформированного выше запроса. 
  Затем вывести для просмотра таблицу book.*/
insert into book(title, author_id, price, amount)
select title, author_id, price, amount
from author
         inner join supply
                    on author.name_author = supply.author
where amount <> 0;
select * from book;
