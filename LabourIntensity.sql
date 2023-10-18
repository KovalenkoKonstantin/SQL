drop table if exists LabourIntensity;
create table LabourIntensity
(
	labour_intensity_id int identity
		constraint PK_LabourIntensity_labour_intensity_id
			primary key nonclustered,
	organization_id int
		constraint FK_LabourIntensity_organization_id
			references Organization,
	project_id int
		constraint FK_LabourIntensity_project_id
			references Project,
	decimal_number_id int
		constraint FK_LabourIntensity_decimal_number_id
			references DecimalNumbers,
	operation_id int
		constraint FK_LabourIntensity_operation_id
			references Operations,
	labour_intensity_hour_value decimal(10,2)
);

insert into LabourIntensity (organization_id, project_id, decimal_number_id, operation_id, labour_intensity_hour_value)
values (3, 1087, 11, 2, 0.10),
       (3, 1087, 11, 3, 0.05),
       (3, 1087, 11, 4, 0.02),
       (3, 1087, 11, 5, 0.05),
       (3, 1087, 11, 6, 0.17),
       (3, 1087, 11, 7, 0.13),
       (3, 1087, 11, 8, 0.08),
       (3, 1087, 11, 9, 0.05),
       (3, 1087, 11, 10, 0.08),
       (3, 1087, 11, 11, 0.07),
       (3, 1087, 11, 1, 0.07),
       (3, 1087, 11, 12, 0.07),
       (3, 1087, 11, 13, 0.17),
       (3, 1087, 11, 14, 0.05),
       (3, 1088, 12, 2, 0.10),
       (3, 1088, 12, 3, 0.05),
       (3, 1088, 12, 4, 0.02),
       (3, 1088, 12, 15, 0.12),
       (3, 1088, 12, 5, 0.05),
       (3, 1088, 12, 6, 0.17),
       (3, 1088, 12, 7, 0.13),
       (3, 1088, 12, 8, 0.08),
       (3, 1088, 12, 9, 0.05),
       (3, 1088, 12, 10, 0.08),
       (3, 1088, 12, 11, 0.07),
       (3, 1088, 12, 1, 0.07),
       (3, 1088, 12, 12, 0.07),
       (3, 1088, 12, 13, 0.17),
       (3, 1088, 12, 14, 0.05),
       (3, 68, 1, 2, 0.10),
       (3, 68, 1, 3, 0.05),
       (3, 68, 1, 4, 0.02),
       (3, 68, 1, 15, 0.12),
       (3, 68, 1, 5, 0.05),
       (3, 68, 1, 6, 0.17),
       (3, 68, 1, 7, 0.13),
       (3, 68, 1, 8, 0.08),
       (3, 68, 1, 9, 0.05),
       (3, 68, 1, 10, 0.08),
       (3, 68, 1, 11, 0.07),
       (3, 68, 1, 1, 0.07),
       (3, 68, 1, 12, 0.07),
       (3, 68, 1, 13, 0.17),
       (3, 68, 1, 14, 0.05),
       (3, 1089, 13, 2, 0.10),
       (3, 1089, 13, 3, 0.05),
       (3, 1089, 13, 4, 0.02),
       (3, 1089, 13, 5, 0.05),
       (3, 1089, 13, 6, 0.17),
       (3, 1089, 13, 7, 0.12),
       (3, 1089, 13, 8, 0.08),
       (3, 1089, 13, 9, 0.05),
       (3, 1089, 13, 10, 0.08),
       (3, 1089, 13, 11, 0.07),
       (3, 1089, 13, 1, 0.07),
       (3, 1089, 13, 12, 0.07),
       (3, 1089, 13, 13, 0.17),
       (3, 1089, 13, 14, 0.05),
       (3, 75, 2, 2, 0.10),
       (3, 75, 2, 3, 0.05),
       (3, 75, 2, 4, 0.02),
       (3, 75, 2, 15, 0.12),
       (3, 75, 2, 5, 0.05),
       (3, 75, 2, 6, 0.17),
       (3, 75, 2, 7, 0.13),
       (3, 75, 2, 8, 0.08),
       (3, 75, 2, 9, 0.05),
       (3, 75, 2, 10, 0.08),
       (3, 75, 2, 11, 0.07),
       (3, 75, 2, 1, 0.07),
       (3, 75, 2, 12, 0.07),
       (3, 75, 2, 13, 0.17),
       (3, 75, 2, 14, 0.05),
       (3, 79, 3, 2, 0.10),
       (3, 79, 3, 3, 0.05),
       (3, 79, 3, 4, 0.02),
       (3, 79, 3, 15, 0.12),
       (3, 79, 3, 5, 0.05),
       (3, 79, 3, 6, 0.17),
       (3, 79, 3, 7, 0.12),
       (3, 79, 3, 8, 0.08),
       (3, 79, 3, 9, 0.05),
       (3, 79, 3, 10, 0.08),
       (3, 79, 3, 11, 0.07),
       (3, 79, 3, 1, 0.07),
       (3, 79, 3, 12, 0.07),
       (3, 79, 3, 13, 0.17),
       (3, 79, 3, 14, 0.05),
       (3, 80, 4, 2, 0.08),
       (3, 80, 4, 3, 0.05),
       (3, 80, 4, 4, 0.02),
       (3, 80, 4, 5, 0.05),
       (3, 80, 4, 6, 0.17),
       (3, 80, 4, 7, 0.12),
       (3, 80, 4, 8, 0.08),
       (3, 80, 4, 9, 0.05),
       (3, 80, 4, 10, 0.08),
       (3, 80, 4, 11, 0.07),
       (3, 80, 4, 1, 0.07),
       (3, 80, 4, 12, 0.07),
       (3, 80, 4, 13, 0.17),
       (3, 80, 4, 14, 0.05),
       (3, 82, 5, 2, 0.08),
       (3, 82, 5, 3, 0.05),
       (3, 82, 5, 4, 0.02),
       (3, 82, 5, 5, 0.05),
       (3, 82, 5, 6, 0.17),
       (3, 82, 5, 7, 0.12),
       (3, 82, 5, 8, 0.08),
       (3, 82, 5, 9, 0.05),
       (3, 82, 5, 10, 0.08),
       (3, 82, 5, 11, 0.07),
       (3, 82, 5, 1, 0.07),
       (3, 82, 5, 12, 0.07),
       (3, 82, 5, 13, 0.17),
       (3, 82, 5, 14, 0.05),
       (3, 1090, 14, 2, 0.08),
       (3, 1090, 14, 3, 0.05),
       (3, 1090, 14, 4, 0.02),
       (3, 1090, 14, 5, 0.05),
       (3, 1090, 14, 6, 0.17),
       (3, 1090, 14, 7, 0.12),
       (3, 1090, 14, 8, 0.08),
       (3, 1090, 14, 9, 0.05),
       (3, 1090, 14, 10, 0.08),
       (3, 1090, 14, 11, 0.07),
       (3, 1090, 14, 1, 0.07),
       (3, 1090, 14, 12, 0.07),
       (3, 1090, 14, 13, 0.17),
       (3, 1090, 14, 14, 0.05),
       (3, 1091, 15, 2, 0.08),
       (3, 1091, 15, 3, 0.05),
       (3, 1091, 15, 4, 0.02),
       (3, 1091, 15, 5, 0.05),
       (3, 1091, 15, 6, 0.17),
       (3, 1091, 15, 7, 0.12),
       (3, 1091, 15, 8, 0.08),
       (3, 1091, 15, 9, 0.05),
       (3, 1091, 15, 10, 0.08),
       (3, 1091, 15, 11, 0.07),
       (3, 1091, 15, 1, 0.07),
       (3, 1091, 15, 12, 0.07),
       (3, 1091, 15, 13, 0.17),
       (3, 1091, 15, 14, 0.05),
       (3, 88, 6, 2, 0.08),
       (3, 88, 6, 3, 0.05),
       (3, 88, 6, 4, 0.02),
       (3, 88, 6, 5, 0.05),
       (3, 88, 6, 6, 0.17),
       (3, 88, 6, 7, 0.12),
       (3, 88, 6, 8, 0.08),
       (3, 88, 6, 9, 0.05),
       (3, 88, 6, 10, 0.08),
       (3, 88, 6, 11, 0.07),
       (3, 88, 6, 1, 0.07),
       (3, 88, 6, 12, 0.07),
       (3, 88, 6, 13, 0.17),
       (3, 88, 6, 14, 0.05),
       (3, 89, 7, 2, 0.17),
       (3, 89, 7, 3, 0.25),
       (3, 89, 7, 16, 0.03),
       (3, 89, 7, 17, 0.17),
       (3, 89, 7, 18, 0.28),
       (3, 89, 7, 2, 0.08),
       (3, 89, 7, 4, 0.02),
       (3, 89, 7, 5, 0.05),
       (3, 89, 7, 6, 0.50),
       (3, 89, 7, 7, 0.13),
       (3, 89, 7, 8, 0.17),
       (3, 89, 7, 19, 0.12),
       (3, 89, 7, 9, 0.05),
       (3, 89, 7, 10, 0.08),
       (3, 89, 7, 11, 0.07),
       (3, 89, 7, 1, 0.15),
       (3, 89, 7, 12, 0.07),
       (3, 89, 7, 13, 0.17),
       (3, 89, 7, 14, 0.05),
       (3, 91, 8, 2, 0.10),
       (3, 91, 8, 3, 0.45),
       (3, 91, 8, 16, 0.03),
       (3, 91, 8, 17, 0.17),
       (3, 91, 8, 18, 0.23),
       (3, 91, 8, 2, 0.08),
       (3, 91, 8, 4, 0.02),
       (3, 91, 8, 5, 0.05),
       (3, 91, 8, 6, 0.33),
       (3, 91, 8, 7, 0.13),
       (3, 91, 8, 8, 0.17),
       (3, 91, 8, 19, 0.12),
       (3, 91, 8, 9, 0.05),
       (3, 91, 8, 10, 0.08),
       (3, 91, 8, 11, 0.07),
       (3, 91, 8, 1, 0.15),
       (3, 91, 8, 12, 0.07),
       (3, 91, 8, 13, 0.17),
       (3, 91, 8, 14, 0.05),
       (3, 93, 9, 2, 0.10),
       (3, 93, 9, 3, 0.58),
       (3, 93, 9, 16, 0.03),
       (3, 93, 9, 17, 0.17),
       (3, 93, 9, 18, 0.23),
       (3, 93, 9, 2, 0.08),
       (3, 93, 9, 4, 0.02),
       (3, 93, 9, 5, 0.05),
       (3, 93, 9, 6, 0.33),
       (3, 93, 9, 7, 0.13),
       (3, 93, 9, 8, 0.17),
       (3, 93, 9, 19, 0.12),
       (3, 93, 9, 9, 0.05),
       (3, 93, 9, 10, 0.08),
       (3, 93, 9, 11, 0.07),
       (3, 93, 9, 1, 0.15),
       (3, 93, 9, 12, 0.07),
       (3, 93, 9, 13, 0.17),
       (3, 93, 9, 14, 0.05),
       (3, 95, 10, 2, 0.17),
       (3, 95, 10, 3, 0.58),
       (3, 95, 10, 16, 0.03),
       (3, 95, 10, 17, 0.17),
       (3, 95, 10, 18, 0.23),
       (3, 95, 10, 2, 0.08),
       (3, 95, 10, 4, 0.02),
       (3, 95, 10, 5, 0.05),
       (3, 95, 10, 6, 0.33),
       (3, 95, 10, 7, 0.13),
       (3, 95, 10, 8, 0.17),
       (3, 95, 10, 19, 0.12),
       (3, 95, 10, 9, 0.05),
       (3, 95, 10, 10, 0.08),
       (3, 95, 10, 11, 0.07),
       (3, 95, 10, 1, 0.15),
       (3, 95, 10, 12, 0.07),
       (3, 95, 10, 13, 0.17),
       (3, 95, 10, 14, 0.05);

