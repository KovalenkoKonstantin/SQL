--3.3.9
/*Вывести образовательные программы, на которые для поступления необходимы предмет «Информатика»
  и «Математика» в отсортированном по названию программ виде.*/
select distinct temp1.name_program
from (select name_program
      from program
               inner join program_subject ps on program.program_id = ps.program_id
               inner join subject s on s.subject_id = ps.subject_id
      where name_subject like 'Информатика') temp1
         cross APPLY
     (select name_program
      from program
               inner join program_subject ps on program.program_id = ps.program_id
               inner join subject s on s.subject_id = ps.subject_id
      where name_subject like 'Математика') temp2
order by 1 asc;

select * from program_subject;
select * from subject;
