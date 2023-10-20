drop table if exists Contractors;
create table Contractors
(
    contractor_id        int primary key identity (1,1),
    cod_UPP              varchar(15),
    contractor_inn       varchar(12),
    contractor_name      varchar(50),
    contractor_full_name varchar(150)
);

insert into Contractors(cod_UPP, contractor_inn, contractor_name, contractor_full_name)
values ('F00004694', '7729361030', 'Актив-софт (Рутокен)', 'Акционерное общество "Актив-софт"'),
       ('G00013215', '7717621364', 'Цифровой комфорт', 'ООО "Цифровой комфорт"'),
       ('G00134526', '7726387713', 'Линия защиты', 'Общество с ограниченной ответственностью "Линия защиты"'),
       ('G00146901', '7813618950', 'ООО "Авесто"', 'ООО "Авесто"');

select *
from Contractors;

update Contractors
set contractor_inn = '7714434221'
where contractor_inn = '7726387713';

select contractor_name, contractor_full_name,
       contractor_inn, cod_UPP, contractor_id from Contractors;