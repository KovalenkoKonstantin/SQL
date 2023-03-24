--2.4.9
/*Вывести информацию о каждом заказе: его номер, кто его сформировал (фамилия пользователя) и его стоимость 
(сумма произведений количества заказанных книг и их цены), в отсортированном по номеру заказа виде. 
Последний столбец назвать Стоимость.*/
select b.buy_id,c.name_client, sum(bb.amount*b2.price) as Стоимость
from client c
inner join buy b on c.client_id = b.client_id
inner join buy_book bb on b.buy_id = bb.buy_id
inner join book b2 on bb.book_id = b2.book_id
group by b.buy_id, c.name_client
order by b.buy_id;
