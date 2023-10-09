drop table if exists Components;
create table Components
(
    components_id             int primary key identity (1,1),
    genuine_project_id        int,
    component_name            varchar(500),
    component_quantity        decimal(8, 2),
    component_unit            varchar(10),
    component_price           decimal(8, 2),
    component_document        varchar(100),
    component_document_number varchar(20),
    component_document_date   date,
    contractor_id             int,

    foreign key (contractor_id) references Contractors (contractor_id) on delete no action,
    foreign key (genuine_project_id) references Project (project_id) on delete no action,
);

insert into Components
(project_id, component_name, component_quantity,
 component_unit, component_price, component_document,
 component_document_number, component_document_date, contractor_id)
values (68, N'Компактный компьютер Lanner NCA-1010 Intel Atom E3815/2 Gb DDR3L/ 2 Gb/ (HW50N1) L1010-01', 1, N'шт.',
        29678.22, N'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004', '2023-04-17', 3),
       (68, N'Модуль-3G для HW50/100', 1, N'шт.', 7189.40, N'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004',
        '2023-04-17', 3),
       (72,
        N'Безвентиляторный компьютер Lanner LEC-6032-IT2 ATOM-2807 4XGBE DIM/ 2GB DDR3/SSD2Gb/500 GB  (HW100N1) L6032-01',
        1, N'шт.', 50803.88, N'УПД № Z0808230002 от 08.08.2023 г.', 'Z0808230002', '2023-08-08', 3),
       (75,
        N'Безвентиляторный компьютер Lanner LEC-6032-IT2 ATOM-2807 4XGBE DIM/ 2GB DDR3/SSD2Gb/500 GB  (HW100N1) L6032-01',
        1, N'шт.', 50803.88, N'УПД № Z0808230002 от 08.08.2023 г.', 'Z0808230002', '2023-08-08', 3),
       (75, N'Модуль- WiFi для HW50/100', 1, N'шт.', 3895.90, N'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004',
        '2023-04-17', 3),
       (79,
        N'Безвентиляторный компьютер Lanner LEC-6032-IT2 ATOM-2807 4XGBE DIM/ 2GB DDR3/SSD2Gb/500 GB  (HW100N1) L6032-01',
        1, N'шт.', 50803.88, N'УПД № Z0808230002 от 08.08.2023 г.', 'Z0808230002', '2023-08-08', 3),
       (79, N'Модуль-3G для HW50/100', 1, N'шт.', 7189.40, N'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004',
        '2023-04-17', 3),
       (80, N'Сервер Аквариус T41 S102DF-V R51  (HW1000Q7, TLS500Q2) T41S102-01', 1, N'шт.', 185029.58,
        N'УПД № Z2208230002 от 22.08.2023 г.', 'Z2208230002', '2023-08-22', 3),
       (82, N'Сервер Аквариус T41 S102DF-V R52  (HW1000Q8, IDS NS Q3) T41S102-02', 1, N'шт.', 232262.77,
        N'УПД № Z1708230001 от 17.08.2023 г.', 'Z1708230001', '2023-08-17', 3),
       (84, N'Сервер Аквариус T41 S102DF-V R53  (HW1000 Q9, xF1000 Q8,  TLS1000 Q3) T41S102-03', 1, N'шт.', 254544.37,
        N'УПД № Z1808230001 от 18.08.2023 г.', 'Z1808230001', '2023-08-18', 3),
       (86, N'Сервер Аквариус T41 S102DF-V R50 (V06) (HW 2000 Q5)', 1, N'шт.', 442736.79,
        N'УПД № Z1708230001 от 17.08.2023 г.', 'Z1708230001', '2023-08-17', 3),
       (88, N'Сервер Аквариус T41 S102DF-V R55  (HW5000 Q2, xF5000 Q2, TLS5000 Q2, IDS NS10000 Q1) T41S102-05', 1, N'шт.',
        451614.55, N'УПД № Z2208230002 от 22.08.2023 г.', 'Z2208230002', '2023-08-22', 3),
       (89, N'Блок электронный ФРКЕ.468989.002 Комплекс ДНСД (ТКС0008_1)', 1, N'шт.', 4446.92,
        N'УПД № ВС000000064 от 09.06.2020 г.', N'ВС000000064', '2020-06-09', 4),
       (89, N'Внешний привод DVD-RW Lite-On eBAU108 USB slim ext M-disk RTL', 1, N'шт.', 1191.67,
        N'УПД № 20-00197-2 от 04.03.2020 г.', '20-00197-2', '2020-03-04', 2),
       (89, N'Рутокен ЭЦП 2,0 128 Кб Flash 4Gb/8Gb', 1, N'шт.', 2593.14, N'УПД № УП-1154 от 09.04.2020 г.', N'УП-1154',
        '2020-04-09', 1),
       (89, N'Концентратор USB 2.0 Orient CU-210N на 4 порта', 1, N'шт.', 201.25, N'УПД № Z2904200001 от 29.04.2020 г.',
        'Z2904200001', '2020-04-29', 3),
       (89, N'Трансивер Avago AFBR-5710PZ', 1, N'шт.', 5048.15, N'УПД № Z2208230002 от 22.08.2023 г.', 'Z2208230002',
        '2023-08-22', 3),
       (89, N'Безвентиляторный компьютер Lanner LEC-6032-IT3  (КВ 100N1) L6032-03', 1, N'шт.', 67530.8,
        N'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004', '2023-07-14', 3),
       (91, N'Сервер-телеком Aquarius Server T41 S102DF-V R56 (KB1000Q8)', 1, N'шт.', 192288.67,
        N'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004', '2023-07-14', 3),
       (91, N'Внешний привод DVD-RW Lite-On eBAU108 USB slim ext M-disk RTL', 1, N'шт.', 1191.67,
        N'УПД № 20-00197-2 от 04.03.2020 г.', '20-00197-2', '2020-03-04', 2),
       (91, N'Рутокен ЭЦП 2,0 128 Кб Flash 4Gb/8Gb', 1, N'шт.', 2593.14, N'УПД № УП-1154 от 09.04.2020 г.', N'УП-1154',
        '2020-04-09', 1),
       (91, N'Блок электронный ФРКЕ.468989.002 Комплекс ДНСД (ТКС0008_1)', 1, N'шт.', 4446.92,
        N'УПД № ВС000000064 от 09.06.2020 г.', N'ВС000000064', '2020-06-09', 4),
       (93, N'Сервер Аквариус T41 S102DF-V R50 (V08) (KB2000 Q5)', 1, N'шт.', 442736.79,
        N'УПД № Z1708230001 от 17.08.2023 г.', 'Z1708230001', '2023-08-17', 3),
       (95, N'Сервер Аквариус T41 S102DF-V R50 (V07) (KB5000 Q2)', 1, N'шт.', 237426.25,
        N'УПД № Z0906230003 от 09.06.2023 г.', 'Z0906230003', '2023-06-09', 3),
       (95, N'Блок электронный ФРКЕ.468989.002 Комплекс ДНСД (ТКС0008_1)', 1, N'шт.', 4446.92,
        N'УПД № ВС000000064 от 09.06.2020 г.', N'ВС000000064', '2020-06-09', 4),
       (95, N'Концентратор USB 2.0 Orient CU-210N на 4 порта', 1, N'шт.', 201.25, N'УПД № Z2904200001 от 29.04.2020 г.',
        'Z2904200001', '2020-04-29', 3),
       (95, N'Рутокен ЭЦП 2,0 128 Кб Flash 4Gb/8Gb', 1, N'шт.', 2593.14, N'УПД № УП-1154 от 09.04.2020 г.', N'УП-1154',
        '2020-04-09', 1),
       (95, N'Внешний привод DVD-RW Lite-On eBAU108 USB slim ext M-disk RTL', 1, N'шт.', 1191.67,
        N'УПД № 20-00197-2 от 04.03.2020 г.', '20-00197-2', '2020-03-04', 2),
       (1072, N'Сервер Аквариус T41 S102DF-V R50 (V06) (HW 2000 Q5)', 1, N'шт.', 442736.79,
        N'УПД № Z1708230001 от 17.08.2023 г.', 'Z1708230001', '2023-08-17', 3);

