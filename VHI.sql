create table VHI
(
	tab_N varchar(10)
		constraint FK_Employee_tab_N
			references Employee,
	Insurance_program nvarchar(50),
	Policy_issue_date date default null,
	Policy_expiration_date date default null,
	Employer_cost decimal default 0,
	Employee_cost decimal default 0
)
go