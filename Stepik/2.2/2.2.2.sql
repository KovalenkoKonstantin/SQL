--2.2.2
/*Вывести все жанры, которые не представлены в книгах на складе.*/
SELECT name_author, title
FROM author a
         LEFT JOIN book b
                   ON a.author_id = b.author_id
ORDER BY name_author;

select name_genre
from book b
         right join genre g on b.genre_id = g.genre_id
where title is null
select name_genre
from genre g
         left join book b on g.genre_id = b.genre_id
where title is null
