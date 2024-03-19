create procedure GetProjectRefresh
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select [1C_kod_project] as Code_1C,
       rtrim(project_cipher) as project_cipher, project_id,
       [1C_kod_project] as Code_1C from Project
end
go

