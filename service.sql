select employee_position as "Должность", schedule_description as "График работы", employee_name as Сотрудник
from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N;

select [1C_kod_project], project_cipher from Project
where project_cipher like 'Улей-23 Этап%';

insert into AccrualType(accrual_type)
values (N'ОЗП'),
       (N'ДЗП'),
       (N'Прочие'),
       (N'База');

alter table Salary
    add accrual_id int;

update Salary
set accrual_id =
        (
            select accrual_id
            from AccrualType
            where Salary.accrual_type = AccrualType.accrual_type
        );

update SalaryBudget
set accrual_id =
        (
            select accrual_id
            from AccrualType
            where SalaryBudget.accrual_type = AccrualType.accrual_type
        );
