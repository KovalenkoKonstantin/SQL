drop table if exists FAS_Overhead_Items;

create table FAS_Overhead_Items
(
	overhead_items_name nvarchar(100),
	overhead_items_id int identity
		constraint PK_FAS_Overhead_Items_overhead_item_id
			primary key nonclustered
)
go

exec sp_addextendedproperty 'MS_Description', 'Статьи накладных расходов ФАС', 'SCHEMA', 'dbo', 'TABLE', 'FAS_Overhead_Items'
go


insert into FAS_Overhead_Items(overhead_items_name)
values ('Амортизация нематериальных активов'),
       ('Амортизация основных средств общехозяйственного назначения'),
       ('Затраты на оплату труда аппарата управления'),
       ('Затраты на подготовку и переподготовку работников организации. Затраты по подбору и найму работников'),
       ('Командировочные затраты'),
       ('Охрана труда'),
       ('Прочие затраты общехозяйственного назначения'),
       ('Содержание и ремонт основных средств общехояйственного назначения'),
       ('Содержание пожарной службы, охраны'),
       ('Страховые взносы административно-управленческого персонала');


select *
from FAS_Overhead_Items;