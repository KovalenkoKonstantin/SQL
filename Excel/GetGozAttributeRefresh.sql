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

