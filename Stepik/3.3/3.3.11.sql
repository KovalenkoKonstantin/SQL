--3.3.11
/*Вывести название образовательной программы и фамилию тех абитуриентов, которые подавали документы
  на эту образовательную программу, но не могут быть зачислены на нее. Эти абитуриенты имеют результат
  по одному или нескольким предметам ЕГЭ, необходимым для поступления на эту образовательную программу,
  меньше минимального балла. Информацию вывести в отсортированном сначала по программам, а потом
  по фамилиям абитуриентов виде.

Например, Баранов Павел по «Физике» набрал 41 балл, а  для образовательной программы
  «Прикладная механика» минимальный балл по этому предмету определен в 45 баллов. Следовательно,
  абитуриент на данную программу не может поступить.*/

-- Для этого задания в базу данных добавлена строка:
INSERT INTO enrollee_subject (enrollee_id, subject_id, result) VALUES (2, 3, 41);

select name_program, name_enrollee
from enrollee
         inner join program_enrollee pe on enrollee.enrollee_id = pe.enrollee_id
         inner join program p on p.program_id = pe.program_id
         inner join program_subject ps on p.program_id = ps.program_id
         inner join subject s on s.subject_id = ps.subject_id
         inner join enrollee_subject es on es.subject_id = s.subject_id
    and es.enrollee_id = enrollee.enrollee_id
where result < min_result
group by name_program, name_enrollee
order by 1, 2;
