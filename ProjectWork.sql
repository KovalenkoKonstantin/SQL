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