drop table if exists GozAttribute;
drop procedure if exists GozAttributeCreation;
create procedure GozAttributeCreation as
begin
    create table GozAttribute
    (
        goz_attribute_id   int identity (1,1)
            constraint PK_GozAttribute_goz_attribute_id
                primary key nonclustered,
        goz_attribute_name varchar(10)
    )
end;
    execute GozAttributeCreation;

    drop procedure if exists GozAttributeInsertion;
    create procedure GozAttributeInsertion as
    begin
        insert into GozAttribute(goz_attribute_name)
        values ('ГОЗ'),
               ('Не ГОЗ')
    end;
        exec GozAttributeInsertion;

    select *
    from GozAttribute;

        drop procedure if exists GetGozAttributeRefresh;
        create procedure GetGozAttributeRefresh
        as
        begin
            --prevent the "1 row affected" message from being returned for every operation
            set nocount on
--statement for the procedure
            select *
            from GozAttribute
        end
go

exec GetGozAttributeRefresh;

drop procedure if exists GozCreation;
create procedure GOZCreation as
    begin
drop table if exists GOZ

create table GOZ
(
    goz_id                       int identity (1,1)
        constraint PK_GOZ_goz_id
            primary key nonclustered,
    organization_id              int
            constraint FK_GOZ_organization_id
            references Organization(organization_id),
    goz_attribute_id             int
            constraint FK_GOZ_goz_attribute_id
            references GozAttribute,
    genuine_project_id           int
            constraint FK_GOZ_genuine_project_id
            references Project(project_id),
    year_number                  int
            constraint FK_GOZ_year_number
            references Year,
    expenditures_id              int
            constraint FK_GOZ_expenditures_id
            references Expenditures,
    labour_intensity_month_value decimal(10, 2)
)
end;

exec GOZCreation;

insert into GOZ (organization_id, goz_attribute_id, project_id, year_number, expenditures_id,
                 labour_intensity_month_value)
