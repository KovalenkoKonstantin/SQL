create procedure GetOrganization
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(organization_name) as organization_name, organization_id, organization_inn from Organization
end
go

