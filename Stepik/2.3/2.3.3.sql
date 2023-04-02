--2.3.3
SELECT name_author, supply.author
FROM author
         RIGHT JOIN supply ON author.name_author = supply.author;

SELECT supply.author
FROM author
         RIGHT JOIN supply on author.name_author = supply.author
WHERE name_author IS Null;
/*Включить новых авторов в таблицу author с помощью запроса на добавление, 
  а затем вывести все данные из таблицы author.  Новыми считаются авторы, 
  которые есть в таблице supply, но нет в таблице author.*/
insert into author(name_author)
SELECT supply.author
FROM author
         RIGHT JOIN supply on author.name_author = supply.author
WHERE name_author IS Null;
select * from author;
