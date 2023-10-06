alter table EmployeeChanges
    add schedule_id int;

alter table EmployeeChanges
	add constraint FK_EmployeeChanges_schedule_id
		foreign key (schedule_id) references Schedule;

update EmployeeChanges
set schedule_id =
        (
            select schedule_id
            from Schedule
            where EmployeeChanges.schedule_description = Schedule.schedule_description
        );

select * from EmployeeChanges;

alter table EmployeeChanges
    drop column schedule_description;
