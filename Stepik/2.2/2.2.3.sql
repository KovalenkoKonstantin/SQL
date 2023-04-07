--2.2.3
/*Необходимо в каждом городе провести выставку книг каждого автора в течение 2020 года. 
  Дату проведения выставки выбрать случайным образом. Создать запрос, который выведет город, 
  автора и дату проведения выставки. Последний столбец назвать Дата. Информацию вывести, 
  отсортировав сначала в алфавитном порядке по названиям городов, а потом по убыванию дат 
  проведения выставок.*/
SELECT name_author, name_genre
FROM author,
     genre;
create table city
(
    city_id   int primary key identity (1,1),
    name_city varchar(30)
)
go
insert into city(name_city)
values ('Москва'),
       ('Санкт-Петербург'),
       ('Владивосток')
go
select *
from city;

select name_city, name_author, dateadd(day, floor(rand() * 365), '2020-01-01') as Дата
from city,
     author
order by name_city, Дата desc;
