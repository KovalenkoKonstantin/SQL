select * from city;
select * from buy;
select * from buy_step;
/*В таблице city для каждого города указано количество дней,
за которые заказ может быть доставлен в этот город (рассматривается только этап Транспортировка).
Для тех заказов, которые прошли этап транспортировки, вывести количество дней за которое заказ
реально доставлен в город. А также, если заказ доставлен с опозданием, указать количество дней
задержки, в противном случае вывести 0. В результат включить номер заказа (buy_id), а также
вычисляемые столбцы Количество_дней и Опоздание. Информацию вывести в отсортированном по номеру
заказа виде.*/
select b.buy_id, datediff(day, bs.date_step_beg, bs.date_step_end) as Количество_дней,
       iif(datediff(day, bs.date_step_beg, bs.date_step_end)>ci.days_delivery,
           datediff(day, bs.date_step_beg, bs.date_step_end)-ci.days_delivery,
           0) as Опоздание
from city ci
inner join client c on ci.city_id = c.city_id
inner join buy b on c.client_id = b.client_id
inner join buy_step bs on b.buy_id = bs.buy_id
inner join step s on s.step_id = bs.step_id
where bs.step_id=3 and bs.date_step_end is not null
order by b.buy_id
