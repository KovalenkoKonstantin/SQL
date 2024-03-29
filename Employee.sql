select tab_N from Employee
where employee_name = 'Авраменко Юрий Вячеславович';

alter table Employee
    drop constraint FK_LabourIntensity_project_id;

alter table Employee
	add constraint FK_LabourIntensity_project_id
		foreign key (project_id) references Project (project_id);

alter table Employee
	add organization_id int;

alter table Employee
	add constraint FK_Employee_organization_id
		foreign key (organization_id) references Organization (organization_id);

update Employee
set organization_id =
        (
            select organization_id
            from Organization
            where Organization.organization_inn = Employee.organization_inn
        );

alter table Employee
    drop constraint FK_Employees_organization_inn;

alter table Employee
    drop column organization_inn;

select * from Employee;

alter table Employee
    drop constraint FK_Employee_organization_id;

alter table Employee
	add constraint FK_Employee_organization_id
		foreign key (organization_id) references Organization (organization_id);

select * from Employee;

alter table Employee
    drop constraint PK_Employee
go

alter table Employee alter column tab_N varchar(10) not null;

alter table Employee
	add constraint PK_Employee_tab_N
		primary key nonclustered (tab_N);

update Employee
set employee_name_trimmed = (
    select employee_name
    from
    Employee
    where employee_name = employee_name_trimmed
    );
alter table Employee
    drop column employee_name_trimmed

drop function if exists trim;
CREATE FUNCTION TRIM(@string VARCHAR(max))
    RETURNS VARCHAR(max)
     BEGIN
      RETURN LTRIM(RTRIM(@string))
     END
    GO

SELECT compatibility_level FROM sys.databases;

ALTER DATABASE RKM
SET COMPATIBILITY_LEVEL = 140;

update Employee set employee_name_trimmed = TRIM(employee_name_trimmed);
select TRIM(employee_name_trimmed) from Employee;
SELECT rTRIM (employee_name) AS Trimmed from Employee;

select rtrim(employee_name) as employee_name, month_name, year_number,
       accrual_type, salary_bugget_ammount from SalaryBudget
inner join AccrualType A on SalaryBudget.accrual_id = A.accrual_id
inner join Employee E on SalaryBudget.tab_N = E.tab_N
inner join Month M on SalaryBudget.month_id = M.month_id
inner join Year Y on SalaryBudget.year_id = Y.year_id

where employee_name <> '' --and accrual_type = 'ОКЛАД' or accrual_type = 'НАДБАВКА'
--and year_number = 2023 and month_name = 'Сентябрь'
order by employee_name;

select tab_N, rtrim(employee_name) as employee_name, month_name, year_number,
       employee_position from EmployeeChanges
inner join Employee E on EmployeeChanges.tab_N = E.tab_N
inner join Month M on EmployeeChanges.month_id = M.month_id
inner join Year Y on EmployeeChanges.year_id = Y.year_id
where employee_name = 'Бушма Роман Александрович' and year_number > 2022
order by month_name;

select tab_N from Employee
where employee_name = 'Бушма Роман Александрович';

select employee_name from Employee
where tab_N = '000001762 '

select employee_position from EmployeeChanges
where tab_N = '000001762 '

update EmployeeChanges
set employee_position = 'Старший специалист'
where tab_N = '000001762 ';

update Employee
set employee_name = 'Бушма Роман Александрович Старый'
where tab_N = '000001762 ';

select rtrim(employee_name) as employee_name, tab_N from Employee;

select tab_N from Employee
where rtrim(employee_name) like 'Стенечкина Елена Александровна';

select rtrim(employee_name) as employee_name, tab_N from Employee
where employee_name <> ''
and organization_id = 3
order by employee_name;

drop procedure if exists GetEmployeeRefresh;
create procedure GetEmployeeRefresh
@index as integer
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select rtrim(employee_name) as employee_name, tab_N from Employee
where employee_name <> ''
and organization_id = @index
order by employee_name
end
go

exec GetEmployeeRefresh;

select employee_name, tab_N from Employee
where tab_N = '0000000162';

select employee_name, tab_N from Employee
where organization_id = 9 and employee_name = '';

drop procedure if exists GetEmployee
create procedure GetEmployee
@org as int
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select employee_name, tab_N, format(date_of_dismissal, 'dd.MM.yyyy') as date_of_dismissal from Employee
-- inner join Organization O on Employee.organization_id = O.organization_id
-- where organization_name = 'АО "ПМ"'
where organization_id = @org
    order by tab_N desc
end

exec GetEmployee 9;

select employee_name, tab_N from Employee
where employee_name = 'Кислова Татьяна Константиновна';

select * from Employee
    where employee_name = 'Ганжа Юрий Сергеевич';


select employee_name, tab_N, format(date_of_dismissal, 'dd.MM.yyyy') as date_of_dismissal
from Employee
where organization_id = 9 and employee_name = 'Родионов Феликс Николаевич'
    order by employee_name;

select * from Employee
where employee_name like '%(%'

select * from Employee
where employee_name like 'Юркин Константин Юрьевич';

select top 50 * from Employee
    where employment !='';

select * from Employee
    where employee_name = 'Булавкин Даниил Сергеевич';

select * from Employee
    where tab_N like '0000000075'
    order by employee_name;

select * from Employee
    where organization_id = 6
order by employee_name;

drop index PK_Employee_tab_N on Employee
go
alter table Employee
    drop constraint PK_Employee_tab_N
go
alter table Employee
	add GUID varchar(100)
go
alter table Employee alter column GUID nvarchar(36) null
go

alter procedure GetEmployee
@org as int,
@startdate as date
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select employee_name, tab_N, format(date_of_dismissal, 'dd.MM.yyyy') as date_of_dismissal from Employee
-- inner join Organization O on Employee.organization_id = O.organization_id
-- where organization_name = 'АО "ПМ"'
where organization_id = @org
and date_of_dismissal > @startdate
or date_of_dismissal = '1753-01-01'
    order by tab_N desc
end

exec GetEmployee 3, '2022-06-01';

select * from Employee
where tab_N = '0000000129'

alter table Employee
    drop constraint PK_Employee_tab_N
go

select * from Employee
where GUID is null
--and employee_name <> ''
order by employee_name;

delete from Employee where GUID is null;

alter table Employee alter column GUID nvarchar(36) not null
go

alter table Employee
	add constraint PK_Employee_GUID
		primary key nonclustered (GUID)
go

select * from Employee
where employee_name = 'Серова Ирина Юрьевна'

exec GetEmployeeRefresh 9;