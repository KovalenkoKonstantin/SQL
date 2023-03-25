--3.1.9
/*Посчитать результаты тестирования. Результат попытки вычислить как количество правильных ответов,
  деленное на 3 (количество вопросов в каждой попытке) и умноженное на 100. Результат округлить
  до двух знаков после запятой. Вывести фамилию студента, название предмета, дату и результат.
  Последний столбец назвать Результат. Информацию отсортировать сначала по фамилии студента,
  потом по убыванию даты попытки.*/
select name_student, name_subject, date_attempt, round(sum(Результат) * 100 / 3, 2) Результат
from (select name_student,
             name_subject,
             date_attempt,
             iif(is_correct = 1, sum(is_correct), 0) Результат
      from answer
               join testing t on answer.answer_id = t.answer_id
               join attempt a on a.attempt_id = t.attempt_id
               join subject s on s.subject_id = a.subject_id
               join student s2 on s2.student_id = a.student_id
      group by name_student, name_subject, date_attempt, is_correct) temp
group by name_student, name_subject, date_attempt
order by 1, 3 desc;
