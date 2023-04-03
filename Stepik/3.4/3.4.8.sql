--3.4.8
/*Создать таблицу student,  в которую включить абитуриентов, которые могут быть рекомендованы
  к зачислению  в соответствии с планом набора. Информацию отсортировать сначала в алфавитном
  порядке по названию программ, а потом по убыванию итогового балла.*/

--create table student as /*for MYSQL*/
select name_program, e.name_enrollee, itog
into student /* For TSQL*/
from program
inner join applicant_order ao on program.program_id = ao.program_id
inner join enrollee e on ao.enrollee_id = e.enrollee_id
order by 1, 3 desc;

select * from enrollee;
select * from student;
select * from applicant_order;
drop table applicant_order
go
create table applicant_order (
    str_id int,
    program_id int,
    enrollee_id int,
    itog int
)
go
insert into applicant_order (str_id, program_id, enrollee_id, itog)
values (1,1,3,235),
       (2,1,2,226),
       (3,1,1,219),
       (1,2,6,276),
       (2,2,3,235),
       (3,2,2,226),
       (1,3,6,270),
       (2,3,4,239),
       (3,3,5,200),
       (1,4,6,270),
       (2,4,3,247),
       (3,4,5,200);
select * from applicant_order;
select * from program;
select * from student;
drop table if exists student;
--create table student as /*for MYSQL*/
select name_program, e.name_enrollee, itog
into student /* For TSQL*/
from program
         inner join applicant_order ao on program.program_id = ao.program_id
         inner join enrollee e on ao.enrollee_id = e.enrollee_id
where str_id <= [plan]
order by 1, 3 desc;
