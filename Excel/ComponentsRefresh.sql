create procedure ComponentsRefresh @code_1C as nvarchar(11)
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
    where [1C_kod_project] =
              --'Программно-аппаратный комплекс ViPNet Coordinator HW50 A 4.x (+3G)(+unlim%';
          @code_1C;
end
go

