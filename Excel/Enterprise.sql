drop procedure if exists EnterpriseCreation;
create procedure EnterpriseCreation as
begin
create table Enterprise
(
    enterprise_id   int primary key identity (1,1),
    financing_id    int,
    company_id      int,
--     cipher_id       int,
    year_id         int,
    expenditures_id int,
    enterprise_value       float
        foreign key (financing_id) references financing(financing_id) on delete cascade,
        foreign key (company_id) references company(company_id) on delete cascade,
--         foreign key (cipher_id) references cipher (cipher_id) on delete cascade,
        foreign key (year_id) references year (year_id) on delete cascade,
        foreign key (expenditures_id) references expenditures (expenditures_id) on delete cascade
)
end;
execute EnterpriseCreation;

drop procedure if exists EnterpriseInsertion;
create procedure EnterpriseInsertion as
begin
insert into Enterprise(financing_id, company_id, year_id, expenditures_id, enterprise_value)
values
end;
exec EnterpriseInsertion;

select * from Enterprise;