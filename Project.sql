
        insert into Project(project_id, project_cipher, start_date, end_date, tab_N)
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

insert into Project(project_id, project_cipher, start_date, end_date, tab_N)
        values ('00-00-00086', 'ПАК ViPNet Coordinator HW2000 4.x с предустановленным ПО ViPNet Administrator 4.x (KC2)', '2023-01-01', '2023-12-31', '000000762');

        select * from Project
where project_id = '00-00-00100';

update Project
set tab_N = '000000001'
where project_id = '00-00-00100';

select project_id, project_cipher, genuine_project_id from Project;

drop procedure if exists GetProjectRefresh;
create procedure GetProjectRefresh
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select project_id, project_cipher, genuine_project_id from Project
end
go

exec GetProjectRefresh;

insert into Project(project_id, project_cipher, start_date, end_date, tab_N)
values ('00-00-00045', 'Улей-23', '2023-07-27', '2023-10-31','000000001');

SELECT tab_N from Employee
where employee_name like 'Авраменко%ч';

select project_id, project_cipher, start_date, end_date, tab_N from Project
where tab_N = '000000001 ';

update Project
set tab_N = '000000001 '
where tab_N = '000000001';

select tab_N, employee_name from Employee
where employee_name like 'Стенечкина%';

insert into Project(project_id, project_cipher, start_date, end_date, tab_N)
values ('00-00-00101', N'Поставка программно-аппаратного комплекса Network-VPN', '2023-01-01', '2023-12-31','000000762 ');

select * from Project
where project_id = '00-00-00101';

update Project
set project_cipher = N'Поставка программно-аппаратного комплекса ViPNetwork, шифр "Дружба"'
where project_id = '00-00-00101'

insert into Project(project_id, project_cipher, start_date, end_date, tab_N)
values ('00-00-00055', N'Поставка программно-аппаратного комплекса Network-VPN', '2023-01-01', '2023-12-31','000000762 ');

select * from Project
where project_id = '00-00-00055';