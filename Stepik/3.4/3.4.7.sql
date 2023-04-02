--3.4.7

alter table applicant_order drop column str_id;
select * from applicant_order;

DECLARE @row_num int;
SET @row_num = 0;
EXECUTE ('
    SELECT *, ' + @row_num + 'AS str_num FROM applicant_order;
');

declare @num_pr int;
SET @num_pr = 0;
SET @row_num = 1;

execute ('
SELECT *,
iif(program_id = @num_pr, @row_num = @row_num + 1, @row_num = 1) AS str_num,
   @num_pr = program_id AS add_var
   from applicant_order
    ');

/*Занести в столбец str_id таблицы applicant_order нумерацию абитуриентов,
  которая начинается с 1 для каждой образовательной программы.*/
select * from applicant_order;
alter table applicant_order add str_id int;

SET @num_pr := 1;
SET @row_num := 0;
update applicant_order
set str_id = if (@num_pr = program_id, @row_num := @row_num + 1, @row_num := 1 and @num_pr := program_id);

SELECT *FROM applicant_order;
