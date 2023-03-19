--2.5.2
/*Включить нового человека в таблицу с клиентами. Его имя Попов Илья, 
его email popov@test, проживает он в Москве.*/
insert into client(name_client, city_id, email)
select 'Попов Илья', city_id, 'popov@test'
from city
where city.name_city = 'Москва';
