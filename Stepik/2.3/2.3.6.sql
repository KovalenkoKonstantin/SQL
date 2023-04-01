--2.3.6
/*Удалить всех авторов и все их книги, общее количество книг которых меньше 20.*/
DELETE
FROM author
WHERE name_author LIKE 'Д%';
SELECT * FROM author;
SELECT * FROM book;

exec ClearTables go exec GenreCreation go exec AuthorCreation go exec SupplyCreation go exec BookCreation
go exec GenreInsertion go exec AuthorInsertion go exec SupplyInsertion go exec BookInsertion;
select * from author;
select * from genre;
select * from book;
select * from supply;

delete
from book
where amount < 20;

delete
from author
where author_id in (select b.author_id
                    from book b
                    group by b.author_id
                    having sum(amount) < 20);
