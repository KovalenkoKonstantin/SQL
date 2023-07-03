drop procedure if exists FinancingCreation;
create procedure FinancingCreation as
begin
    create table financing
    (
        financing_id   int primary key identity (1,1),
        type_of_financing varchar(50)
    )
end;
execute FinancingCreation;

drop procedure if exists FinancingInsertion;
create procedure FinancingInsertion as
begin
    insert into financing (type_of_financing)
    values ('Государственный оборонный заказ'),
           ('Коммерческая деятельность компании')
end;
execute FinancingInsertion;

select * from financing;


