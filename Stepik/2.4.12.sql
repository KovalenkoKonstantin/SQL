/*Выбрать всех клиентов, которые заказывали книги Достоевского, информацию вывести в
отсортированном по алфавиту виде. В решении используйте фамилию автора, а не его id.*/
select distinct name_client
from client
inner join buy b on client.client_id = b.client_id
inner join buy_book bb on b.buy_id = bb.buy_id
inner join book b2 on bb.book_id = b2.book_id
inner join author a on b2.author_id = a.author_id
where name_author='Достоевский Ф.М.'--2
order by name_client

select * from author;
select * from buy_book;
select * from book;--3,4,5
