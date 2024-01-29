alter table EmployeeDynamics
    drop constraint FK_EmployeeDynamics_tab_N;

alter table EmployeeDynamics alter column tab_N varchar(10) not null;

alter table EmployeeDynamics
	add constraint FK_EmployeeDynamics_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from EmployeeDynamics;

alter table EmployeeDynamics
    drop constraint FK_EmployeeDynamics_tab_N
go

alter table EmployeeDynamics
	add GUID nvarchar(36)
go

alter table EmployeeDynamics
	add constraint FK_EmployeeDynamics_GUID
		foreign key (GUID) references Employee (GUID)
go