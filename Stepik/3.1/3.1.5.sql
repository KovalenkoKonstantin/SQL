--3.1.5
/*Если студент совершал несколько попыток по одной и той же дисциплине, то вывести разницу в днях
между первой и последней попыткой. В результат включить фамилию и имя студента, название дисциплины
и вычисляемый столбец Интервал. Информацию вывести по возрастанию разницы. Студентов, сделавших одну
попытку по дисциплине, не учитывать. */
select name_student,
       name_subject,
       datediff(day,min(date_attempt), max(date_attempt)) as Интервал
from attempt
         inner join student s
                    on s.student_id = attempt.student_id
         inner join subject s2 on s2.subject_id = attempt.subject_id
group by name_student, name_subject
having count(attempt.student_id) > 1
order by 3;

select * from student;
select * from attempt;
select * from subject;
