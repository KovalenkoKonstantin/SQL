create procedure GetExpendituresRefresh
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select expenditures_name, expenditures_id from Expenditures
end
go

