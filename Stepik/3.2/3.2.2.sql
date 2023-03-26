--3.2.2
/*Случайным образом выбрать три вопроса (запрос) по дисциплине, тестирование по которой собирается
  проходить студент, занесенный в таблицу attempt последним, и добавить их в таблицу testing.
  id последней попытки получить как максимальное значение id из таблицы attempt.*/

insert into testing(attempt_id, question_id)
select top 3 attempt_id, question_id
from attempt
         inner join question q on attempt.subject_id = q.subject_id
where attempt_id = (select max(attempt_id)
                    from attempt)
order by rand();
--limit 3;

select * from testing;
select * from attempt;