select *
from Organization;
select organization_id
from Organization
where organization_name like 'АО "Инфотекс%';

select *
from LabourIntensity;
select *
from Project;

select project_cipher,
       decimal_number,
       operation_name,
       labour_intensity_month_value
from LabourIntensity l
         inner join DecimalNumbers DN on l.decimal_number_id = DN.decimal_number_id
         inner join Operations O on l.operation_id = O.operation_id
         inner join Project P on l.project_id = P.[1C_kod_project]
where project_cipher = 'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+unlim)';

select sum(labour_intensity_month_value) as sum
from LabourIntensity l
         inner join DecimalNumbers DN on l.decimal_number_id = DN.decimal_number_id
where decimal_number = 'ФРКЕ.00130-03-00-02';

select operation_name, labour_intensity_month_value
from LabourIntensity l
         inner join Operations O on l.operation_id = O.operation_id
         inner join Project P on l.project_id = P.[1C_kod_project]
where project_cipher like
      'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%';

drop procedure if exists LabourRefresh;
create procedure LabourRefresh @cipher as nvarchar(150)
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select operation_name, labour_intensity_hour_value
    from LabourIntensity l
             inner join Operations O on l.operation_id = O.operation_id
             inner join Project P on l.project_id = P.project_id
    where project_cipher like
       'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%';
          @cipher;
