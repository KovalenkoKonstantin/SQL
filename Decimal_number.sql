drop table if exists DecimalNumbers;
create table DecimalNumbers
(
    decimal_number_id int primary key identity (1,1),
    decimal_number    varchar(50)
);
insert into DecimalNumbers(decimal_number)
values ('ФРКЕ.00130-03-00-02'),
       ('ФРКЕ.00130-03-04-02'),
       ('ФРКЕ.00130-03-04-03'),
       ('ФРКЕ.00130-03-04-04'),
       ('ФРКЕ.00130-03-05-03'),
       ('ФРКЕ.00130-03-06-01'),
       ('ФРКЕ.00130-03-07-01'),
       ('ФРКЕ.00130-03-08-03'),
       ('ФРКЕ.00130-03-09-01'),
       ('ФРКЕ.465614.001-02'),
       ('ФРКЕ.465614.001-05'),
       ('ФРКЕ.465614.001-06'),
       ('ФРКЕ.465614.001-07');

insert into DecimalNumbers(decimal_number)
values ('ФРКЕ.00130-03-08-03-01');