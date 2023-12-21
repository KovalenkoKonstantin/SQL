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
as
begin
--prevent the "1 row affected" message from being returned for every operation
    set nocount on
--statement for the procedure
select tab_N, insurance_program, policy_issue_date,
       policy_expiration_date, employer_cost, employee_cost, policy_number,
       employee_insurance, FORMAT(policy_issue_date,'yyyy') as year
 from VHI
    order by policy_issue_date
end
go;

exec GetVHI;

select FORMAT(getdate(),'MMMM') as year from VHI;
select FORMAT(policy_issue_date,'MMMM') as year from VHI;

select * from VHI
where tab_N = '0000000235';

alter table VHI
	add detachment_date date default null
go