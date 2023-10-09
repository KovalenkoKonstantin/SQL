alter table Tax
	add tax_name_id int;

alter table Tax
	add constraint FK_Tax_tax_name_id
		foreign key (tax_name_id) references TaxName;

update Tax
set tax_name_id =
        (
            select tax_name_id
            from TaxName
            where Tax.tax_name = TaxName.tax_name
        );

alter table Tax
    drop column tax_name

select * from Tax;