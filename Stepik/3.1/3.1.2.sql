--3.1.2
/*Вывести студентов, которые сдавали дисциплину «Основы баз данных», указать дату попытки и результат.
Информацию вывести по убыванию результатов тестирования.*/
select distinct name_student, date_attempt, [result]
from student
         inner join attempt a on student.student_id = a.student_id
         inner join subject s on s.subject_id = a.subject_id
where name_subject like 'Основы баз данных'
order by result desc;
