--2.2.4
/*Вывести информацию о книгах (жанр, книга, автор), относящихся к жанру, включающему слово
  «роман» в отсортированном по названиям книг виде.*/
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
