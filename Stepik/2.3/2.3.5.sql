--2.3.5
/* Занести для книги «Стихотворения и поэмы» Лермонтова жанр «Поэзия», а для книги 
   «Остров сокровищ» Стивенсона - «Приключения». (Использовать два запроса).*/
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

SELECT * FROM book;

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