select *
from Components;

select component_name,
       component_unit,
       component_quantity,
       component_price,
       component_document,
       contractor_full_name,
       contractor_inn
from Components
         inner join Contractors C on Components.contractor_id = C.contractor_id
         inner join Project P on Components.project_id = P.project_id
where project_cipher like
      N'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+unlim%';

drop procedure if exists ComponentsRefresh;
create procedure ComponentsRefresh @cipher as nvarchar(150)
as
begin
    --prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
    select component_name,
           component_unit,
           component_quantity,
           component_price,
           component_document,
           contractor_full_name,
           contractor_inn
    from Components
             inner join Contractors C on Components.contractor_id = C.contractor_id
             inner join Project P on Components.project_id = P.project_id
    where project_cipher like
              --'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+unlim%';
          @cipher;
end
go

exec ComponentsRefresh N'Программно-аппаратный комплекс ViPNet Coordinator HW100 C 4.x (+unlim%';


update Components
set component_price = 368947.33
where components_id = 11;

exec sp_rename 'PK__Componen__82E2D349A75C5B12', PK_Components_components_id, 'OBJECT';

exec sp_rename 'FK__Component__contr__214BF109', FK_Components_contractor_id, 'OBJECT';

exec sp_rename 'FK__Component__genui__22401542', FK_Components_project_id, 'OBJECT';

exec sp_rename 'Components.genuine_project_id', project_id, 'COLUMN';

alter table Components
    drop constraint FK_Components_project_id;

alter table Components
	add constraint FK_Components_project_id
		foreign key (project_id) references Project (project_id);
