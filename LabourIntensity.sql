drop table if exists LabourIntensity;
create table LabourIntensity
(
    labour_intensity_id          int primary key identity (1,1),
    organization_id              int,
    project_id                   nchar(11),
    decimal_number_id            int,
    operation_id                 int,
    labour_intensity_month_value decimal(10, 2)
        foreign key (organization_id) references Organization (organization_id) on delete no action,
    foreign key (project_id) references Project (project_id) on delete no action,
    foreign key (decimal_number_id) references DecimalNumbers (decimal_number_id) on delete no action,
    foreign key (operation_id) references Operations (operation_id) on delete no action
);

insert into LabourIntensity (organization_id, project_id, decimal_number_id, operation_id, labour_intensity_month_value)
values (3, '00-00-00061', 1, 1, 1.62),
       (3, '00-00-00061', 1, 2, 1.50),
       (3, '00-00-00061', 1, 3, 0.25),
       (3, '00-00-00061', 1, 10, 0.25),
       (3, '00-00-00061', 1, 4, 0.45),
       (3, '00-00-00061', 1, 5, 0.30),
       (3, '00-00-00061', 1, 13, 0.45),
       (3, '00-00-00061', 1, 6, 0.37),
       (3, '00-00-00061', 1, 7, 0.13),
       (3, '00-00-00061', 1, 8, 3.50),
       (3, '00-00-00061', 1, 9, 0.23),
       (3, '00-00-00061', 1, 14, 0.13),
       (3, '00-00-00063', 2, 11, 1.82),
       (3, '00-00-00063', 2, 2, 1.80),
       (3, '00-00-00063', 2, 3, 0.25),
       (3, '00-00-00063', 2, 10, 0.25),
       (3, '00-00-00063', 2, 4, 0.45),
       (3, '00-00-00063', 2, 5, 0.30),
       (3, '00-00-00063', 2, 12, 0.45),
       (3, '00-00-00063', 2, 6, 0.37),
       (3, '00-00-00063', 2, 7, 0.13),
       (3, '00-00-00063', 2, 8, 4.73),
       (3, '00-00-00063', 2, 9, 0.23),
       (3, '00-00-00063', 2, 14, 0.13),
       (3, '00-00-00065', 3, 11, 1.82),
       (3, '00-00-00065', 3, 2, 1.80),
       (3, '00-00-00065', 3, 3, 0.25),
       (3, '00-00-00065', 3, 10, 0.25),
       (3, '00-00-00065', 3, 4, 0.45),
       (3, '00-00-00065', 3, 5, 0.30),
       (3, '00-00-00065', 3, 12, 0.45),
       (3, '00-00-00065', 3, 6, 0.37),
       (3, '00-00-00065', 3, 7, 0.13),
       (3, '00-00-00065', 3, 8, 4.73),
       (3, '00-00-00065', 3, 9, 0.23),
       (3, '00-00-00065', 3, 14, 0.13),
       (3, '00-00-00067', 4, 11, 1.82),
       (3, '00-00-00067', 4, 2, 1.80),
       (3, '00-00-00067', 4, 3, 0.25),
       (3, '00-00-00067', 4, 10, 0.25),
       (3, '00-00-00067', 4, 4, 0.45),
       (3, '00-00-00067', 4, 5, 0.30),
       (3, '00-00-00067', 4, 12, 0.45),
       (3, '00-00-00067', 4, 6, 0.37),
       (3, '00-00-00067', 4, 7, 0.13),
       (3, '00-00-00067', 4, 8, 4.73),
       (3, '00-00-00067', 4, 9, 0.23),
       (3, '00-00-00067', 4, 14, 0.13),
       (3, '00-00-00068', 5, 11, 1.90),
       (3, '00-00-00068', 5, 2, 1.97),
       (3, '00-00-00068', 5, 3, 0.25),
       (3, '00-00-00068', 5, 10, 0.25),
       (3, '00-00-00068', 5, 4, 0.45),
       (3, '00-00-00068', 5, 5, 0.30),
       (3, '00-00-00068', 5, 12, 0.45),
       (3, '00-00-00068', 5, 6, 0.37),
       (3, '00-00-00068', 5, 7, 0.13),
       (3, '00-00-00068', 5, 8, 5.25),
       (3, '00-00-00068', 5, 9, 0.23),
       (3, '00-00-00068', 5, 14, 0.13),
       (3, '00-00-00069', 6, 11, 1.90),
       (3, '00-00-00069', 6, 2, 1.97),
       (3, '00-00-00069', 6, 3, 0.25),
       (3, '00-00-00069', 6, 10, 0.25),
       (3, '00-00-00069', 6, 4, 0.45),
       (3, '00-00-00069', 6, 5, 0.30),
       (3, '00-00-00069', 6, 12, 0.45),
       (3, '00-00-00069', 6, 6, 0.37),
       (3, '00-00-00069', 6, 7, 0.13),
       (3, '00-00-00069', 6, 8, 5.25),
       (3, '00-00-00069', 6, 9, 0.23),
       (3, '00-00-00069', 6, 14, 0.13),
       (3, '00-00-00070', 7, 11, 1.90),
       (3, '00-00-00070', 7, 2, 1.97),
       (3, '00-00-00070', 7, 3, 0.25),
       (3, '00-00-00070', 7, 10, 0.25),
       (3, '00-00-00070', 7, 4, 0.45),
       (3, '00-00-00070', 7, 5, 0.30),
       (3, '00-00-00070', 7, 12, 0.45),
       (3, '00-00-00070', 7, 6, 0.37),
       (3, '00-00-00070', 7, 7, 0.13),
       (3, '00-00-00070', 7, 8, 5.25),
       (3, '00-00-00070', 7, 9, 0.23),
       (3, '00-00-00070', 7, 14, 0.13),
       (3, '00-00-00071', 8, 11, 1.93),
       (3, '00-00-00071', 8, 2, 2.10),
       (3, '00-00-00071', 8, 3, 0.25),
       (3, '00-00-00071', 8, 10, 0.25),
       (3, '00-00-00071', 8, 4, 0.45),
       (3, '00-00-00071', 8, 5, 0.30),
       (3, '00-00-00071', 8, 12, 0.45),
       (3, '00-00-00071', 8, 6, 0.37),
       (3, '00-00-00071', 8, 7, 0.14),
       (3, '00-00-00071', 8, 8, 5.30),
       (3, '00-00-00071', 8, 9, 0.23),
       (3, '00-00-00071', 8, 14, 0.13),
       (3, '00-00-00072', 9, 11, 1.93),
       (3, '00-00-00072', 9, 2, 2.10),
       (3, '00-00-00072', 9, 3, 0.25),
       (3, '00-00-00072', 9, 10, 0.25),
       (3, '00-00-00072', 9, 4, 0.45),
       (3, '00-00-00072', 9, 5, 0.30),
       (3, '00-00-00072', 9, 12, 0.45),
       (3, '00-00-00072', 9, 6, 0.37),
       (3, '00-00-00072', 9, 7, 0.14),
       (3, '00-00-00072', 9, 8, 5.30),
       (3, '00-00-00072', 9, 9, 0.23),
       (3, '00-00-00072', 9, 14, 0.13),
       (3, '00-00-00073', 10, 11, 1.90),
       (3, '00-00-00073', 10, 2, 1.85),
       (3, '00-00-00073', 10, 3, 0.25),
       (3, '00-00-00073', 10, 10, 0.25),
       (3, '00-00-00073', 10, 4, 0.50),
       (3, '00-00-00073', 10, 5, 0.35),
       (3, '00-00-00073', 10, 12, 0.45),
       (3, '00-00-00073', 10, 6, 0.37),
       (3, '00-00-00073', 10, 7, 0.13),
       (3, '00-00-00073', 10, 8, 5.0),
       (3, '00-00-00073', 10, 9, 0.23),
       (3, '00-00-00073', 10, 14, 0.13),
       (3, '00-00-00074', 11, 11, 1.90),
       (3, '00-00-00074', 11, 2, 2.10),
       (3, '00-00-00074', 11, 3, 0.25),
       (3, '00-00-00074', 11, 10, 0.25),
       (3, '00-00-00074', 11, 4, 0.55),
       (3, '00-00-00074', 11, 5, 0.50),
       (3, '00-00-00074', 11, 12, 0.45),
       (3, '00-00-00074', 11, 6, 0.37),
       (3, '00-00-00074', 11, 7, 0.13),
       (3, '00-00-00074', 11, 8, 5.25),
       (3, '00-00-00074', 11, 9, 0.23),
       (3, '00-00-00074', 11, 14, 0.13),
       (3, '00-00-00075', 13, 11, 1.90),
       (3, '00-00-00075', 13, 2, 2.10),
       (3, '00-00-00075', 13, 3, 0.25),
       (3, '00-00-00075', 13, 10, 0.25),
       (3, '00-00-00075', 13, 4, 0.55),
       (3, '00-00-00075', 13, 5, 0.50),
       (3, '00-00-00075', 13, 12, 0.45),
       (3, '00-00-00075', 13, 6, 0.37),
       (3, '00-00-00075', 13, 7, 0.13),
       (3, '00-00-00075', 13, 8, 5.25),
       (3, '00-00-00075', 13, 9, 0.23),
       (3, '00-00-00075', 13, 14, 0.13),
       (3, '00-00-00076', 12, 11, 1.90),
       (3, '00-00-00076', 12, 2, 2.10),
       (3, '00-00-00076', 12, 3, 0.25),
       (3, '00-00-00076', 12, 10, 0.25),
       (3, '00-00-00076', 12, 4, 0.55),
       (3, '00-00-00076', 12, 5, 0.50),
       (3, '00-00-00076', 12, 12, 0.45),
       (3, '00-00-00076', 12, 6, 0.37),
       (3, '00-00-00076', 12, 7, 0.13),
       (3, '00-00-00076', 12, 8, 5.25),
       (3, '00-00-00076', 12, 9, 0.23),
       (3, '00-00-00076', 12, 14, 0.13);

