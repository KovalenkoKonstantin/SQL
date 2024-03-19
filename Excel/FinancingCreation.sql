create procedure FinancingCreation as
begin
    create table financing
    (
        financing_id   int primary key identity (1,1),
        type_of_financing varchar(50)
    )
end;
go

