alter table Worktime
    add schedule_id int;

alter table Worktime
	add constraint FK_Worktime_schedule_id
		foreign key (schedule_id) references Schedule;

update Worktime
set schedule_id =
        (
            select schedule_id
            from Schedule
            where Worktime.schedule_description = Schedule.schedule_description
        );

select * from Worktime;

alter table Worktime
    drop column schedule_description;

alter table Worktime
    drop constraint FK_Worktime_tab_N;

alter table Worktime alter column tab_N varchar(10) not null;

alter table Worktime
	add constraint FK_Worktime_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from Worktime;

alter table Worktime
    drop constraint FK_Worktime_tab_N;

alter table Worktime alter column tab_N varchar(10) not null;

alter table Worktime
	add constraint FK_Worktime_tab_N
		foreign key (tab_N) references Employee (tab_N);

select * from Worktime;