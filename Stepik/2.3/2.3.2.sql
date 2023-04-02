--2.3.2☺☻♥♦♣♠•◘○
/*Для книг, которые уже есть на складе (в таблице book), но по другой цене,
  чем в поставке (supply),  необходимо в таблице book увеличить количество на значение,
  указанное в поставке,  и пересчитать цену. А в таблице  supply обнулить количество этих книг.
  Формула для пересчета цены:
price= (p1*k1+p2*k2)/(k1+k2)
где  p1, p2 - цена книги в таблицах book и supply;
       k1, k2 - количество книг в таблицах book и supply.*/
/*Пересчитываться должна цена только одной книги Достоевского «Идиот», 
  для этой же книги увеличится количество в таблице book и обнулится количество в таблице supply.*/
update b
set b.amount = b.amount + s.amount--,
    --s.amount = 0
from book b
         inner join author a ON a.author_id = b.author_id
         inner join supply s ON b.title = s.title
    and s.author = a.name_author
where b.price = s.price
go
update s
set --b.amount = b.amount + s.amount--,
    s.amount = 0
from book b--только для MSSQL
         inner join author a ON a.author_id = b.author_id--только в MSSQL join после set, from
         inner join supply s ON b.title = s.title
    and s.author = a.name_author
where b.price = s.price
go
update b
set b.price = (b.price * b.amount +
               s.price * s.amount) / (b.amount + s.amount)
from book b
         inner join author a ON a.author_id = b.author_id
         inner join supply s ON b.title = s.title
    and s.author = a.name_author
where b.price <> s.price;

SELECT * FROM book;
SELECT * FROM supply;
SELECT * FROM author;