select *
from Organization;
select organization_id
from Organization
where organization_name like 'АО "Инфотекс%';

select *
from LabourIntensity;
select *
from Project;

select project_cipher, decimal_number, operation_name,
       labour_intensity_month_value
from LabourIntensity l
inner join DecimalNumbers DN on l.decimal_number_id = DN.decimal_number_id
inner join Operations O on l.operation_id = O.operation_id
inner join Project P on l.project_id = P.project_id
where project_cipher = 'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+unlim)';

select sum(labour_intensity_month_value) as sum
from LabourIntensity l
inner join DecimalNumbers DN on l.decimal_number_id = DN.decimal_number_id
where decimal_number = 'ФРКЕ.00130-03-00-02';

select operation_name, labour_intensity_month_value
from LabourIntensity l
inner join Operations O on l.operation_id = O.operation_id
inner join Project P on l.project_id = P.project_id
where project_cipher like
      'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%';

drop procedure if exists LabourRefresh;
create procedure LabourRefresh
@cipher as nvarchar(150)
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select operation_name, labour_intensity_month_value
from LabourIntensity l
inner join Operations O on l.operation_id = O.operation_id
inner join Project P on l.project_id = P.project_id
where project_cipher like
--       'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%';
      @cipher;
end
go

exec LabourRefresh 'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+u%'

drop procedure if exists LabourRefreshAlt;
create procedure LabourRefreshAlt
@cipher as nvarchar(150)

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