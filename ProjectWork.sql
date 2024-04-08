alter table ProjectWork
    add genuine_project_id int;

alter table ProjectWork
	add constraint FK_ProjectWork_genuine_project_id
		foreign key (project_id) references Project (project_id);

update ProjectWork
set project_id =
        (
            select [1C_kod_project]
            from Project
            where ProjectWork.project_id = Project.[1C_kod_project]
        );

select * from ProjectWork;

alter table ProjectWork
    drop constraint FK_ProjectWork_project_id;

alter table ProjectWork
    drop column project_id;

exec sp_rename 'ProjectWork.genuine_project_id', project_id, 'COLUMN';

exec sp_rename 'FK_ProjectWork_genuine_project_id', FK_ProjectWork_project_id, 'OBJECT';

alter table ProjectWork
    drop constraint FK_ProjectWork_project_id;

alter table ProjectWork
	add constraint FK_ProjectWork_project_id
		foreign key (project_id) references Project (project_id);

alter table ProjectWork
    drop constraint FK_ProjectWork_tab_N;

alter table ProjectWork alter column tab_N varchar(10) not null;

alter table ProjectWork
	add constraint FK_ProjectWork_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from ProjectWork;

alter table ProjectWork
    drop constraint FK_ProjectWork_tab_N
go

alter table ProjectWork
	add GUID nvarchar(36)
go

alter table ProjectWork
	add constraint FK_ProjectWork_GUID
		foreign key (GUID) references Employee (GUID)
go

select * from ProjectWork
inner join Employee E on ProjectWork.GUID = E.GUID
inner join Organization O on E.organization_id = O.organization_id
where ProjectWork.tab_N = '0000000222';


update ProjectWork
set ProjectWork.organization_id = Employee.organization_id
from Employee
where ProjectWork.GUID = Employee.GUID

select month_name, year_number,
       project_hours, employee_name,
       ProjectWork.organization_id,
       project_cipher
from ProjectWork
inner join Year Y on ProjectWork.year_id = Y.year_id
inner join Month M on ProjectWork.month_id = M.month_id
inner join Employee E on ProjectWork.GUID = E.GUID
inner join Project P on ProjectWork.project_id = P.project_id
where ProjectWork.organization_id = 9
and year_number = 2024;

drop procedure if exists GetProJectWork
create procedure GetProjectWork
            @organization_id as integer,
            @year_number as integer
        as
begin
select month_name, year_number,
       project_hours, employee_name,
       ProjectWork.organization_id,
       project_cipher
from ProjectWork
inner join Year Y on ProjectWork.year_id = Y.year_id
inner join Month M on ProjectWork.month_id = M.month_id
inner join Employee E on ProjectWork.GUID = E.GUID
inner join Project P on ProjectWork.project_id = P.project_id
where ProjectWork.organization_id = @organization_id
and year_number >= @year_number
end

execute GetProJectWork 9, 2024;

exec sp_addextendedproperty 'MS_Description', 'Часы отнесённые на проекты', 'SCHEMA', 'dbo', 'TABLE', 'ProjectWork'
go

select * from ProjectWork
inner join Employee E on ProjectWork.GUID = E.GUID
inner join Month M on ProjectWork.month_id = M.month_id
inner join Year Y on ProjectWork.year_id = Y.year_id
inner join Project P on ProjectWork.project_id = P.project_id;

select * from ProjectWork
inner join Project P on ProjectWork.project_id = P.project_id
where year_id = 24
and [1C_kod_project] = '00-00-00150';

delete from ProjectWork
where project_id = 6534;

delete from ProjectWork
where tab_N = '0000000194';

select * from ProjectWork
inner join Employee E on ProjectWork.GUID = E.GUID
where employee_name = 'Байдельдинова Айнагуль Джабраиловна';

select * from ProjectWork
where year_id = 24
and organization_id = 9;