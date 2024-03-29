--3.1.10
/*Для каждого вопроса вывести процент успешных решений, то есть отношение количества верных ответов
  к общему количеству ответов, значение округлить до 2-х знаков после запятой. Также вывести название
  предмета, к которому относится вопрос, и общее количество ответов на этот вопрос. В результат
  включить название дисциплины, вопросы по ней (столбец назвать Вопрос), а также два вычисляемых
  столбца Всего_ответов и Успешность. Информацию отсортировать сначала по названию дисциплины,
  потом по убыванию успешности, а потом по тексту вопроса в алфавитном порядке.

Поскольку тексты вопросов могут быть длинными, обрезать их 30 символов и добавить многоточие "...".*/
select name_subject,
       concat(left(name_question, 30), '...')               Вопрос,
       count(a.answer_id)                                   Всего_ответов,
       round(sum(is_correct) * 100 / count(a.answer_id), 2) Успешность
from subject
         inner join question q on subject.subject_id = q.subject_id
         inner join answer a on q.question_id = a.question_id
         inner join testing t on a.answer_id = t.answer_id
group by name_subject, name_question
order by 1, 4 desc, 2 asc;
