drop procedure if exists YearCreation;
create procedure YearCreation as
begin
    create table year
    (
        year_id     int primary key identity (1,1),
        year_number int
    )
end;
execute YearCreation;

drop procedure if exists YearInsertion;
create procedure YearInsertion as
begin
insert into year (year_number)
values (2021),
       (2022),
       (2023),
       (2024)
end;
execute YearInsertion;

select * from year;