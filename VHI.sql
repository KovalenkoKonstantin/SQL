create table VHI
(
	tab_N varchar(10)
		constraint FK_Employee_tab_N
			references Employee,
	insurance_program nvarchar(50),
	policy_issue_date date default null,
	policy_expiration_date date default null,
	employer_cost decimal default 0,
	employee_cost decimal default 0
)
go

select * from VHI;

drop procedure if exists GetVHI;
create procedure GetVHI
    @organization_id as integer,
    @year_id as integer,
    @date as date
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select VHI.tab_N,
       insurance_program,
       policy_issue_date,
       policy_expiration_date,
       employer_cost,
       employee_cost,
       policy_number,
       employee_insurance,
       FORMAT(policy_issue_date, 'yyyy') as year,
       replace(detachment_date, '1753-01-01', '')as N'Дата открепления',
       replace(date_of_dismissal, '1753-01-01', '')as N'Дата увольнения',
       employee_name,
       [relative's_insurance],
       relative
from VHI
         inner join Employee E on VHI.GUID = E.GUID
where VHI.organization_id = @organization_id
  and FORMAT(policy_issue_date, 'yyyy') >= @year_id
  and policy_issue_date > @date
  and date_of_dismissal > @date
union
select VHI.tab_N,
       insurance_program,
       policy_issue_date,
       policy_expiration_date,
       employer_cost,
       employee_cost,
       policy_number,
       employee_insurance,
       FORMAT(policy_issue_date, 'yyyy') as year,
       replace(detachment_date, '1753-01-01', '')as N'Дата открепления',
       replace(date_of_dismissal, '1753-01-01', '')as N'Дата увольнения',
       employee_name,
       [relative's_insurance],
       relative
from VHI
         inner join Employee E on VHI.GUID = E.GUID
where VHI.organization_id = @organization_id
  and FORMAT(policy_issue_date, 'yyyy') >= @year_id
  and policy_issue_date > @date
  and fired = 0
order by employee_name, policy_issue_date
end
go;

exec GetVHI 9, 2023, '2023-07-30';

select FORMAT(getdate(),'MMMM') as year from VHI;
select FORMAT(policy_issue_date,'MMMM') as year from VHI;

select * from VHI
where tab_N = '0000000357'
and year(policy_issue_date) > 2023

select VHI.tab_N,
       insurance_program,
       policy_issue_date,
       policy_expiration_date,
       employer_cost,
       employee_cost,
       policy_number,
       employee_insurance,
       FORMAT(policy_issue_date, 'yyyy') as year,
       detachment_date as N'Дата открепления',
       employee_name,
       [relative's_insurance],
       relative
from VHI
         inner join Employee E on VHI.GUID = E.GUID
where VHI.organization_id = 9
  and FORMAT(policy_issue_date, 'yyyy') >= 2023
  and date_of_dismissal > '2023-07-30'
-- order by employee_name, policy_issue_date
union
select VHI.tab_N,
       insurance_program,
       policy_issue_date,
       policy_expiration_date,
       employer_cost,
       employee_cost,
       policy_number,
       employee_insurance,
       FORMAT(policy_issue_date, 'yyyy') as year,
       detachment_date as N'Дата открепления',
       employee_name,
       [relative's_insurance],
       relative
from VHI
         inner join Employee E on VHI.GUID = E.GUID
where VHI.organization_id = 9
  and FORMAT(policy_issue_date, 'yyyy') >= 2023
  and policy_expiration_date > '2023-07-31'
  and fired = 0
order by employee_name, policy_issue_date

select * from VHI
where tab_N = '0000000320'

update VHI
set [relative's_insurance ] = 1
where relative = 'Панов Тимофей Иванович'

select * from VHI
where policy_number = '66579559'
and tab_N = '0000000179'

select * from VHI
where tab_N = '0000000181'
and policy_number = '66579574'

select * from VHI
where policy_number = '66579601'




