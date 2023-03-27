--3.3.7
/*Посчитать, сколько дополнительных баллов получит каждый абитуриент. Столбец с дополнительными баллами
  назвать Бонус. Информацию вывести в отсортированном по фамилиям виде.*/
select name_enrollee, iif(sum(bonus) is Null, 0,  sum(bonus)) Бонус
from enrollee
left join enrollee_achievement ea on enrollee.enrollee_id = ea.enrollee_id
left join achievement a on a.achievement_id = ea.achievement_id
group by name_enrollee
order by name_enrollee asc;

select * from enrollee_achievement;
select * from achievement;
select * from enrollee;
