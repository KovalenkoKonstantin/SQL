drop table if exists LabourIntensity;
create table LabourIntensity
(
    labour_intensity_id         int identity
        constraint PK_LabourIntensity_labour_intensity_id
            primary key nonclustered,
    organization_id             int
        constraint FK_LabourIntensity_organization_id
            references Organization,
    project_id                  int
        constraint FK_LabourIntensity_project_id
            references Project,
    decimal_number_id           int
        constraint FK_LabourIntensity_decimal_number_id
            references DecimalNumbers,
    operation_id                int
        constraint FK_LabourIntensity_operation_id
            references Operations,
    labour_intensity_hour_value decimal(10, 2)
);

insert into LabourIntensity (organization_id, project_id, decimal_number_id, operation_id, labour_intensity_hour_value)
values (3, 1087, 8, 2, 0.10),
       (3, 1087, 8, 3, 0.05),
       (3, 1087, 8, 4, 0.02),
       (3, 1087, 8, 5, 0.05),
       (3, 1087, 8, 6, 0.17),
       (3, 1087, 8, 7, 0.13),
       (3, 1087, 8, 8, 0.08),
       (3, 1087, 8, 9, 0.05),
       (3, 1087, 8, 10, 0.08),
       (3, 1087, 8, 11, 0.07),
       (3, 1087, 8, 1, 0.07),
       (3, 1087, 8, 12, 0.07),
       (3, 1087, 8, 13, 0.17),
       (3, 1087, 8, 14, 0.05),
       (3, 1088, 9, 2, 0.10),
       (3, 1088, 9, 3, 0.05),
       (3, 1088, 9, 4, 0.02),
       (3, 1088, 9, 15, 0.12),
       (3, 1088, 9, 5, 0.05),
       (3, 1088, 9, 6, 0.17),
       (3, 1088, 9, 7, 0.13),
       (3, 1088, 9, 8, 0.08),
       (3, 1088, 9, 9, 0.05),
       (3, 1088, 9, 10, 0.08),
       (3, 1088, 9, 11, 0.07),
       (3, 1088, 9, 1, 0.07),
       (3, 1088, 9, 12, 0.07),
       (3, 1088, 9, 13, 0.17),
       (3, 1088, 9, 14, 0.05),
       (3, 63, 1, 2, 0.10),
       (3, 63, 1, 3, 0.05),
       (3, 63, 1, 4, 0.02),
       (3, 63, 1, 15, 0.12),
       (3, 63, 1, 5, 0.05),
       (3, 63, 1, 6, 0.17),
       (3, 63, 1, 7, 0.13),
       (3, 63, 1, 8, 0.08),
       (3, 63, 1, 9, 0.05),
       (3, 63, 1, 10, 0.08),
       (3, 63, 1, 11, 0.07),
       (3, 63, 1, 1, 0.07),
       (3, 63, 1, 12, 0.07),
       (3, 63, 1, 13, 0.17),
       (3, 63, 1, 14, 0.05),
       (3, 1089, 10, 2, 0.10),
       (3, 1089, 10, 3, 0.05),
       (3, 1089, 10, 4, 0.02),
       (3, 1089, 10, 5, 0.05),
       (3, 1089, 10, 6, 0.17),
       (3, 1089, 10, 7, 0.12),
       (3, 1089, 10, 8, 0.08),
       (3, 1089, 10, 9, 0.05),
       (3, 1089, 10, 10, 0.08),
       (3, 1089, 10, 11, 0.07),
       (3, 1089, 10, 1, 0.07),
       (3, 1089, 10, 12, 0.07),
       (3, 1089, 10, 13, 0.17),
       (3, 1089, 10, 14, 0.05),
       (3, 73, 2, 2, 0.10),
       (3, 73, 2, 3, 0.05),
       (3, 73, 2, 4, 0.02),
       (3, 73, 2, 15, 0.12),
       (3, 73, 2, 5, 0.05),
       (3, 73, 2, 6, 0.17),
       (3, 73, 2, 7, 0.13),
       (3, 73, 2, 8, 0.08),
       (3, 73, 2, 9, 0.05),
       (3, 73, 2, 10, 0.08),
       (3, 73, 2, 11, 0.07),
       (3, 73, 2, 1, 0.07),
       (3, 73, 2, 12, 0.07),
       (3, 73, 2, 13, 0.17),
       (3, 73, 2, 14, 0.05),
       (3, 77, 3, 2, 0.10),
       (3, 77, 3, 3, 0.05),
       (3, 77, 3, 4, 0.02),
       (3, 77, 3, 15, 0.12),
       (3, 77, 3, 5, 0.05),
       (3, 77, 3, 6, 0.17),
       (3, 77, 3, 7, 0.12),
       (3, 77, 3, 8, 0.08),
       (3, 77, 3, 9, 0.05),
       (3, 77, 3, 10, 0.08),
       (3, 77, 3, 11, 0.07),
       (3, 77, 3, 1, 0.07),
       (3, 77, 3, 12, 0.07),
       (3, 77, 3, 13, 0.17),
       (3, 77, 3, 14, 0.05),
       (3, 1068, 15, 2, 0.08),
       (3, 1068, 15, 3, 0.05),
       (3, 1068, 15, 4, 0.02),
       (3, 1068, 15, 5, 0.05),
       (3, 1068, 15, 6, 0.17),
       (3, 1068, 15, 7, 0.12),
       (3, 1068, 15, 8, 0.08),
       (3, 1068, 15, 9, 0.05),
       (3, 1068, 15, 10, 0.08),
       (3, 1068, 15, 11, 0.07),
       (3, 1068, 15, 1, 0.07),
       (3, 1068, 15, 12, 0.07),
       (3, 1068, 15, 13, 0.17),
       (3, 1068, 15, 14, 0.05),
       (3, 1069, 14, 2, 0.08),
       (3, 1069, 14, 3, 0.05),
       (3, 1069, 14, 4, 0.02),
       (3, 1069, 14, 5, 0.05),
       (3, 1069, 14, 6, 0.17),
       (3, 1069, 14, 7, 0.12),
       (3, 1069, 14, 8, 0.08),
       (3, 1069, 14, 9, 0.05),
       (3, 1069, 14, 10, 0.08),
       (3, 1069, 14, 11, 0.07),
       (3, 1069, 14, 1, 0.07),
       (3, 1069, 14, 12, 0.07),
       (3, 1069, 14, 13, 0.17),
       (3, 1069, 14, 14, 0.05),
       (3, 1090, 11, 2, 0.08),
       (3, 1090, 11, 3, 0.05),
       (3, 1090, 11, 4, 0.02),
       (3, 1090, 11, 5, 0.05),
       (3, 1090, 11, 6, 0.17),
       (3, 1090, 11, 7, 0.12),
       (3, 1090, 11, 8, 0.08),
       (3, 1090, 11, 9, 0.05),
       (3, 1090, 11, 10, 0.08),
       (3, 1090, 11, 11, 0.07),
       (3, 1090, 11, 1, 0.07),
       (3, 1090, 11, 12, 0.07),
       (3, 1090, 11, 13, 0.17),
       (3, 1090, 11, 14, 0.05),
       (3, 1091, 12, 2, 0.08),
       (3, 1091, 12, 3, 0.05),
       (3, 1091, 12, 4, 0.02),
       (3, 1091, 12, 5, 0.05),
       (3, 1091, 12, 6, 0.17),
       (3, 1091, 12, 7, 0.12),
       (3, 1091, 12, 8, 0.08),
       (3, 1091, 12, 9, 0.05),
       (3, 1091, 12, 10, 0.08),
       (3, 1091, 12, 11, 0.07),
       (3, 1091, 12, 1, 0.07),
       (3, 1091, 12, 12, 0.07),
       (3, 1091, 12, 13, 0.17),
       (3, 1091, 12, 14, 0.05),
       (3, 1092, 13, 2, 0.08),
       (3, 1092, 13, 3, 0.05),
       (3, 1092, 13, 4, 0.02),
       (3, 1092, 13, 5, 0.05),
       (3, 1092, 13, 6, 0.17),
       (3, 1092, 13, 7, 0.12),
       (3, 1092, 13, 8, 0.08),
       (3, 1092, 13, 9, 0.05),
       (3, 1092, 13, 10, 0.08),
       (3, 1092, 13, 11, 0.07),
       (3, 1092, 13, 1, 0.07),
       (3, 1092, 13, 12, 0.07),
       (3, 1092, 13, 13, 0.17),
       (3, 1092, 13, 14, 0.05),
       (3, 1093, 4, 2, 0.17),
       (3, 1093, 4, 3, 0.25),
       (3, 1093, 4, 16, 0.03),
       (3, 1093, 4, 17, 0.17),
       (3, 1093, 4, 18, 0.28),
       (3, 1093, 4, 2, 0.08),
       (3, 1093, 4, 4, 0.02),
       (3, 1093, 4, 5, 0.05),
       (3, 1093, 4, 6, 0.50),
       (3, 1093, 4, 7, 0.13),
       (3, 1093, 4, 8, 0.17),
       (3, 1093, 4, 19, 0.12),
       (3, 1093, 4, 9, 0.05),
       (3, 1093, 4, 10, 0.08),
       (3, 1093, 4, 11, 0.07),
       (3, 1093, 4, 1, 0.15),
       (3, 1093, 4, 12, 0.07),
       (3, 1093, 4, 13, 0.17),
       (3, 1093, 4, 14, 0.05),
       (3, 1094, 5, 2, 0.10),
       (3, 1094, 5, 3, 0.45),
       (3, 1094, 5, 16, 0.03),
       (3, 1094, 5, 17, 0.17),
       (3, 1094, 5, 18, 0.23),
       (3, 1094, 5, 2, 0.08),
       (3, 1094, 5, 4, 0.02),
       (3, 1094, 5, 5, 0.05),
       (3, 1094, 5, 6, 0.33),
       (3, 1094, 5, 7, 0.13),
       (3, 1094, 5, 8, 0.17),
       (3, 1094, 5, 19, 0.12),
       (3, 1094, 5, 9, 0.05),
       (3, 1094, 5, 10, 0.08),
       (3, 1094, 5, 11, 0.07),
       (3, 1094, 5, 1, 0.15),
       (3, 1094, 5, 12, 0.07),
       (3, 1094, 5, 13, 0.17),
       (3, 1094, 5, 14, 0.05),
       (3, 1095, 6, 2, 0.10),
       (3, 1095, 6, 3, 0.58),
       (3, 1095, 6, 16, 0.03),
       (3, 1095, 6, 17, 0.17),
       (3, 1095, 6, 18, 0.23),
       (3, 1095, 6, 2, 0.08),
       (3, 1095, 6, 4, 0.02),
       (3, 1095, 6, 5, 0.05),
       (3, 1095, 6, 6, 0.33),
       (3, 1095, 6, 7, 0.13),
       (3, 1095, 6, 8, 0.17),
       (3, 1095, 6, 19, 0.12),
       (3, 1095, 6, 9, 0.05),
       (3, 1095, 6, 10, 0.08),
       (3, 1095, 6, 11, 0.07),
       (3, 1095, 6, 1, 0.15),
       (3, 1095, 6, 12, 0.07),
       (3, 1095, 6, 13, 0.17),
       (3, 1095, 6, 14, 0.05),
       (3, 1096, 7, 2, 0.17),
       (3, 1096, 7, 3, 0.58),
       (3, 1096, 7, 16, 0.03),
       (3, 1096, 7, 17, 0.17),
       (3, 1096, 7, 18, 0.23),
       (3, 1096, 7, 2, 0.08),
       (3, 1096, 7, 4, 0.02),
       (3, 1096, 7, 5, 0.05),
       (3, 1096, 7, 6, 0.33),
       (3, 1096, 7, 7, 0.13),
       (3, 1096, 7, 8, 0.17),
       (3, 1096, 7, 19, 0.12),
       (3, 1096, 7, 9, 0.05),
       (3, 1096, 7, 10, 0.08),
       (3, 1096, 7, 11, 0.07),
       (3, 1096, 7, 1, 0.15),
       (3, 1096, 7, 12, 0.07),
       (3, 1096, 7, 13, 0.17),
       (3, 1096, 7, 14, 0.05);

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
create procedure LabourRefresh @code_1C as nvarchar(11)
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select operation_name, labour_intensity_hour_value
    from LabourIntensity l
             inner join Operations O on l.operation_id = O.operation_id
             inner join Project P on l.project_id = P.project_id
    where [1C_kod_project] =
          @code_1C;
end
go

exec LabourRefresh
     'Программно-аппаратный комплекс ViPNet Coordinator KB 4 (Исп. KB100%';

drop procedure if exists LabourRefreshAlt;
create procedure LabourRefreshAlt @code_1C as varchar(11)
as
declare @SQLString varchar(11)

    set @SQLString =
            N'select operation_name, labour_intensity_hour_value
            from LabourIntensity l
            inner join Operations O on l.operation_id = O.operation_id
            inner join Project P on l.project_id = P.project_id
            where [1C_kod_project] =
                  @code_1C'
    exec LabourRefresh @SQLString,
         N'@code_1C as Nvarchar(150)',
         @code_1C

go

exec LabourRefreshAlt
     '00-00-00082';

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

exec LabourRefresh '00-00-00081';