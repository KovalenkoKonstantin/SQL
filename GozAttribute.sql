drop table if exists GozAttribute;
drop procedure if exists GozAttributeCreation;
create procedure GozAttributeCreation as
begin
    create table GozAttribute
    (
        goz_attribute_id   int identity (1,1)
            constraint PK_GozAttribute_goz_attribute_id
                primary key nonclustered,
        goz_attribute_name varchar(10)
    )
end;
    execute GozAttributeCreation;

    drop procedure if exists GozAttributeInsertion;
    create procedure GozAttributeInsertion as
    begin
        insert into GozAttribute(goz_attribute_name)
        values ('ГОЗ'),
               ('Не ГОЗ')
    end;
        exec GozAttributeInsertion;

    select *
    from GozAttribute;

drop procedure if exists GetGozAttributeRefresh;
create procedure GetGozAttributeRefresh
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select *
    from GozAttribute
end
go

exec GetGozAttributeRefresh;