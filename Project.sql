
        insert into Project([1C_kod_project], project_cipher, start_date, end_date, tab_N)
        values ('00-00-00061', 'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+unlim)',
                '2023-01-01', '2023-12-31', '000000762'),
               ('00-00-00063', 'Программно-аппаратный комплекс ViPNet Coordinator HW100 C 4.x (+unlim)', '2023-01-01',
                '2023-12-31', '000000762'),
               ('00-00-00065', 'Программно-аппаратный комплекс ViPNet Coordinator HW100 C 4.x (+WiFi)(+unlim)',
                '2023-01-01', '2023-12-31', '000000762'),
               ('00-00-00067', 'Программно-аппаратный комплекс ViPNet Coordinator HW100 C 4.x (+3G)(+unlim)',
                '2023-01-01', '2023-12-31', '000000762'),
               ('00-00-00068', 'Программно-аппаратный комплекс ViPNet Coordinator HW1000 4.x', '2023-01-01',
                '2023-12-31', '000000762'),
               ('00-00-00069', 'Программно-аппаратный комплекс ViPNet Coordinator HW1000 C 4.x', '2023-01-01',
                '2023-12-31', '000000762'),
               ('00-00-00070', 'Программно-аппаратный комплекс ViPNet Coordinator HW1000 D 4.x', '2023-01-01',
                '2023-12-31', '000000762'),
               ('00-00-00071', 'Программно-аппаратный комплекс ViPNet Coordinator HW2000 4.x (платформа HW2000 Q5)',
                '2023-01-01', '2023-12-31', '000000762'),
               ('00-00-00072', 'Программно-аппаратный комплекс ViPNet Coordinator HW5000 4.x (платформа HW5000 Q2)',
                '2023-01-01', '2023-12-31', '000000762'),
               ('00-00-00073', 'Программно-аппаратный комплекс ViPNet Coordinator KB 4 (Исп. KB100)', '2023-01-01',
                '2023-12-31', '000000762'),
               ('00-00-00074', 'Программно-аппаратный комплекс ViPNet Coordinator KB 4 (Исп. KB1000)', '2023-01-01',
                '2023-12-31', '000000762'),
               ('00-00-00075',
                'Программно-аппаратный комплекс ViPNet Coordinator KB 4 (Исп. KB2000) (платформа KB2000 Q5)',
                '2023-01-01', '2023-12-31', '000000762'),
               ('00-00-00076',
                'Программно-аппаратный комплекс ViPNet Coordinator KB 4 (Исп. KB5000) (платформа KB5000 Q2)',
                '2023-01-01', '2023-12-31', '000000762');


select tab_N from Employee
        where employee_name like 'Стенечкина%';

        select *
        from Employee order by employee_name asc;

insert into Project([1C_kod_project], project_cipher, start_date, end_date, tab_N)
        values ('00-00-00086', 'ПАК ViPNet Coordinator HW2000 4.x с предустановленным ПО ViPNet Administrator 4.x (KC2)', '2023-01-01', '2023-12-31', '000000762');

        select * from Project
where [1C_kod_project] = '00-00-00100';

update Project
set tab_N = '000000001'
where [1C_kod_project] = '00-00-00100';

        select [1C_kod_project], project_cipher, project_id from Project;

drop procedure if exists GetProjectRefresh;
create procedure GetProjectRefresh
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select [1C_kod_project], project_cipher, project_id from Project
end
go

exec GetProjectRefresh;

insert into Project([1C_kod_project], project_cipher, start_date, end_date, tab_N)
values ('00-00-00045', 'Улей-23', '2023-07-27', '2023-10-31','000000001');

SELECT tab_N from Employee
where employee_name like 'Авраменко%ч';

select [1C_kod_project], project_cipher, start_date, end_date, tab_N from Project
where tab_N = '000000001 ';

update Project
set tab_N = '000000001 '
where tab_N = '000000001';

select tab_N, employee_name from Employee
where employee_name like 'Стенечкина%';

insert into Project([1C_kod_project], project_cipher, start_date, end_date, tab_N)
values ('00-00-00101', N'Поставка программно-аппаратного комплекса Network-VPN', '2023-01-01', '2023-12-31','000000762 ');

select * from Project
where [1C_kod_project] = '00-00-00101';

update Project
set project_cipher = N'Поставка программно-аппаратного комплекса ViPNetwork, шифр "Дружба"'
where [1C_kod_project] = '00-00-00101'

insert into Project([1C_kod_project], project_cipher, start_date, end_date, tab_N)
values ('00-00-00055', N'Поставка программно-аппаратного комплекса Network-VPN', '2023-01-01', '2023-12-31','000000762 ');

select * from Project
where [1C_kod_project] = '00-00-00055';

insert into Project([1C_kod_project], project_cipher, start_date, end_date, tab_N)
values ('00-00-00093', N'ПАК ViPNet Coordinator HW1000 4.x с проведением СПиСИ', '2023-01-01', '2023-12-31','000000001 ');

insert into Project([1C_kod_project], project_cipher, start_date, end_date, tab_N)
values ('00-00-00090', N'ПАК ViPNet Coordinator HW100 C 4.x (+unlim) с проведением СПиСИ', '2023-01-01', '2023-12-31','000000001 ');

exec sp_rename 'Project.project_id', [1C_kod_project], 'COLUMN';

alter table Project
    drop constraint PK_Project_project_id;

exec sp_rename 'Project.genuine_project_id', project_id, 'COLUMN';

exec sp_rename 'PK_Project_genuine_project_id', PK_Project_project_id, 'OBJECT';

alter table Project
    drop constraint PK_Project_project_id;

create unique index Project_project_id_uindex
	on Project (project_id);

alter table Project
	add constraint Project_pk
		primary key nonclustered (project_id);

exec sp_rename 'Project_pk', PK_Project_project_id, 'OBJECT';

select * from Project;

alter table Project
    drop constraint FK_Project_tab_N;

alter table Project alter column tab_N varchar(10);

alter table Project
	add constraint FK_Project_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from Project;