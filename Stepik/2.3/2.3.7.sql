--2.3.7
DELETE
FROM genre
WHERE name_genre LIKE '%я';
SELECT * FROM genre;
SELECT * FROM book;
/*Удалить все жанры, к которым относится меньше 4-х книг. В таблице book для этих жанров установить 
  значение Null.*/
delete
from genre
where genre_id = (select distinct b.genre_id
                  from book b
                  group by b.genre_id
                  having count(b.title) <= 2);
select * from genre;
select * from book;
