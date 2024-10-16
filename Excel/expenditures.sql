drop procedure if exists ExpendituresCreation;
create procedure ExpendituresCreation as
begin
create table expenditures
(
    expenditures_id   int primary key identity (1,1),
    expenditures_name varchar(100)
)
end;
execute ExpendituresCreation;

drop procedure if exists ExpendituresInsertion;
create procedure ExpendituresInsertion as
begin
insert into expenditures (expenditures_name)
values ('Сырьё, материалы и вспомогательные материалы'),
('Покупные комплектующие изделия'),
('Основная заработная плата основных работников предприятия'),
('Дополнительная заработная плата основных работников предприятия'),
('Страховые взносы на обязательное социальное страхование'),
('Прочие прямые затраты'),
('Затраты по работам (услугам), выполняемым (оказываемым) сторонними организациями'),
('Административно-управленческие расходы'),
('Себестоимость продукции'),
('Прибыль'),
('Цена продукции (без НДС)'),
('Трудоемкость (чел/мес)'),
('Количество привлекаемых специалистов'),
('Амортизация основных средств общехозяйственного назначения'),
('Амортизация нематериальных активов'),
('Содержание и ремонт основных средств общехояйственного назначения'),
('Затраты на оплату труда аппарата управления'),
('Страховые взносы административно-управленческого персонала'),
('Командировочные затраты'),
('Содержание пожарной службы, охраны'),
('Испытания для определения качества материальных ресурсов собственного изготовления и приобретаемых'),
('Затраты на подготовку и переподготовку работников организации. Затраты по подбору и найму работников'),
('Изобретательство и рационализаторство'),
('Охрана труда'),
('Прочие затраты общехозяйственного назначения'),
('Амортизация арендованных помещений'),
('Амортизация программного обеспечения'),
('Аренда помещения и коммунальные услуги'),
('Информационная безопасность'),
('Канцтовары'),
('Лизинг оборудования'),
('Литература, подписка'),
('Лицензионные затраты'),
('Материалы'),
('НДС за счет собственных средств'),
('Неисключительное право на ПО'),
('Нотариальные, юридические, аудиторские услуги'),
('Оборудование для спецпроектов'),
('Офисные расходы'),
('Парковка'),
('Перевод документов для внутренних нужд'),
('Поддержка ПО'),
('Почта и курьерские услуги '),
('Прочие расходы'),
('Сервисные сборы'),
('Сертификация'),
('Создание ОС, НМА и НИОКР'),
('Списание НИОКР'),
('Страхование'),
('Транспортные расходы'),
('Услуги связи'),
('Выручка (нетто) от реализации продукции (без НДС)'),
('Валовая прибыль (убыток)'),
('Прибыль (убыток) от продаж'),
('Прибыль (убыток) до налогообложения'),
('Чистая прибыль (убыток)'),
('Себестоимость реализованной продукции'),
('Административно-управленческий персонал'),
('Основная заработная плата административно-управленческого персонала'),
('Дополнительная заработная плата административно-управленческого персонала'),
('Социальные выплаты административно-управленческого персонала')
end;
exec ExpendituresInsertion;

select *
from expenditures;