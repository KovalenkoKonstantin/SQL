--3.3.2
/*Вывести абитуриентов, которые хотят поступать на образовательную программу
  «Мехатроника и робототехника» в отсортированном по фамилиям виде.*/
select name_enrollee
from enrollee
inner join program_enrollee pe on enrollee.enrollee_id = pe.enrollee_id
inner join program p on p.program_id = pe.program_id
where name_program like 'Мехатроника и робототехника'
order by 1;

select * from program;
