create procedure GetProjectRefresh_SP
@index as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select [1C_kod_project], project_cipher, project_id from Project
        inner join Employee E on Project.tab_N = E.tab_N
        where organization_id = @index
end
go

