--3.3.2
/* Вывести образовательные программы, на которые для поступления необходим предмет «Информатика».
   Программы отсортировать в обратном алфавитном порядке.*/
select name_program
from program
inner join program_subject ps on program.program_id = ps.program_id
inner join subject s on s.subject_id = ps.subject_id
where name_subject like 'Информатика'
order by 1 desc;

select * from program;
select * from program_subject;
select * from subject;
