drop table if exists Contractors;
create table Contractors
(
    contractor_id int primary key identity (1,1),
    cod_UPP varchar(15),
    contractor_inn  varchar(12),
    contractor_name    varchar(50),
    contractor_full_name   varchar(150)
);

insert into Contractors(cod_UPP, contractor_inn, contractor_name, contractor_full_name)
values ('G00134526', '7714434221', 'Линия защиты', 'Общество с ограниченной ответственностью "Линия защиты"'),
       ('G00013215', '7717621364', 'Цифровой комфорт', 'ООО "Цифровой комфорт"'),
       ('F00004694', '7729361030', 'Актив-софт (Рутокен), АО', 'Акционерное общество "Актив-софт"'),
       ('G00146901', '7813618950', '7813618950', 'ООО "Авесто"')

select * from Contractors;