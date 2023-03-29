--3.4.5
/*Поскольку при добавлении дополнительных баллов, абитуриенты по каждой образовательной программе
  могут следовать не в порядке убывания суммарных баллов, необходимо создать новую таблицу
  applicant_order на основе таблицы applicant. При создании таблицы данные нужно отсортировать
  сначала по id образовательной программы, потом по убыванию итогового балла. А таблицу applicant,
  которая была создана как вспомогательная, необходимо удалить.*/

--create table applicant_order as /*for MYSQL*/
select program_id, enrollee_id, itog
into applicant_order /* For TSQL*/
from applicant
order by 1, 3 desc; --does not work for TSQL

select * from applicant
order by 1, 3 desc;

drop table if exists applicant;
