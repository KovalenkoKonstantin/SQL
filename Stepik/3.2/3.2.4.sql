--3.2.4
/*Удалить из таблицы attempt все попытки, выполненные раньше 1 мая 2020 года.
  Также удалить и все соответствующие этим попыткам вопросы из таблицы testing.*/
delete from attempt
where date_attempt < '2020-05-01';

select * from attempt;
select * from testing;
