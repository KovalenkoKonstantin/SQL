--2.2.7
/*Вывести в алфавитном порядке всех авторов, которые пишут только в одном жанре. 
  Поскольку у нас в таблицах так занесены данные, что у каждого автора книги только в одном жанре,  
  для этого запроса внесем изменения в таблицу book. Пусть у нас  книга Есенина «Черный человек» 
  относится к жанру «Роман», а книга Булгакова «Белая гвардия» к «Приключениям» 
  (эти изменения в таблицы уже внесены).*/
SELECT b.author_id, SUM(amount) AS sum_amount
FROM book b
GROUP BY b.author_id;
SELECT MAX(sum_amount) AS max_sum_amount
FROM (SELECT b.author_id, SUM(amount) AS sum_amount
      FROM book b
      GROUP BY b.author_id) query_in;
SELECT name_author, SUM(amount) as Количество
FROM author a
         INNER JOIN book b
                    on a.author_id = b.author_id
GROUP BY name_author;
SELECT name_author, SUM(amount) as Количество
FROM author a
         INNER JOIN book b
                    on a.author_id = b.author_id
GROUP BY name_author
HAVING SUM(amount) =
       (/* вычисляем максимальное из общего количества книг каждого автора */
           SELECT MAX(sum_amount) AS max_sum_amount
           FROM (/* считаем количество книг каждого автора */
                    SELECT author_id, SUM(amount) AS sum_amount
                    FROM book
                    GROUP BY author_id) query_in --обязательно задать имя, в противном случае не работает
       );
select *
from genre;
select *
from author;
select *
from book;
update book
set genre_id = 3
where book_id = 2
go
update book
set genre_id = 1
where book_id = 7;
--отбираем только тех авторов у которых количество жанров не превышает 1
select name_author
from (--вычисляем общее количество жанров каждого автора
         select name_author, count(name_author) AS Количество_Жанров
         from (--объединяем книги одинаковых жанров по авторам
                  select a.name_author, count(name_genre) AS book_same_genre
                  from genre g
                           inner join book b on g.genre_id = b.genre_id
                           inner join author a on b.author_id = a.author_id
                  group by a.name_author, name_genre) one
         group by name_author) two
group by name_author, Количество_Жанров
having Количество_Жанров = 1;
select *
from book;
