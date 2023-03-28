--2.3.8
/*Удалить всех авторов, которые пишут в жанре "Поэзия". Из таблицы book удалить все книги этих авторов. 
  В запросе для отбора авторов использовать полное название жанра, а не его id.*/
/*DELETE
FROM author USING
    author
    INNER JOIN book
ON author.author_id = book.author_id
WHERE book.amount < 3;*/
SELECT * FROM author;
SELECT * FROM book;
SELECT * FROM supply;
SELECT * FROM genre;

/*DELETE
FROM author USING /*не работает в TSQL*/
    author
    INNER JOIN book
ON author.author_id = book.author_id
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE name_genre = 'Поэзия';*/
