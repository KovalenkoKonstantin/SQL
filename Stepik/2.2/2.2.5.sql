--2.2.5
/*Вывести информацию о книгах (жанр, книга, автор), относящихся к жанру, включающему слово 
  «роман» в отсортированном по названиям книг виде.*/
SELECT name_author, count(title) AS Количество
FROM author
         INNER JOIN book b
                    on author.author_id = b.author_id
GROUP BY name_author
ORDER BY name_author;
SELECT name_author, count(title) AS Количество
FROM author
         LEFT JOIN book b
                   on author.author_id = b.author_id
GROUP BY name_author
ORDER BY name_author;
