--2.4.15
SELECT name_client, MIN(YEAR(first_payment)) AS Год
FROM
    (
        SELECT name_client, MIN(date_payment) AS first_payment
        FROM
            buy_archive
                INNER JOIN client c on c.client_id = buy_archive.client_id
GROUP BY  name_client
UNION
SELECT name_client, MIN(date_step_end)
FROM
    buy
        INNER JOIN client c on c.client_id = buy.client_id
        INNER JOIN buy_step bs on buy.buy_id = bs.buy_id
GROUP BY name_client
    ) as query_in
GROUP BY name_client
HAVING COUNT(*) = 1
ORDER BY 2;

/*Для каждой отдельной книги необходимо вывести информацию о количестве проданных экземпляров
и их стоимости за 2020 и 2019 год . Вычисляемые столбцы назвать Количество и Сумма. Информацию
отсортировать по убыванию стоимости.*/
select title, sum(Количество) as Количество, sum(Сумма) as Сумма
from (select title, sum(bb.amount) as Количество, sum(price * bb.amount) as Сумма
      from book
            inner join buy_book bb on book.book_id = bb.book_id
            inner join buy bu on bu.buy_id = bb.buy_id
            inner join buy_step bs on bu.buy_id = bs.buy_id
            inner join step s on s.step_id = bs.step_id
      where s.step_id = 1 and bs.date_step_end is not null
      group by title
    union all
      select title, sum(buy_archive.amount) as Количество,
             sum(buy_archive.price*buy_archive.amount) as Сумма
      from buy_archive
      inner join book bk on buy_archive.book_id = bk.book_id
      group by title
      ) as temp
group by title
order by Сумма desc;

select * from book;
select * from buy_book;
select * from buy_step;
select * from step;
select * from buy_archive;
