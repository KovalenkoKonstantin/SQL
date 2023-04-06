--2.2.5
/*Посчитать количество экземпляров  книг каждого автора из таблицы author.
  Вывести тех авторов,  количество книг которых меньше 10, в отсортированном по возрастанию
  количества виде. Последний столбец назвать Количество.*/
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
