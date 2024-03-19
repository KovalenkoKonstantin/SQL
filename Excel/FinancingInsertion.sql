create procedure FinancingInsertion as
begin
    insert into financing (type_of_financing)
    values ('Государственный оборонный заказ'),
           ('Коммерческая деятельность компании')
end;
go

