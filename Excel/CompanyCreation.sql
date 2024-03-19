create procedure CompanyCreation as
begin
    create table company
    (
        company_id   int primary key identity (1,1),
        company_name varchar(30),
        company_full_name varchar(100)
    )
end;
go

