-- PostgreSQL

create table book(
    book_id serial primary key,
    title varchar(50),
    author varchar(30),
    price decimal(8, 2),
    amount int
);

insert into book (title, author, price, amount)
values ('Мастер и Маргарита', 'Булгаков М.А.', 670.99,	3),
	   ('Белая гвардия', 'Булгаков М.А.', 540.50, 5), 
       ('Идиот', 'Достоевский Ф.М.', 460.00, 10),
       ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2),
       ('Стихотворения и поэмы', 'Есенин С.А.', 650.00,	15);

select * from book;

-- ============

-- TASK 1  
-- Выбрать названия книг и авторов из таблицы book, 
-- для поля title задать имя(псевдоним) Название, для поля author –  Автор.

select title as Название, author as Автор
from book;

-- TASK 2
-- Для упаковки каждой книги требуется один лист бумаги, цена которого 1 рубль 65 копеек. 
-- Посчитать стоимость упаковки для каждой книги (сколько денег потребуется, чтобы упаковать все экземпляры книги). 
-- В запросе вывести название книги, ее количество и стоимость упаковки, последний столбец назвать pack

select title, amount, amount * 1.65 as pack
from book;
