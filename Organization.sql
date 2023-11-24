select organization_name, organization_id from Organization;

drop procedure if exists GetOrganizationRefresh;
create procedure GetOrganizationRefresh
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(organization_name) as organization_name, organization_id from Organization
end
go

exec GetOrganizationRefresh;

alter table Organization
    drop constraint PK_Organization_organization_inn;

alter table Organization drop constraint PK_Organization_organization_id
go

alter table Organization
	add constraint PK_Organization_organization_id
		primary key nonclustered (organization_id)
go

alter table Organization alter column organization_inn varchar(12) not null;

select * from Organization;
