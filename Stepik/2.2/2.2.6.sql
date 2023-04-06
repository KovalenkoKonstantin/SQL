--2.2.6
/*Посчитать количество экземпляров  книг каждого автора из таблицы author.  
  Вывести тех авторов,  количество книг которых меньше 10, в отсортированном по возрастанию 
  количества виде. Последний столбец назвать Количество.*/
select name_author, sum(amount) as Количество
from author a
         left join book b
                   on a.author_id = b.author_id
group by name_author
having sum(amount) < 10
    or sum(amount) is null
order by Количество;
select *
from book;
