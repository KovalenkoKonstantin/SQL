--2.5.9
/*В таблицу buy_step занести дату 12.04.2020 выставления счета на оплату заказа с номером 5.*/
update buy_step
set date_step_beg = '2020-04-12'
where buy_id = 5 and step_id = 1;
