--3.3.10
/*Посчитать количество баллов каждого абитуриента на каждую образовательную программу,
  на которую он подал заявление, по результатам ЕГЭ. В результат включить название образовательной
  программы, фамилию и имя абитуриента, а также столбец с суммой баллов, который назвать itog.
  Информацию вывести в отсортированном сначала по образовательной программе, а потом по убыванию
  суммы баллов виде.*/
select name_program, name_enrollee, sum(result) itog
from enrollee
inner join program_enrollee pe on enrollee.enrollee_id = pe.enrollee_id
inner join program p on p.program_id = pe.program_id
inner join program_subject ps on p.program_id = ps.program_id
inner join subject s on s.subject_id = ps.subject_id
inner join enrollee_subject es on es.subject_id = s.subject_id
and es.enrollee_id = enrollee.enrollee_id
group by name_program, name_enrollee
order by 1, 3 desc;
