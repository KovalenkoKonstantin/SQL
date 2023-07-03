drop procedure if exists GOZCreation;
create procedure GOZCreation as
begin
create table GOZ
(
    goz_id          int primary key identity (1,1),
    financing_id    int,
    company_id      int,
    cipher_id       int,
    year_id         int,
    expenditures_id int,
    goz_value       float
        foreign key (financing_id) references financing(financing_id) on delete cascade,
        foreign key (company_id) references company(company_id) on delete cascade,
        foreign key (cipher_id) references cipher (cipher_id) on delete cascade,
        foreign key (year_id) references year (year_id) on delete cascade,
        foreign key (expenditures_id) references expenditures (expenditures_id) on delete cascade
)
end;
execute GOZCreation;

drop procedure if exists GOZInsertion;
create procedure GOZInsertion as
begin
insert into GOZ(financing_id, company_id, cipher_id, year_id, expenditures_id, goz_value)
values
end;
exec GOZInsertion;


select * from GOZ;