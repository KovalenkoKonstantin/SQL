drop table if exists TranslationDependencies;
create table TranslationDependencies
(
	translation_id int identity,
	[1C_cost_type] varchar(200),
	accrual_id int
		constraint FK_TranslationDependencies_accrual_id
			references AccrualType,
	base bit,
	[1C_accrual_retention_code] varchar(100)
)
go

create unique index TranslationDependencies_translation_id_uindex
	on TranslationDependencies (translation_id)
go

alter table TranslationDependencies
	add constraint PK_TranslationDependencies_translation_id
		primary key nonclustered (translation_id)
go
select * from TranslationDependencies;

-- 1 for TRUE and 0 for FALSE
alter table TranslationDependencies alter column base bit null;

insert into TranslationDependencies([1C_cost_type], accrual_id, base)
values