--3.3.5
/*Вывести образовательные программы, для которых минимальный балл ЕГЭ по каждому предмету
  больше или равен 40 баллам. Программы вывести в отсортированном по алфавиту виде.*/
select name_program
from program
inner join program_subject ps on program.program_id = ps.program_id
--where ps.min_result>=40
group by name_program
having min(ps.min_result) >= 40
order by 1 asc;

select * from program_subject;

select min(min_result) min_result
from program_subject;
