--3.2.1
exec ClearTables31 go exec SubjectCreation go exec SubjectInsertion go exec StudentCreation go exec StudentInsertion go
exec AttemptCreation go exec AttemptInsertion go exec QuestionCreation go exec QuestionInsertion go exec AnswerCreation
go exec AnswerInsertion go exec TestingCreation go exec TestingInsertion;
/*В таблицу attempt включить новую попытку для студента Баранова Павла по дисциплине
  «Основы баз данных». Установить текущую дату в качестве даты выполнения попытки.*/
insert into attempt(student_id, subject_id, date_attempt, [result])
select st.student_id, s.subject_id, getdate(), null
from student st
         inner join attempt a on st.student_id = a.student_id
         inner join subject s on s.subject_id = a.subject_id
where name_student like 'Баранов Павел'
  and name_subject like 'Основы баз данных';

select * from attempt;
