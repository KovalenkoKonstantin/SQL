--3.4.4
/*Повысить итоговые баллы абитуриентов в таблице applicant на значения дополнительных баллов
  (использовать запрос из предыдущего урока).*/
/* В запросах на обновление можно использовать несколько связанных таблиц.
   Например, чтобы обновить поле itog таблицы applicant для записей,
   относящихся к образовательной программе «Прикладная механика», используется запрос:*/
UPDATE
    applicant
    --INNER JOIN program ON applicant.program_id = program.program_id /*For MYSQL*/
SET itog = 2
    --WHERE name_program = "Прикладная механика";

select * from applicant
order by 1, 3 desc;
select enrollee.enrollee_id, iif(sum(bonus) is Null, 0, sum(bonus)) Бонус
from enrollee
         left join enrollee_achievement ea on enrollee.enrollee_id = ea.enrollee_id
         left join achievement a on a.achievement_id = ea.achievement_id
group by enrollee.enrollee_id
order by enrollee.enrollee_id asc;
select iif(sum(bonus) is Null, 0, sum(bonus)) Бонус
from enrollee
         left join enrollee_achievement ea on enrollee.enrollee_id = ea.enrollee_id
         left join achievement a on a.achievement_id = ea.achievement_id
group by enrollee.enrollee_id;


update applicant
set itog = itog + Бонус
    from (select enrollee.enrollee_id, iif(sum(bonus) is Null, 0, sum(bonus)) Бонус
          from enrollee
                   left join enrollee_achievement ea on enrollee.enrollee_id = ea.enrollee_id
                   left join achievement a on a.achievement_id = ea.achievement_id
          group by enrollee.enrollee_id) temp
where applicant.enrollee_id = temp.enrollee_id;

/*--MYSQL
UPDATE applicant JOIN (
    SELECT enrollee_id, IFNULL(SUM(bonus), 0) AS Бонус FROM enrollee_achievement
    LEFT JOIN achievement USING(achievement_id)
    GROUP BY enrollee_id
    ) AS t USING(enrollee_id)
SET itog = itog + Бонус;*/
