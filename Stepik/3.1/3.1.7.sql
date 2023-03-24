--3.1.7
/*Случайным образом отберите 3 вопроса по дисциплине «Основы баз данных».
  В результат включите столбцы question_id и name_question.*/
select top 3 question_id, name_question
from question
inner join subject s on s.subject_id = question.subject_id
where s.name_subject like 'Основы баз данных'
order by rand()
--limit 3;
