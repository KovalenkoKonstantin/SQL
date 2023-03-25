--3.1.8
/*Вывести вопросы, которые были включены в тест для Семенова Ивана по дисциплине «Основы SQL» 2020-05-17
  (значение attempt_id для этой попытки равно 7). Указать, какой ответ дал студент и правильный
  он или нет(вывести Верно или Неверно). В результат включить вопрос, ответ и вычисляемый столбец
  Результат*/
select name_question, name_answer, iif(is_correct = 1, 'Верно', 'Неверно') as Результат
from question
         inner join testing t on question.question_id = t.question_id
         inner join answer a on t.answer_id = a.answer_id
--inner join attempt a2 on a2.attempt_id = t.attempt_id
--inner join student s on s.student_id = a2.student_id
--inner join subject s2 on s2.subject_id = a2.subject_id
--where name_student like 'Семенов Иван' and name_subject like 'Основы SQL' and date_attempt='2020-05-17';
where t.attempt_id = 7;