values (3, 2, 1077, 2021, 1, 0.0),
       (3, 2, 1077, 2021, 2, 0.0),
       (3, 2, 1077, 2021, 3, 0.0),
       (3, 2, 1077, 2021, 4, 0.0),
       (3, 2, 1077, 2021, 5, 0.0),
       (3, 2, 1077, 2021, 6, 0.0),
       (3, 2, 1077, 2021, 7, 0.0),
       (3, 2, 1077, 2021, 8, 0.0),
       (3, 2, 1077, 2021, 9, 0.0),
       (3, 2, 1077, 2021, 10, 0.0),
       (3, 2, 1077, 2021, 11, 0.0),
       (3, 2, 1077, 2021, 12, 0.0),
       (3, 2, 1077, 2021, 13, 0.0),
       (3, 2, 1077, 2021, 14, 0.0),
       (3, 2, 1077, 2021, 15, 0.0),
       (3, 2, 1077, 2021, 16, 0.0),
       (3, 2, 1077, 2021, 17, 0.0),
       (3, 2, 1077, 2021, 18, 0.0),
       (3, 2, 1077, 2021, 19, 0.0),
       (3, 2, 1077, 2021, 20, 0.0),
       (3, 2, 1077, 2021, 21, 0.0),
       (3, 2, 1077, 2021, 22, 0.0),
       (3, 2, 1077, 2021, 23, 0.0),
       (3, 2, 1077, 2021, 24, 0.0),
       (3, 2, 1077, 2021, 25, 0.0),
       (3, 2, 1077, 2021, 26, 0.0),
       (3, 2, 1077, 2021, 27, 0.0),
       (3, 2, 1077, 2021, 28, 0.0),
       (3, 2, 1077, 2021, 29, 0.0),
       (3, 2, 1077, 2021, 30, 0.0),
       (3, 2, 1077, 2021, 31, 0.0),
       (3, 2, 1077, 2021, 32, 0.0),
       (3, 2, 1077, 2021, 33, 0.0),
       (3, 2, 1077, 2021, 34, 0.0),
       (3, 2, 1077, 2021, 35, 0.0),
       (3, 2, 1077, 2021, 36, 0.0),
       (3, 2, 1077, 2021, 37, 0.0),
       (3, 2, 1077, 2021, 38, 0.0),
       (3, 2, 1077, 2021, 39, 0.0),
       (3, 2, 1077, 2021, 40, 0.0),
       (3, 2, 1077, 2021, 41, 0.0),
       (3, 2, 1077, 2021, 42, 0.0),
       (3, 2, 1077, 2021, 43, 0.0),
       (3, 2, 1077, 2021, 44, 0.0),
       (3, 2, 1077, 2021, 45, 0.0),
       (3, 2, 1077, 2021, 46, 0.0),
       (3, 2, 1077, 2021, 47, 0.0),
       (3, 2, 1077, 2021, 48, 0.0),
       (3, 2, 1077, 2021, 49, 0.0),
       (3, 2, 1077, 2021, 50, 0.0),
       (3, 2, 1077, 2021, 51, 0.0),
       (3, 2, 1077, 2021, 52, 0.0),
       (3, 2, 1077, 2021, 53, 0.0),
       (3, 2, 1077, 2021, 54, 0.0),
       (3, 2, 1077, 2021, 55, 0.0),
       (3, 2, 1077, 2021, 56, 0.0),
       (3, 2, 1077, 2021, 57, 0.0),
       (3, 2, 1077, 2021, 58, 0.0),
       (3, 2, 1077, 2021, 59, 0.0),
       (3, 2, 1077, 2021, 60, 0.0),
       (3, 2, 1077, 2021, 61, 0.0),
       (3, 2, 1077, 2021, 62, 0.0),
       (3, 2, 1077, 2021, 63, 0.0),
       (3, 2, 1077, 2022, 1, 0.0),
       (3, 2, 1077, 2022, 2, 0.0),
       (3, 2, 1077, 2022, 3, 0.0),
       (3, 2, 1077, 2022, 4, 0.0),
       (3, 2, 1077, 2022, 5, 0.0),
       (3, 2, 1077, 2022, 6, 0.0),
       (3, 2, 1077, 2022, 7, 0.0),
       (3, 2, 1077, 2022, 8, 0.0),
       (3, 2, 1077, 2022, 9, 0.0),
       (3, 2, 1077, 2022, 10, 0.0),
       (3, 2, 1077, 2022, 11, 0.0),
       (3, 2, 1077, 2022, 12, 0.0),
       (3, 2, 1077, 2022, 13, 0.0),
       (3, 2, 1077, 2022, 14, 0.0),
       (3, 2, 1077, 2022, 15, 0.0),
       (3, 2, 1077, 2022, 16, 0.0),
       (3, 2, 1077, 2022, 17, 0.0),
       (3, 2, 1077, 2022, 18, 0.0),
       (3, 2, 1077, 2022, 19, 0.0),
       (3, 2, 1077, 2022, 20, 0.0),
       (3, 2, 1077, 2022, 21, 0.0),
       (3, 2, 1077, 2022, 22, 0.0),
       (3, 2, 1077, 2022, 23, 0.0),
       (3, 2, 1077, 2022, 24, 0.0),
       (3, 2, 1077, 2022, 25, 0.0),
       (3, 2, 1077, 2022, 26, 0.0),
       (3, 2, 1077, 2022, 27, 0.0),
       (3, 2, 1077, 2022, 28, 0.0),
       (3, 2, 1077, 2022, 29, 0.0),
       (3, 2, 1077, 2022, 30, 0.0),
       (3, 2, 1077, 2022, 31, 0.0),
       (3, 2, 1077, 2022, 32, 0.0),
       (3, 2, 1077, 2022, 33, 0.0),
       (3, 2, 1077, 2022, 34, 0.0),
       (3, 2, 1077, 2022, 35, 0.0),
       (3, 2, 1077, 2022, 36, 0.0),
       (3, 2, 1077, 2022, 37, 0.0),
       (3, 2, 1077, 2022, 38, 0.0),
       (3, 2, 1077, 2022, 39, 0.0),
       (3, 2, 1077, 2022, 40, 0.0),
       (3, 2, 1077, 2022, 41, 0.0),
       (3, 2, 1077, 2022, 42, 0.0),
       (3, 2, 1077, 2022, 43, 0.0),
       (3, 2, 1077, 2022, 44, 0.0),
       (3, 2, 1077, 2022, 45, 0.0),
       (3, 2, 1077, 2022, 46, 0.0),
       (3, 2, 1077, 2022, 47, 0.0),
       (3, 2, 1077, 2022, 48, 0.0),
       (3, 2, 1077, 2022, 49, 0.0),
       (3, 2, 1077, 2022, 50, 0.0),
       (3, 2, 1077, 2022, 51, 0.0),
       (3, 2, 1077, 2022, 52, 0.0),
       (3, 2, 1077, 2022, 53, 0.0),
       (3, 2, 1077, 2022, 54, 0.0),
       (3, 2, 1077, 2022, 55, 0.0),
       (3, 2, 1077, 2022, 56, 0.0),
       (3, 2, 1077, 2022, 57, 0.0),
       (3, 2, 1077, 2022, 58, 0.0),
       (3, 2, 1077, 2022, 59, 0.0),
       (3, 2, 1077, 2022, 60, 0.0),
       (3, 2, 1077, 2022, 61, 0.0),
       (3, 2, 1077, 2022, 62, 0.0),
       (3, 2, 1077, 2022, 63, 0.0),
       (3, 2, 1077, 2023, 1, 0.0),
       (3, 2, 1077, 2023, 2, 368947.33),
       (3, 2, 1077, 2023, 3, 179300.0),
       (3, 2, 1077, 2023, 4, 0.0),
       (3, 2, 1077, 2023, 5, 13985.40),
       (3, 2, 1077, 2023, 6, 0.0),
       (3, 2, 1077, 2023, 7, 0.0),
       (3, 2, 1077, 2023, 8, 107580.0),
       (3, 2, 1077, 2023, 9, 669812.73),
       (3, 2, 1077, 2023, 10, 75627.57),
       (3, 2, 1077, 2023, 11, 745440.30),
       (3, 2, 1077, 2023, 12, 149088.6),
       (3, 2, 1077, 2023, 13, 894528.36),
       (3, 2, 1077, 2023, 14, 1.63),
       (3, 2, 1077, 2023, 15, 4.0),
       (3, 2, 1077, 2023, 16, 10010.12),
       (3, 2, 1077, 2023, 17, 12.20),
       (3, 2, 1077, 2023, 18, 1188.86),
       (3, 2, 1077, 2023, 19, 64574.51),
       (3, 2, 1077, 2023, 20, 1815.34),
       (3, 2, 1077, 2023, 21, 0.0),
       (3, 2, 1077, 2023, 22, 262.59),
       (3, 2, 1077, 2023, 23, 0.0),
       (3, 2, 1077, 2023, 24, 0.0),
       (3, 2, 1077, 2023, 25, 0.0),
       (3, 2, 1077, 2023, 26, 22.10),
       (3, 2, 1077, 2023, 27, 29694.28),
       (3, 2, 1077, 2023, 28, 0.0),
       (3, 2, 1077, 2023, 29, 0.0),
       (3, 2, 1077, 2023, 30, 11043.76),
       (3, 2, 1077, 2023, 31, 2707.21),
       (3, 2, 1077, 2023, 32, 985.77),
       (3, 2, 1077, 2023, 33, 0.0),
       (3, 2, 1077, 2023, 34, 0.0),
       (3, 2, 1077, 2023, 35, 0.0),
       (3, 2, 1077, 2023, 36, 0.0),
       (3, 2, 1077, 2023, 37, 0.0),
       (3, 2, 1077, 2023, 38, 0.0),
       (3, 2, 1077, 2023, 39, 0.0),
       (3, 2, 1077, 2023, 40, 0.0),
       (3, 2, 1077, 2023, 41, 0.0),
       (3, 2, 1077, 2023, 42, 0.0),
       (3, 2, 1077, 2023, 43, 0.0),
       (3, 2, 1077, 2023, 44, 0.0),
       (3, 2, 1077, 2023, 45, 0.0),
       (3, 2, 1077, 2023, 46, 0.0),
       (3, 2, 1077, 2023, 47, 0.0),
       (3, 2, 1077, 2023, 48, 5233.78),
       (3, 2, 1077, 2023, 49, 0.0),
       (3, 2, 1077, 2023, 50, 0.0),
       (3, 2, 1077, 2023, 51, 4654.43),
       (3, 2, 1077, 2023, 52, 0.0),
       (3, 2, 1077, 2023, 53, 5069.33),
       (3, 2, 1077, 2023, 54, 745440.30),
       (3, 2, 1077, 2023, 55, 0.0),
       (3, 2, 1077, 2023, 56, 0.0),
       (3, 2, 1077, 2023, 57, 0.0),
       (3, 2, 1077, 2023, 58, 0.0),
       (3, 2, 1077, 2023, 59, 0.0),
       (3, 2, 1077, 2023, 60, 0.0),
       (3, 2, 1077, 2023, 61, 64574.51),
       (3, 2, 1077, 2023, 62, 0.0),
       (3, 2, 1077, 2023, 63, 1815.34),
       (3, 2, 1077, 2024, 1, 0.0),
       (3, 2, 1077, 2024, 2, 0.0),
       (3, 2, 1077, 2024, 3, 537400.0),
       (3, 2, 1077, 2024, 4, 0.0),
       (3, 2, 1077, 2024, 5, 41917.20),
       (3, 2, 1077, 2024, 6, 0.0),
       (3, 2, 1077, 2024, 7, 0.0),
       (3, 2, 1077, 2024, 8, 322440.0),
       (3, 2, 1077, 2024, 9, 901757.20),
       (3, 2, 1077, 2024, 10, 222161.5),
       (3, 2, 1077, 2024, 11, 1123918.25),
       (3, 2, 1077, 2024, 12, 224783.65),
       (3, 2, 1077, 2024, 13, 1348701.90),
       (3, 2, 1077, 2024, 14, 4.89),
       (3, 2, 1077, 2024, 15, 0.0),
       (3, 2, 1077, 2024, 16, 30002.44),
       (3, 2, 1077, 2024, 17, 36.56),
       (3, 2, 1077, 2024, 18, 3563.27),
       (3, 2, 1077, 2024, 19, 193543.45),
       (3, 2, 1077, 2024, 20, 5440.96),
       (3, 2, 1077, 2024, 21, 0.0),
       (3, 2, 1077, 2024, 22, 787.0),
       (3, 2, 1077, 2024, 23, 0.0),
       (3, 2, 1077, 2024, 24, 0.0),
       (3, 2, 1077, 2024, 25, 0.0),
       (3, 2, 1077, 2024, 26, 66.24),
       (3, 2, 1077, 2024, 27, 89000.8),
       (3, 2, 1077, 2024, 28, 0.0),
       (3, 2, 1077, 2024, 29, 0.0),
       (3, 2, 1077, 2024, 30, 33100.49),
       (3, 2, 1077, 2024, 31, 8114.7),
       (3, 2, 1077, 2024, 32, 2954.57),
       (3, 2, 1077, 2024, 33, 0.0),
       (3, 2, 1077, 2024, 34, 0.0),
       (3, 2, 1077, 2024, 35, 0.0),
       (3, 2, 1077, 2024, 36, 0.0),
       (3, 2, 1077, 2024, 37, 0.0),
       (3, 2, 1077, 2024, 38, 0.0),
       (3, 2, 1077, 2024, 39, 0.0),
       (3, 2, 1077, 2024, 40, 0.0),
       (3, 2, 1077, 2024, 41, 0.0),
       (3, 2, 1077, 2024, 42, 0.0),
       (3, 2, 1077, 2024, 43, 0.0),
       (3, 2, 1077, 2024, 44, 0.0),
       (3, 2, 1077, 2024, 45, 0.0),
       (3, 2, 1077, 2024, 46, 0.0),
       (3, 2, 1077, 2024, 47, 0.0),
       (3, 2, 1077, 2024, 48, 15686.75),
       (3, 2, 1077, 2024, 49, 0.0),
       (3, 2, 1077, 2024, 50, 0.0),
       (3, 2, 1077, 2024, 51, 13950.33),
       (3, 2, 1077, 2024, 52, 0.0),
       (3, 2, 1077, 2024, 53, 15193.87),
       (3, 2, 1077, 2024, 54, 1123918.25),
       (3, 2, 1077, 2024, 55, 0.0),
       (3, 2, 1077, 2024, 56, 0.0),
       (3, 2, 1077, 2024, 57, 0.0),
       (3, 2, 1077, 2024, 58, 0.0),
       (3, 2, 1077, 2024, 59, 0.0),
       (3, 2, 1077, 2024, 60, 0.0),
       (3, 2, 1077, 2024, 61, 193543.45),
       (3, 2, 1077, 2024, 62, 0.0),
       (3, 2, 1077, 2024, 63, 5440.96);


