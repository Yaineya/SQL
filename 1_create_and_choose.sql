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

-- TASK 3
-- В конце года цену всех книг на складе пересчитывают – снижают ее на 30%. 
-- Написать SQL запрос, который из таблицы book выбирает названия, авторов, количества и вычисляет новые цены книг. 
-- Столбец с новой ценой назвать new_price, цену округлить до 2-х знаков после запятой.

select title, author, amount, round( price * 0.7 ,2) as new_price
from book

-- TASK 4
-- Решили поднять цену книг Булгакова на 10%, а цену книг Есенина - на 5%. 
-- Написать запрос, куда включить автора, название книги и новую цену, последний столбец назвать new_price. 
-- Значение округлить до двух знаков после запятой.

select author, title, 
round( 
    case 
    	when author = 'Булгаков М.А.' then price * 1.1 
     	when author = 'Есенин С.А.' then price * 1.05 
     	else price
     	end, 2)
   as new_price
from book

-- TASK 5
-- Вывести автора, название  и цены тех книг, количество которых меньше 10.

select author, title, price from book
where amount < 10

-- TASK 6
-- Вывести название, автора,  цену  и количество всех книг, цена которых меньше 500 или больше 600, 
-- а стоимость всех экземпляров этих книг больше или равна 5000.

select title ,author, price, amount
from book
where (price < 500 or price > 600) and price*amount >= 5000

-- TASK 7
-- Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы),
-- а количество или 2, или 3, или 5, или 7

select title, author
from book
where price between 540.50 and 800 and amount in(2,3,5,7)

-- TASK 8
-- Вывести  автора и название  книг, количество которых принадлежит интервалу от 2 до 14 (включая границы). 
-- Информацию  отсортировать сначала по авторам (в обратном алфавитном порядке), а затем по названиям книг (по алфавиту).

select author, title
from book
where amount between 2 and 14
order by author desc, title asc

-- TASK 9
-- Вывести название и автора тех книг, название которых состоит из двух и более слов, а инициалы автора содержат букву «С». 
-- Считать, что в названии слова отделяются друг от друга пробелами и не содержат знаков препинания, между фамилией 
-- автора и инициалами обязателен пробел, инициалы записываются без пробела в формате: буква, точка, буква, точка. 
-- Информацию отсортировать по названию книги в алфавитном порядке.

select title, author
from book
where title like "%_% %_%" and author like '%С.%'
group by title 