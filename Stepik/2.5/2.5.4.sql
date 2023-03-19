--2.5.4
select * from genre;
select * from author;
select * from city;
select * from client;
select * from book;
select * from step;
select * from buy;
select * from buy_step;
select * from buy_book;
select * from buy_archive
/*В таблицу buy_book добавить заказ с номером 5. Этот заказ должен содержать книгу 
Пастернака «Лирика» в количестве двух экземпляров и книгу Булгакова «Белая гвардия» 
в одном экземпляре.*/
insert into buy_book(buy_id, book_id, amount)
select buy_id, book_id, 2 as amount
from
(select buy_id
from buy
inner join client c on c.client_id = buy.client_id
where c.name_client like 'Поп%') as buy_id,
(select book_id
from book
where title = 'Лирика') as book_id
go
insert into buy_book(buy_id, book_id, amount)
select buy_id, book_id, 1 as amount
from
(select buy_id
from buy
inner join client c on c.client_id = buy.client_id
where c.name_client like 'Поп%') as buy_id,
(select book_id
from book
where title = 'Белая гвардия') as book_id
go
select * from buy_book;
