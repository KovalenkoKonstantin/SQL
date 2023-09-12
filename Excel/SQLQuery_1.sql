EXEC sp_rename 'Projects.Cipher', 'cipher', 'COLUMN';
EXEC sp_rename 'Projects.id', 'project_id', 'COLUMN';

EXEC sp_rename 'ProjectWork.Employees', 'employees', 'COLUMN';
EXEC sp_rename 'ProjectWork.Month', 'month', 'COLUMN';
EXEC sp_rename 'ProjectWork.Year', 'year', 'COLUMN';
EXEC sp_rename 'ProjectWork.Project', 'project', 'COLUMN';
EXEC sp_rename 'ProjectWork.Hours', 'hours', 'COLUMN';

EXEC sp_rename 'Salary.Month', 'month', 'COLUMN';
EXEC sp_rename 'Salary.Year', 'year', 'COLUMN';
EXEC sp_rename 'Salary.Summa', 'summa', 'COLUMN';
EXEC sp_rename 'Salary.Employees', 'employees', 'COLUMN';
EXEC sp_rename 'Salary.TypeCalculation', 'type_calculation', 'COLUMN';

EXEC sp_rename 'SalaryBudget.Month', 'month', 'COLUMN';
EXEC sp_rename 'SalaryBudget.Year', 'year', 'COLUMN';
EXEC sp_rename 'SalaryBudget.TypeCalculation', 'type_calculation', 'COLUMN';
EXEC sp_rename 'SalaryBudget.summa', 'summ', 'COLUMN';
EXEC sp_rename 'SalaryBudget.Employees', 'employees', 'COLUMN';

EXEC sp_rename 'TaxBase.Month', 'month', 'COLUMN';
EXEC sp_rename 'TaxBase.Year', 'year', 'COLUMN';
EXEC sp_rename 'TaxBase.Base', 'base', 'COLUMN';
EXEC sp_rename 'TaxBase.Employees', 'employees', 'COLUMN';

EXEC sp_rename 'Employees.Name', 'name', 'COLUMN';
EXEC sp_rename 'Employees.Organizations', 'organizations', 'COLUMN';
EXEC sp_rename 'Employees.DateOfBirth', 'date_of_birth', 'COLUMN';
EXEC sp_rename 'Employees.dateOfDismissal', 'date_of_dismissal', 'COLUMN';
EXEC sp_rename 'Employees.TabN', 'tab_N', 'COLUMN';

EXEC sp_rename 'EmployeesChanges.Month', 'month', 'COLUMN';
EXEC sp_rename 'EmployeesChanges.tear', 'year', 'COLUMN';
EXEC sp_rename 'EmployeesChanges.Position', 'position', 'COLUMN';
EXEC sp_rename 'EmployeesChanges.AccountingType', 'accounting_type', 'COLUMN';
EXEC sp_rename 'EmployeesChanges.Employees', 'employees', 'COLUMN';
EXEC sp_rename 'EmployeesChanges.Department', 'department', 'COLUMN';

EXEC sp_rename 'months.Name', 'name', 'COLUMN';

EXEC sp_rename 'Organizations.Name', 'name', 'COLUMN';
EXEC sp_rename 'Organizations.FullName', 'full_name', 'COLUMN';
EXEC sp_rename 'Organizations.INN', 'inn', 'COLUMN';

EXEC sp_rename 'Taxes.Month', 'month', 'COLUMN';
EXEC sp_rename 'Taxes.Year', 'year', 'COLUMN';
EXEC sp_rename 'Taxes.TaxType', 'tax_type', 'COLUMN';
EXEC sp_rename 'Taxes.Summa', 'summ', 'COLUMN';
EXEC sp_rename 'Taxes.Employees', 'employees', 'COLUMN';

EXEC sp_rename 'TypesOfCalculation.type_calculation', 'calculation_type', 'COLUMN';

EXEC sp_rename 'TypesOfTax.TaxType', 'tax_type', 'COLUMN';

