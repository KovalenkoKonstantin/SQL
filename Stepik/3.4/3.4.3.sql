--3.4.3
/*Из таблицы applicant,  созданной на предыдущем шаге, удалить записи,
  если абитуриент на выбранную образовательную программу не набрал минимального балла
  хотя бы по одному предмету (использовать запрос из предыдущего урока).*/
delete
from applicant
where (program_id, enrollee_id) in
      (select p.program_id, enrollee.enrollee_id
       from enrollee
                inner join program_enrollee pe on enrollee.enrollee_id = pe.enrollee_id
                inner join program p on p.program_id = pe.program_id
                inner join program_subject ps on p.program_id = ps.program_id
                inner join subject s on s.subject_id = ps.subject_id
                inner join enrollee_subject es on es.subject_id = s.subject_id
           and es.enrollee_id = enrollee.enrollee_id
       where result < min_result
       group by p.program_id, enrollee.enrollee_id);

/*delete from applicant USING applicant /*For MYSQL*/
inner join program_subject using(program_id)
inner join enrollee_subject using(subject_id,enrollee_id)
WHERE result < min_result;*/
