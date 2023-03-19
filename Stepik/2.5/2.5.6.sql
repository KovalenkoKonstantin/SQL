--2.5.6
/*Создать счет (таблицу buy_pay) на оплату заказа с номером 5, в который включить
название книг, их автора, цену, количество заказанных книг и  стоимость.
Последний столбец назвать Стоимость. Информацию в таблицу занести в отсортированном
по названиям книг виде*/

--buy_pay
drop table if exists buy_pay;
create procedure Buy_payCreation25 as
begin
    create table buy_pay
    (
        title               varchar(50),
        name_author         varchar(50),
        price               decimal(8, 2),
        amount              int,
        Стоимость           decimal(8, 2),
    )
end go
drop procedure if exists Buy_payInsertion25;
create procedure Buy_payInsertion25 as
begin
insert into buy_pay(title, name_author, price, amount, Стоимость)
select title, name_author, price, bb.amount, price*bb.amount as Стоимость
from book b
    inner join author a on a.author_id = b.author_id
    inner join buy_book bb on b.book_id = bb.book_id
    inner join buy bu on bu.buy_id = bb.buy_id
where bu.buy_id = 5
order by title
end;

select * from buy;
select * from buy_book;
select * from book;
select * from buy_pay;
