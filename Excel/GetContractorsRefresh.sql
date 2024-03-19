create procedure GetContractorsRefresh
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select contractor_name, contractor_full_name,
       contractor_inn, cod_UPP, contractor_id from Contractors
end
go

