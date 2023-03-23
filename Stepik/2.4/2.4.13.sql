/*Вывести жанр (или жанры), в котором было заказано больше всего экземпляров книг,
указать это количество. Последний столбец назвать Количество.*/
select name_genre, Количество
from (
         select name_genre, sum(foo) as Количество
         from (select book_id, sum(amount) as foo
               from buy_book
               group by book_id) as temp1
                  inner join book b on temp1.book_id = b.book_id
                  inner join genre g on g.genre_id = b.genre_id
         group by g.name_genre
     ) as FirstStep
where Количество =
      (
          select max(Количество) as max from
              (
                  select sum(bb.amount) as Количество
                  from buy_book bb
                           inner join book b on bb.book_id = b.book_id
                           inner join genre g on g.genre_id = b.genre_id
                  group by g.name_genre
              ) as temp2
      );
--вспомогательные
select * from buy_book;
select * from book;--1,2,3,4,5
select * from genre;--1
/*Определяем количество по жанрам из заказанных книг*/
select sum(bb.amount) as Количество
from buy_book bb
inner join book b on bb.book_id = b.book_id
inner join genre g on g.genre_id = b.genre_id
group by g.name_genre;
/*Добавляем имя жанра*/
select name_genre, sum(foo) as Количество
from (select book_id, sum(amount) as foo
      from buy_book
      group by book_id) as temp1
         inner join book b on temp1.book_id = b.book_id
         inner join genre g on g.genre_id = b.genre_id
group by g.name_genre;
/*Определение максимального количества заказанных книг*/
select max(Количество) as max from
    (
      select sum(bb.amount) as Количество
      from buy_book bb
               inner join book b on bb.book_id = b.book_id
               inner join genre g on g.genre_id = b.genre_id
      group by g.name_genre
    ) as temp2;
