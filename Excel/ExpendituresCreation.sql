create procedure ExpendituresCreation as
begin
create table expenditures
(
    expenditures_id   int primary key identity (1,1),
    expenditures_name varchar(100)
)
end;
go

