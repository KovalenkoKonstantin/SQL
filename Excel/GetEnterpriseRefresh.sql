create procedure GetEnterpriseRefresh
@index as integer
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select year_number, expenditures_name, enterprise_value
    from Enterprise
             inner join Expenditures E on Enterprise.expenditures_id = E.expenditures_id
             inner join Year Y on Enterprise.year_id = Y.year_id
    where organization_id = @index;
end
go

