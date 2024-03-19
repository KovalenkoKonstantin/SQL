create procedure EnterpriseCreation as
begin
    create table Enterprise
    (
        organization_id  int
            constraint FK_Enterprise_organization_id
                references Organization,
        goz_attribute_id int
            constraint FK_Enterprise_goz_attribute_id
                references GozAttribute,
        project_id       int
            constraint FK_Enterprise_project_id
                references Project,
        year_id          int
            constraint FK_Enterprise_year_id
                references Year (year_id),
        expenditures_id  int
            constraint FK_Enterprise_expenditures_id
                references Expenditures,
        enterprise_value float
    )
end;
go

