--3.3.8
/*Выведите сколько человек подало заявление на каждую образовательную программу и конкурс на нее
  (число поданных заявлений деленное на количество мест по плану), округленный до 2-х знаков после
  запятой. В запросе вывести название факультета, к которому относится образовательная программа,
  название образовательной программы, план набора абитуриентов на образовательную программу (plan),
  количество поданных заявлений (Количество) и Конкурс. Информацию отсортировать в порядке убывания
  конкурса.*/
select name_department, name_program, [plan], count(enrollee_id) Количество,
    round(count(enrollee_id)/[plan],2) Конкурс
from department
inner join program p on department.department_id = p.department_id
inner join program_enrollee pe on p.program_id = pe.program_id
group by name_department, p.name_program, p.[plan]
order by 5 desc;
