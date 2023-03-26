--3.2.3
/*Студент прошел тестирование (то есть все его ответы занесены в таблицу testing),
далее необходимо вычислить результат(запрос) и занести его в таблицу attempt для соответствующей попытки.
Результат попытки вычислить как количество правильных ответов, деленное на 3
  (количество вопросов в каждой попытке) и умноженное на 100. Результат округлить до целого.
 Будем считать, что мы знаем id попытки,  для которой вычисляется результат, в нашем случае это 8.*/
drop table testing;
create table testing
(
    testing_id  int primary key identity,
    attempt_id  int,
    question_id int,
    answer_id   int,
    foreign key (attempt_id) references attempt (attempt_id) on delete cascade
)
go
insert into testing (attempt_id, question_id, answer_id)
values (1, 9, 25),
       (1, 7, 19),
       (1, 6, 17),
       (2, 3, 9),
       (2, 1, 2),
       (2, 4, 11),
       (3, 6, 18),
       (3, 8, 24),
       (3, 9, 28),
       (4, 1, 2),
       (4, 5, 16),
       (4, 3, 10),
       (5, 2, 6),
       (5, 1, 2),
       (5, 4, 12),
       (6, 6, 17),
       (6, 8, 22),
       (6, 7, 21),
       (7, 1, 3),
       (7, 4, 11),
       (7, 5, 16),
       (8, 7, 19),
       (8, 6, 17),
       (8, 8, 22);

select * from testing;
select * from attempt;

update attempt
set result = (select round(sum(result) * 100 / 3, 0) result
              from (select iif(is_correct = 1, sum(is_correct), 0) result
                    from answer
                             join testing t on answer.answer_id = t.answer_id
                             join attempt a on a.attempt_id = t.attempt_id
                             join subject s on s.subject_id = a.subject_id
                             join student s2 on s2.student_id = a.student_id
                    where a.attempt_id = 8
                    group by is_correct
                    ) temp
              )
where attempt_id = 8;

select * from attempt;

select round(sum(result) * 100 / 3, 0) result
from (select iif(is_correct = 1, sum(is_correct), 0) result
      from answer
               join testing t on answer.answer_id = t.answer_id
               join attempt a on a.attempt_id = t.attempt_id
               join subject s on s.subject_id = a.subject_id
               join student s2 on s2.student_id = a.student_id
      where a.attempt_id = 8
      group by is_correct) temp;
