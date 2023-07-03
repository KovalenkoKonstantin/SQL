drop procedure if exists CommercialCreation;
create procedure CommercialCreation as
begin
create table Commercial
(
    commercial_id          int primary key identity (1,1),
    financing_id    int,
    company_id      int,
    cipher_id       int,
    year_id         int,
    expenditures_id int,
    commercial_value       float
        foreign key (financing_id) references financing(financing_id) on delete cascade,
        foreign key (company_id) references company(company_id) on delete cascade,
        foreign key (cipher_id) references cipher (cipher_id) on delete cascade,
        foreign key (year_id) references year (year_id) on delete cascade,
        foreign key (expenditures_id) references expenditures (expenditures_id) on delete cascade
)
end;
execute CommercialCreation;

drop procedure if exists CommercialInsertion;
create procedure CommercialInsertion as
begin
insert into Commercial(financing_id, company_id, cipher_id, year_id, expenditures_id, commercial_value)
values
end;
exec CommercialInsertion;

drop table Commercial;
select * from GOZ;