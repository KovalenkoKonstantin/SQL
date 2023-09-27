drop table if exists Enterprise;
drop procedure if exists EnterpriseCreation;
create procedure EnterpriseCreation as
begin
    create table Enterprise
    (
        enterprise_id    int primary key identity (1,1)
            constraint PK_Enterprise_enterprise_id
                primary key nonclustered,
        financing_id     int,
        organization_id  int,
        year_id          int,
        expenditures_id  int,
        enterprise_value float
            foreign key (financing_id) references financing (financing_id) on delete no action,
        foreign key (organization_id) references Organization (organization_id) on delete no action,
        foreign key (year_id) references year (year_id) on delete no action,
        foreign key (expenditures_id) references expenditures (expenditures_id) on delete no action
    )
end;
    execute EnterpriseCreation;

    drop procedure if exists EnterpriseInsertion;
    create procedure EnterpriseInsertion as
    begin
        insert into Enterprise(financing_id, organization_id, year_id, expenditures_id, enterprise_value)
        values
    end;
        exec EnterpriseInsertion;

    select *
    from Enterprise;