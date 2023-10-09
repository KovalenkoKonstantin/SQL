select tab_N from Employee
where employee_name = 'Авраменко Юрий Вячеславович';

alter table Employee
    drop constraint FK_LabourIntensity_project_id;

alter table Employee
	add constraint FK_LabourIntensity_project_id
		foreign key (project_id) references Project (project_id);

alter table Employee
	add organization_id int;

alter table Employee
	add constraint FK_Employee_organization_id
		foreign key (organization_id) references Organization (organization_id);

update Employee
set organization_id =
        (
            select organization_id
            from Organization
            where Organization.organization_inn = Employee.organization_inn
        );

alter table Employee
    drop constraint FK_Employees_organization_inn;

alter table Employee
    drop column organization_inn;

select * from Employee;

alter table Employee
    drop constraint FK_Employee_organization_id;

alter table Employee
	add constraint FK_Employee_organization_id
		foreign key (organization_id) references Organization (organization_id);

select * from Employee;