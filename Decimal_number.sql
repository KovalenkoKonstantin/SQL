drop table if exists DecimalNumbers;
create table DecimalNumbers
(
    decimal_number_id int primary key identity (1,1),
    decimal_number    varchar(50)
);
insert into DecimalNumbers(decimal_number)
values ('ФРКЕ.00130-03-00-02'),
       ('ФРКЕ.00130-03-04-03'),
       ('ФРКЕ.00130-03-04-04'),
       ('ФРКЕ.00130-03-05-03'),
       ('ФРКЕ.00130-03-06-01'),
       ('ФРКЕ.00130-03-09-01'),
       ('ФРКЕ.465614.001-02'),
       ('ФРКЕ.465614.001-05'),
       ('ФРКЕ.465614.001-07'),
       ('ФРКЕ.465614.001-06'),
       ('ФРКЕ.00130-03-00-00'),
       ('ФРКЕ.00130-03-00-01'),
       ('ФРКЕ.00130-03-04-02'),
       ('ФРКЕ.00130-03-07-01'),
       ('ФРКЕ.00130-03-08-03');

alter table DecimalNumbers
	add project_id int
go

alter table DecimalNumbers
	add constraint FK_DecimalNumbers_project_id
		foreign key (project_id) references Project
go

UPDATE DecimalNumbers
SET project_id = 68
WHERE decimal_number_id = 1
UPDATE DecimalNumbers
SET project_id = 89
WHERE decimal_number_id = 7
UPDATE DecimalNumbers
SET project_id = 1089
WHERE decimal_number_id = 13
UPDATE DecimalNumbers
SET project_id = 88
WHERE decimal_number_id = 6
UPDATE DecimalNumbers
SET project_id = 75
WHERE decimal_number_id = 2
UPDATE DecimalNumbers
SET project_id = 1088
WHERE decimal_number_id = 12
UPDATE DecimalNumbers
SET project_id = 91
WHERE decimal_number_id = 8
UPDATE DecimalNumbers
SET project_id = 1091
WHERE decimal_number_id = 15
UPDATE DecimalNumbers
SET project_id = 1087
WHERE decimal_number_id = 11
UPDATE DecimalNumbers
SET project_id = 1090
WHERE decimal_number_id = 14
UPDATE DecimalNumbers
SET project_id = 93
WHERE decimal_number_id = 9
UPDATE DecimalNumbers
SET project_id = 79
WHERE decimal_number_id = 3
UPDATE DecimalNumbers
SET project_id = 95
WHERE decimal_number_id = 10
UPDATE DecimalNumbers
SET project_id = 80
WHERE decimal_number_id = 4
UPDATE DecimalNumbers
SET project_id = 82
WHERE decimal_number_id = 5

IF NOT EXISTS (
    SELECT 1
    FROM DecimalNumbers
    WHERE decimal_number = 'ФРКЕ.00130-03-04-06'
      AND project_id = 6557
)
BEGIN
    INSERT INTO DecimalNumbers (decimal_number, project_id)
    VALUES ('ФРКЕ.00130-03-04-06', 6557);
END

select * from DecimalNumbers

delete from DecimalNumbers
where project_id = 1088

ALTER TABLE DecimalNumbers
ADD CONSTRAINT PK_DecimalNumbers PRIMARY KEY (decimal_number);

SELECT *
FROM DecimalNumbers
WHERE decimal_number IS NULL;

ALTER TABLE DecimalNumbers
ALTER COLUMN decimal_number NVARCHAR(50) NOT NULL;

ALTER TABLE DecimalNumbers
ADD CONSTRAINT PK_DecimalNumbers PRIMARY KEY (decimal_number);

ALTER TABLE LabourIntensity
ADD CONSTRAINT FK_LabourIntensity_DecimalNumbers
FOREIGN KEY (decimal_number) REFERENCES DecimalNumbers(decimal_number);

SELECT *
FROM LabourIntensity li
WHERE li.decimal_number NOT IN (SELECT dn.decimal_number FROM DecimalNumbers dn);

UPDATE LabourIntensity
set decimal_number = 'ФРКЕ.00130-03-08-03'
where decimal_number = 'ФРКЕ.00130-03-00-01'