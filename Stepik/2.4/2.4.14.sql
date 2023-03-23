--2.4.14
--buy_archive
drop procedure if exists Buy_archiveCreation24;
drop table if exists buy_archive;
create procedure Buy_archiveCreation24 as
begin
    create table buy_archive
    (
        buy_archive_id      int primary key identity,
        buy_id              int,
        client_id           int,
        book_id             int,
        date_payment        date,
        price               decimal(8, 2),
        amount              int
    )
end go
drop procedure if exists Buy_archiveInsertion24;
create procedure Buy_archiveInsertion24 as
begin
    insert into buy_archive(buy_id, client_id, book_id, date_payment, price, amount)
    values (2, 1, 1, '2019-02-21', 670.60,2),
           (2, 1, 3, '2019-02-21',450.90,1),
           (1, 2, 2, '2019-02-10',520.30,2),
           (1, 2, 4, '2019-02-10',780.90,3),
           (1, 2, 3, '2019-02-10',450.90,1),
           (3, 4, 4, '2019-03-05',780.90,4),
           (3, 4, 5, '2019-03-05',480.90,2),
           (4, 1, 6, '2019-03-12',650.00,1),
           (5, 2, 1, '2019-03-18',670.60,2),
           (5, 2, 4, '2019-03-18',780.90,1)
end;
/*Сравнить ежемесячную выручку от продажи книг за текущий и предыдущий годы. Для этого вывести год,
месяц, сумму выручки в отсортированном сначала по возрастанию месяцев, затем по возрастанию лет виде.
Название столбцов: Год, Месяц, Сумма.*/

select distinct year(bs.date_step_end)              as Год,
                datename(month, bs.date_step_end)   as Месяц,
                sum(price*bb.amount)                as Сумма
from buy_step bs
    inner join buy b on b.buy_id = bs.buy_id
    inner join buy_book bb on b.buy_id = bb.buy_id
    inner join book b2 on bb.book_id = b2.book_id
where year(bs.date_step_end) is not null and step_id = 1
group by year(bs.date_step_end), datename(month, bs.date_step_end)
--order by Месяц, Год

    union

Select Год, Месяц, sum(Сумма)
    from (select year(date_payment)            as Год,
                 datename(month, date_payment) as Месяц,
                 sum(price * amount)           as Сумма
          from buy_archive
          group by date_payment
          ) as temp
group by Год, Месяц
order by Месяц desc, Год;

select * from buy_book;
select * from buy_archive;
select * from step;
