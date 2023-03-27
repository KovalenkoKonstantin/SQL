--3.3.4
/*Выведите количество абитуриентов, сдавших ЕГЭ по каждому предмету, максимальное,
  минимальное и среднее значение баллов по предмету ЕГЭ. Вычисляемые столбцы назвать Количество,
  Максимум, Минимум, Среднее. Информацию отсортировать по названию предмета в алфавитном порядке,
  среднее значение округлить до одного знака после запятой.*/
select name_subject, count(es.enrollee_id) Количество,
       max(es.result) Максимум,
           min(es.result) Минимум,
       round(sum(es.result) / count(es.enrollee_id),1) Среднее
from subject
         inner join enrollee_subject es on subject.subject_id = es.subject_id
group by name_subject
order by 1 asc;
