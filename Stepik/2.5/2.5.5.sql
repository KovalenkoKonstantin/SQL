--2.5.5
select * from buy;
select * from buy_book;
select * from book;
/*Уменьшить количество тех книг на складе, которые были включены в заказ с номером 5.*/
update book
set amount = amount -
             iif(book_id = 8,
                (select amount
                from buy_book
                where buy_id = 5 and book_id = 8),
                    (select amount
                    from buy_book
                    where buy_id = 5 and book_id = 2))
where book_id in (8, 2);
select * from book;

update book
set book.amount = book.amount - bb.amount
from book
inner join buy_book bb on bb.book_id = book.book_id
where bb.buy_id = 5;
select * from book;