end
go

exec LabourRefresh 'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%';

drop procedure if exists LabourRefreshAlt;
create procedure LabourRefreshAlt @cipher as nvarchar(150)
as
declare @SQLString nvarchar(1000)

    set @SQLString =
            N'select operation_name, labour_intensity_hour_value
            from LabourIntensity l
            inner join Operations O on l.operation_id = O.operation_id
            inner join Project P on l.project_id = P.project_id
            where project_cipher like
                  @cipher'
    exec LabourRefresh @SQLString,
         N'@cipher as Nvarchar(150)',
         @cipher

go

exec LabourRefreshAlt 'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%';

insert into LabourIntensity (organization_id, project_id, decimal_number_id, operation_id, labour_intensity_month_value)
values (3, '00-00-00086', 14, 11, 1.93),
       (3, '00-00-00086', 14, 2, 2.10),
       (3, '00-00-00086', 14, 3, 0.25),
       (3, '00-00-00086', 14, 10, 0.25),
       (3, '00-00-00086', 14, 4, 0.45),
       (3, '00-00-00086', 14, 5, 0.30),
       (3, '00-00-00086', 14, 12, 0.45),
       (3, '00-00-00086', 14, 6, 0.37),
       (3, '00-00-00086', 14, 7, 0.14),
       (3, '00-00-00086', 14, 8, 5.30),
       (3, '00-00-00086', 14, 9, 0.23),
       (3, '00-00-00086', 14, 14, 0.13);

alter table LabourIntensity
    add genuine_project_id int;

alter table LabourIntensity
    add constraint FK_LabourIntensity_genuine_project_id
        foreign key (project_id) references Project (project_id);

update LabourIntensity
set project_id =
        (
            select [1C_kod_project]
            from Project
            where LabourIntensity.project_id = Project.[1C_kod_project]
        );

select *
from LabourIntensity;

alter table LabourIntensity
    drop constraint FK_LabourIntensity_project_id;

alter table LabourIntensity
    drop column project_id;

exec sp_rename 'LabourIntensity.genuine_project_id', project_id, 'COLUMN';

exec sp_rename 'FK_LabourIntensity_genuine_project_id', FK_LabourIntensity_project_id, 'OBJECT';

alter table LabourIntensity
    drop constraint FK_LabourIntensity_project_id;

alter table LabourIntensity
    add constraint FK_LabourIntensity_project_id
        foreign key (project_id) references Project (project_id);

alter table LabourIntensity
    drop constraint FK_LabourIntensity_organization_id;

alter table LabourIntensity
    add constraint FK_LabourIntensity_organization_id
        foreign key (organization_id) references Organization (organization_id);

select *
from LabourIntensity;

exec LabourRefreshAlt 'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+unlim%';