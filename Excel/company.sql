drop procedure if exists CompanyCreation;
create procedure CompanyCreation as
begin
    create table company
    (
        company_id        int primary key identity (1,1),
        company_name      varchar(30),
        company_full_name varchar(100)
    )
end;
    execute CompanyCreation;

    drop procedure if exists CompanyInsertion;
    create procedure CompanyInsertion as
    begin
        insert into company(company_name, company_full_name)
        values ('АО "ИнфоТеКС"',
                'Акционерное общество «Информационные технологии и коммуникационные системы» (АО «ИнфоТеКС»)'),
               ('АО "ПМ"', 'Акционерное общество  «Перспективный мониторинг» (АО «ПМ»)'),
               ('ООО "СФБ Лаб"', 'Общество с ограниченной ответственностью «СФБ Лаборатория» (ООО «СФБ Лаб»)')
    end;
        execute CompanyInsertion;

    select *
    from company;

    insert into company(company_name, company_full_name)
    values ('ООО "СФБ Лаб"', 'Общество с ограниченной ответственностью «СФБ Лаборатория» (ООО «СФБ Лаб»)');

    delete
    from company
    where company_id = 3;

    update company
    set company_full_name = ('Общество с ограниченной ответственностью «СФБ Лаборатория» (ООО «СФБ Лаб»)')
    where company_id = 3;

    drop table if exists company;

select * from expenditures;
select * from Commercial;
select * from GOZ;
select * from cipher;




