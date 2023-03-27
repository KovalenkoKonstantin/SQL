--3.3.6
/*Вывести образовательные программы, которые имеют самый большой план набора,  вместе с этой величиной.*/
select name_program, [plan]
from program
where [plan] = (
    select max([plan])
    from program
    );
