drop table if exists Components;
create table Components
(
    components_id             int identity
        constraint Components_pk
            primary key nonclustered,
    project_id                int
        constraint FK_Components_project_id
            references Project,
    component_name            nvarchar(500),
    component_quantity        decimal(8, 2),
    component_unit            nvarchar(10),
    component_price           decimal(8, 2),
    component_document        nvarchar(100),
    component_document_number nvarchar(20),
    component_document_date   date,
    contractor_id             int
        constraint FK_Components_contractor_id
            references Contractors
);

insert into Components
(project_id, component_name, component_quantity,
 component_unit, component_price, component_document,
 component_document_number, component_document_date, contractor_id)
values ;

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