EXEC sp_rename 'Worktime.Month', 'month', 'COLUMN';
EXEC sp_rename 'Worktime.Year', 'year', 'COLUMN';
EXEC sp_rename 'Worktime.Schedule', 'schedule', 'COLUMN';
EXEC sp_rename 'Worktime.NormDays', 'norm_days', 'COLUMN';
EXEC sp_rename 'Worktime.NormHours', 'norm_hours', 'COLUMN';
EXEC sp_rename 'Worktime.WorkDays', 'work_days', 'COLUMN';
EXEC sp_rename 'Worktime.WorkHours', 'work_hours', 'COLUMN';
EXEC sp_rename 'Worktime.Employees', 'employees', 'COLUMN';

EXEC sp_rename 'cipher', 'Cipher';
EXEC sp_rename 'company', 'Company';
EXEC sp_rename 'expenditures', 'Expenditures';
EXEC sp_rename 'financing', 'Financing';
EXEC sp_rename 'months', 'Months';
EXEC sp_rename 'year', 'Year';

EXEC sp_rename 'ProjectWork.month', 'month_id', 'COLUMN';
EXEC sp_rename 'ProjectWork.year', year_id, 'COLUMN';
EXEC sp_rename 'ProjectWork.project', project_id, 'COLUMN';
exec sp_rename 'ProjectWork.employees', tab_N, 'COLUMN';

exec sp_rename 'SalaryBudget.employees', tab_N, 'COLUMN';
exec sp_rename 'SalaryBudget.type_calculation', calculation_type, 'COLUMN';
exec sp_rename 'SalaryBudget.year', year_id, 'COLUMN';
exec sp_rename 'SalaryBudget.month', month_id, 'COLUMN';

alter table Projects
	add constraint FK_Projects_tab_N
		foreign key (tab_N) references Employees

exec sp_rename 'Employees.name', employee_name, 'COLUMN';

exec sp_rename 'EmployeesChanges.month', month_id, 'COLUMN';
exec sp_rename 'EmployeesChanges.employees', tab_N, 'COLUMN';
exec sp_rename 'Salary.year', year_id, 'COLUMN';
exec sp_rename 'Salary.month', month_id, 'COLUMN';
exec sp_rename 'Salary.summa', summ, 'COLUMN';
exec sp_rename 'WorkSchedules.schedule', schedule_description, 'COLUMN';
exec sp_rename 'EmployeesChanges.schedule', schedule_description, 'COLUMN';
exec sp_rename 'Month.name', month_name, 'COLUMN';
exec sp_rename 'Cipher.name_cipher', cipher_name, 'COLUMN';
exec sp_rename 'Taxes.month', month_id, 'COLUMN';
exec sp_rename 'Taxes.year', year_id, 'COLUMN';
exec sp_rename 'Salary.sum', wage_fund, 'COLUMN';
exec sp_rename 'TaxBase.month', month_id, 'COLUMN';
exec sp_rename 'TaxBase.year', year_id, 'COLUMN';
exec sp_rename 'TaxBase.base', tax_base_ammount, 'COLUMN';
exec sp_rename 'TaxBase.employees', tab_N, 'COLUMN';
exec sp_rename 'Worktime.month', month_id, 'COLUMN';
exec sp_rename 'Worktime.year', year_id, 'COLUMN';
exec sp_rename 'Worktime.schedule', schedule_description, 'COLUMN';
exec sp_rename 'Worktime.employees', tab_N, 'COLUMN';
exec sp_rename 'Project.cipher', project_cipher, 'COLUMN';
exec sp_rename 'Organization.name', organization_name, 'COLUMN';
exec sp_rename 'Organization.full_name', organization_full_name, 'COLUMN';
exec sp_rename 'EmployeesChanges.year', year_id, 'COLUMN';
exec sp_rename 'EmployeesChanges.position', employee_position, 'COLUMN';
exec sp_rename 'EmployeeChanges.department', employee_department, 'COLUMN';
exec sp_rename 'EmployeeChanges.accounting_type', employee_accounting_type, 'COLUMN';