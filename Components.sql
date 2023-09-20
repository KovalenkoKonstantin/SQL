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
    foreign key (genuine_project_id) references Project (genuine_project_id) on delete no action,
);

insert into Components
(genuine_project_id, component_name, component_quantity,
 component_unit, component_price, component_document,
 component_document_number, component_document_date, contractor_id)
values (68, 'Компактный компьютер Lanner NCA-1010 Intel Atom E3815/2 Gb DDR3L/ 2 Gb/ (HW50N1) L1010-01', 1, 'шт.',
        29678.22, 'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004', '2023-04-17', 3),
       (68, 'Модуль-3G для HW50/100', 1, 'шт.', 7189.40, 'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004',
        '2023-04-17', 3),
       (72,
        'Безвентиляторный компьютер Lanner LEC-6032-IT2 ATOM-2807 4XGBE DIM/ 2GB DDR3/SSD2Gb/500 GB  (HW100N1) L6032-01',
        1, 'шт.', 50803.88, 'УПД № Z0808230002 от 08.08.2023 г.', 'Z0808230002', '2023-08-08', 3),
       (75,
        'Безвентиляторный компьютер Lanner LEC-6032-IT2 ATOM-2807 4XGBE DIM/ 2GB DDR3/SSD2Gb/500 GB  (HW100N1) L6032-01',
        1, 'шт.', 50803.88, 'УПД № Z0808230002 от 08.08.2023 г.', 'Z0808230002', '2023-08-08', 3),
       (75, 'Модуль- WiFi для HW50/100', 1, 'шт.', 3895.90, 'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004',
        '2023-04-17', 3),
       (79,
        'Безвентиляторный компьютер Lanner LEC-6032-IT2 ATOM-2807 4XGBE DIM/ 2GB DDR3/SSD2Gb/500 GB  (HW100N1) L6032-01',
        1, 'шт.', 50803.88, 'УПД № Z0808230002 от 08.08.2023 г.', 'Z0808230002', '2023-08-08', 3),
       (79, 'Модуль-3G для HW50/100', 1, 'шт.', 7189.40, 'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004',
        '2023-04-17', 3),
       (80, 'Сервер Аквариус T41 S102DF-V R51  (HW1000Q7, TLS500Q2) T41S102-01', 1, 'шт.', 185029.58,
        'УПД № Z2208230002 от 22.08.2023 г.', 'Z2208230002', '2023-08-22', 3),
       (82, 'Сервер Аквариус T41 S102DF-V R52  (HW1000Q8, IDS NS Q3) T41S102-02', 1, 'шт.', 232262.77,
        'УПД № Z1708230001 от 17.08.2023 г.', 'Z1708230001', '2023-08-17', 3),
       (84, 'Сервер Аквариус T41 S102DF-V R53  (HW1000 Q9, xF1000 Q8,  TLS1000 Q3) T41S102-03', 1, 'шт.', 254544.37,
        'УПД № Z1808230001 от 18.08.2023 г.', 'Z1808230001', '2023-08-18', 3),
       (86, 'Сервер Аквариус T41 S102DF-V R50 (V06) (HW 2000 Q5)', 1, 'шт.', 442736.79,
        'УПД № Z1708230001 от 17.08.2023 г.', 'Z1708230001', '2023-08-17', 3),
       (88, 'Сервер Аквариус T41 S102DF-V R55  (HW5000 Q2, xF5000 Q2, TLS5000 Q2, IDS NS10000 Q1) T41S102-05', 1, 'шт.',
        451614.55, 'УПД № Z2208230002 от 22.08.2023 г.', 'Z2208230002', '2023-08-22', 3),
       (89, 'Блок электронный ФРКЕ.468989.002 Комплекс ДНСД (ТКС0008_1)', 1, 'шт.', 4446.92,
        'УПД № ВС000000064 от 09.06.2020 г.', 'ВС000000064', '2020-06-09', 4),
       (89, 'Внешний привод DVD-RW Lite-On eBAU108 USB slim ext M-disk RTL', 1, 'шт.', 1191.67,
        'УПД № 20-00197-2 от 04.03.2020 г.', '20-00197-2', '2020-03-04', 2),
       (89, 'Рутокен ЭЦП 2,0 128 Кб Flash 4Gb/8Gb', 1, 'шт.', 2593.14, 'УПД № УП-1154 от 09.04.2020 г.', 'УП-1154',
        '2020-04-09', 1),
       (89, 'Концентратор USB 2.0 Orient CU-210N на 4 порта', 1, 'шт.', 201.25, 'УПД № Z2904200001 от 29.04.2020 г.',
        'Z2904200001', '2020-04-29', 3),
       (89, 'Трансивер Avago AFBR-5710PZ', 1, 'шт.', 5048.15, 'УПД № Z2208230002 от 22.08.2023 г.', 'Z2208230002',
        '2023-08-22', 3),
       (89, 'Безвентиляторный компьютер Lanner LEC-6032-IT3  (КВ 100N1) L6032-03', 1, 'шт.', 67530.8,
        'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004', '2023-07-14', 3),
       (91, 'Сервер-телеком Aquarius Server T41 S102DF-V R56 (KB1000Q8)', 1, 'шт.', 192288.67,
        'УПД № Z1407230004 от 14.07.2023 г.', 'Z1407230004', '2023-07-14', 3),
       (91, 'Внешний привод DVD-RW Lite-On eBAU108 USB slim ext M-disk RTL', 1, 'шт.', 1191.67,
        'УПД № 20-00197-2 от 04.03.2020 г.', '20-00197-2', '2020-03-04', 2),
       (91, 'Рутокен ЭЦП 2,0 128 Кб Flash 4Gb/8Gb', 1, 'шт.', 2593.14, 'УПД № УП-1154 от 09.04.2020 г.', 'УП-1154',
        '2020-04-09', 1),
       (91, 'Блок электронный ФРКЕ.468989.002 Комплекс ДНСД (ТКС0008_1)', 1, 'шт.', 4446.92,
        'УПД № ВС000000064 от 09.06.2020 г.', 'ВС000000064', '2020-06-09', 4),
       (93, 'Сервер Аквариус T41 S102DF-V R50 (V08) (KB2000 Q5)', 1, 'шт.', 442736.79,
        'УПД № Z1708230001 от 17.08.2023 г.', 'Z1708230001', '2023-08-17', 3),
       (95, 'Сервер Аквариус T41 S102DF-V R50 (V07) (KB5000 Q2)', 1, 'шт.', 237426.25,
        'УПД № Z0906230003 от 09.06.2023 г.', 'Z0906230003', '2023-06-09', 3),
       (95, 'Блок электронный ФРКЕ.468989.002 Комплекс ДНСД (ТКС0008_1)', 1, 'шт.', 4446.92,
        'УПД № ВС000000064 от 09.06.2020 г.', 'ВС000000064', '2020-06-09', 4),
       (95, 'Концентратор USB 2.0 Orient CU-210N на 4 порта', 1, 'шт.', 201.25, 'УПД № Z2904200001 от 29.04.2020 г.',
        'Z2904200001', '2020-04-29', 3),
       (95, 'Рутокен ЭЦП 2,0 128 Кб Flash 4Gb/8Gb', 1, 'шт.', 2593.14, 'УПД № УП-1154 от 09.04.2020 г.', 'УП-1154',
        '2020-04-09', 1),
       (95, 'Внешний привод DVD-RW Lite-On eBAU108 USB slim ext M-disk RTL', 1, 'шт.', 1191.67,
        'УПД № 20-00197-2 от 04.03.2020 г.', '20-00197-2', '2020-03-04', 2),
       (1072, 'Сервер Аквариус T41 S102DF-V R50 (V06) (HW 2000 Q5)', 1, 'шт.', 442736.79,
        'УПД № Z1708230001 от 17.08.2023 г.', 'Z1708230001', '2023-08-17', 3);

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
         inner join Project P on Components.genuine_project_id = P.genuine_project_id
where project_cipher like
      'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+unlim%';

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
             inner join Project P on Components.genuine_project_id = P.genuine_project_id
    where project_cipher like
              --'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+unlim%';
          @cipher;
end
go

exec ComponentsRefresh 'Программно-аппаратный комплекс ViPNet Coordinator HW100 C 4.x (+unlim%';
