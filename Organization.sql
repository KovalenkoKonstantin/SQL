select organization_name, organization_id from Organization;

drop procedure if exists GetOrganizationRefresh;
create procedure GetOrganizationRefresh
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select organization_name, organization_id from Organization
end
go

exec GetOrganizationRefresh;

