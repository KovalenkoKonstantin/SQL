alter table TaxBase
    drop constraint FK_TaxBase_tab_N;

alter table TaxBase alter column tab_N varchar(10) not null;

alter table TaxBase
	add constraint FK_TaxBase_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from TaxBase;