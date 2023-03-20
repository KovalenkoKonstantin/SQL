--2.5.8
/*В таблицу buy_step для заказа с номером 5 включить все этапы из таблицы step,
которые должен пройти этот заказ. В столбцы date_step_beg и date_step_end всех записей занести Null.*/
insert into buy_step(buy_id, step_id)
select buy_id, step_id
from step
    cross join buy b
where buy_id = 5;

select * from buy_step;
select * from step;
select * from buy;
