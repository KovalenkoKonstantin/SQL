--3.1.4
/*Вывести студентов (различных студентов), имеющих максимальные результаты попыток .
Информацию отсортировать в алфавитном порядке по фамилии студента.*/
select name_student, result
from student
         inner join attempt a on student.student_id = a.student_id
where result =
      (select max(result)
       from attempt)
order by name_student;
