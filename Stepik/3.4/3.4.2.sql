--3.4.2
/*Создать вспомогательную таблицу applicant,  куда включить id образовательной программы,
  id абитуриента, сумму баллов абитуриентов (столбец itog) в отсортированном сначала по
  id образовательной программы, а потом по убыванию суммы баллов виде (использовать запрос
  из предыдущего урока).*/
drop table if exists applicant;
--create table applicant as /*for MYSQL*/
select program_id, enrollee_id, itog
into applicant /* For TSQL*/
from (select p.program_id, enrollee.enrollee_id, sum(result) itog
      from enrollee
               inner join program_enrollee pe on enrollee.enrollee_id = pe.enrollee_id
               inner join program p on p.program_id = pe.program_id
               inner join program_subject ps on p.program_id = ps.program_id
               inner join subject s on s.subject_id = ps.subject_id
               inner join enrollee_subject es on es.subject_id = s.subject_id
          and es.enrollee_id = enrollee.enrollee_id
      group by p.program_id, enrollee.enrollee_id) temp
order by 1, 3 desc; --does not work for TSQL
select * from applicant
order by 1, 3 desc;
