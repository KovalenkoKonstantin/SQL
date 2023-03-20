--2.5.7
/*Создать общий счет (таблицу buy_pay) на оплату заказа с номером 5.
Куда включить номер заказа, количество книг в заказе (название столбца Количество)
и его общую стоимость (название столбца Итого).  Для решения используйте ОДИН запрос.*/
drop table if exists buy_pay
go
select buy_id, Количество, Итого
into buy_pay
from(
    select buy_id, sum(Количество) as Количество, sum(Итого) as Итого
    from
        (
            select buy_id, sum(bb.amount) as Количество, sum(bb.amount)*b.price as Итого
            from buy_book bb
            inner join book b on bb.book_id = b.book_id
            where  buy_id = 5
            group by buy_id, b.price
        ) as temp
    group by buy_id
) as temp2
go
select * from buy_pay;