select *
from GOZ;

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

drop procedure if exists GOZInsertion;
create procedure GOZInsertion @value1 as nvarchar(50)
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select operation_name, labour_intensity_month_value
    from LabourIntensity l
             inner join Operations O on l.operation_id = O.operation_id
             inner join Project P on l.project_id = P.[1C_kod_project]
    where project_cipher like
--       'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%';
          @value1;
end
go

exec LabourRefresh 'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%'

drop procedure if exists LabourRefreshAlt;
create procedure LabourRefreshAlt @cipher as nvarchar(150)
as
declare @SQLString nvarchar(1000)

    set @SQLString =
            N'select operation_name, labour_intensity_month_value
            from LabourIntensity l
            inner join Operations O on l.operation_id = O.operation_id
            inner join Project P on l.project_id = P.project_id
            where project_cipher like
                  @cipher'
    exec LabourRefresh @SQLString,
         N'@cipher as Nvarchar(150)',
         @cipher

go

exec LabourRefreshAlt 'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%'

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

exec sp_rename 'FK_GOZ_genuine_project_id', FK_GOZ_project_id, 'OBJECT';

exec sp_rename 'GOZ.genuine_project_id', project_id, 'COLUMN';

alter table GOZ
    drop constraint FK_GOZ_project_id;

alter table GOZ
	add constraint FK_GOZ_project_id
		foreign key (project_id) references Project (project_id);