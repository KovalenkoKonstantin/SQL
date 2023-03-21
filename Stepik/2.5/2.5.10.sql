--2.5.10
/*Завершить этап «Оплата» для заказа с номером 5, вставив в столбец date_step_end дату 13.04.2020,
и начать следующий этап («Упаковка»), задав в столбце date_step_beg для этого этапа ту же дату.*/
update buy_step
set date_step_end = '2020-04-13'
where buy_id = 5 and step_id = 1;

update buy_step
set date_step_beg = '2020-04-13'
where buy_id = 5 and step_id = (SELECT step_id + 1
                                FROM step
                                WHERE name_step = 'Оплата');
