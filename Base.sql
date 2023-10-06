drop table if exists Base;
create table Base
(
	base_id int identity,
	base_name varchar(10)
)
go

create unique index Base_base_id_uindex
	on Base (base_id)
go

alter table Base
	add constraint PK_Base_base_id
		primary key nonclustered (base_id)
go

alter table Base alter column base_name varchar(20) null;

insert into Base(base_name)
values (N'База'),
       (N'не учитывается');

select * from Base;

insert into Base(base_name)
values (N'');
