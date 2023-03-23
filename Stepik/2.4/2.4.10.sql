--2.4.10
/*Вывести номера заказов (buy_id) и названия этапов,  на которых они в данный момент находятся. 
Если заказ доставлен –  информацию о нем не выводить. Информацию отсортировать по возрастанию 
buy_id.*/
select buy_id, name_step
from step
inner join buy_step bs on step.step_id = bs.step_id
where date_step_end is null and date_step_beg is not null
order by buy_id;

select * from buy_book;
select * from buy_step;
select * from step;
