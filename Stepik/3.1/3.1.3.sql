--3.1.3
/*Вывести, сколько попыток сделали студенты по каждой дисциплине, а также средний результат попыток,
который округлить до 2 знаков после запятой. Под результатом попытки понимается процент правильных
ответов на вопросы теста, который занесен в столбец result.  В результат включить название дисциплины,
а также вычисляемые столбцы Количество и Среднее. Информацию вывести по убыванию средних результатов.*/
select name_subject, count(student_id) as Количество, ROUND(avg(result), 2) as Среднее
from subject
         left join attempt a on subject.subject_id = a.subject_id
group by name_subject;

select *
from attempt;
select *
from subject;