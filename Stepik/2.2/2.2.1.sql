--2.2.1
/*Вывести название, жанр и цену тех книг, количество которых больше 8, 
  в отсортированном по убыванию цены виде.*/
SELECT title, name_author
FROM author a
         INNER JOIN book b
                    ON a.author_id = b.author_id;
select *
from book;

select title, name_genre, price
from book b
         inner join genre g on b.genre_id = g.genre_id
where amount > 8
order by price desc;
