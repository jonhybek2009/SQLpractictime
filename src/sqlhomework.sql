create type genre as enum ('DETECTIVE', 'DRAMA', 'HISTORY', 'ROMANCE', 'BIOGRAPHY', 'FANTASY');
create type gender as enum ('Male', 'Female');

create table publishers (
                            id serial primary key,
                            name varchar
);
create table languages(
                          id serial primary key,
                          name varchar
);
create table authors (
                         id serial primary key,
                         first_name varchar,
                         last_name varchar,
                         email varchar,
                         date_Of_Birth date,
                         country varchar,
                         gender gender
);
create table books (
                       id serial primary key,
                       name varchar,
                       country varchar,
                       published_year date,
                       price int,
                       genre genre
);
--TODO 1.0 -------------------------------------------------------------------------------------------
alter table languages alter column name set not null;
--TODO 1.1 -------------------------------------------------------------------------------------------
alter table authors add constraint unique_author_email unique(email);
--TODO 1.2 -------------------------------------------------------------------------------------------
alter table books add column language_id int;
--TODO 1.3 -------------------------------------------------------------------------------------------
alter table books add constraint fk_language foreign key (language_id) references languages(id);
--TODO 1.4 -------------------------------------------------------------------------------------------
alter table books add column publisher_id int;
--TODO 1.5 -------------------------------------------------------------------------------------------
alter table books add constraint fk_publisher_id foreign key (publisher_id) references publishers(id);
--TODO 1.6 -------------------------------------------------------------------------------------------
alter table books add column author_id int;
--TODO 1.7-------------------------------------------------------------------------------------------
alter table books add constraint fk_author_id foreign key (author_id) references authors(id);

--TODO-------------------------------------------------------------------------------------------
--TODO-------------------------------------------------------------------------------------------
--TODO-------------------------------------------------------------------------------------------
--TODO-------------------------------------------------------------------------------------------
insert into publishers(name)
values ('RELX Group'),
       ('Thomson Reuters'),
       ('Holtzbrinck Publishing Group'),
       ('Shanghai Jiao Tong University Press'),
       ('Wolters Kluwer'),
       ('Hachette Livre'),
       ('Aufbau-Verlag'),
       ('Macmillan'),
       ('Harper Collins'),
       ('China Publishing Group'),
       ('Springer Nature'),
       ('Grupo Planeta'),
       ('Books.Ru Ltd.St Petersburg'),
       ('The Moscow Times'),
       ('Zhonghua Book Company');
insert into authors(first_name, last_name, email, date_of_birth, country, gender)
values
    ('Sybilla', 'Toderbrugge', 'stoderbrugge0@jugem.jp', '2020-12-12', 'France', 'Female'),
    ('Patti', 'Walster', 'pwalster1@addtoany.com', '1965-10-31', 'China', 'Female'),
    ('Sonnie', 'Emmens', 'semmens2@upenn.edu', '1980-05-16', 'Germany', 'Male'),
    ('Brand', 'Burel', 'bburel3@ovh.net', '1964-04-24', 'United States', 'Male'),
    ('Silvan', 'Smartman', 'ssmartman4@spiegel.de', '1967-07-03', 'France', 'Male'),
    ('Alexey', 'Arnov', 'larnoldi5@writer.com', '1964-12-29', 'Russia', 'Male'),
    ('Bunni', 'Aggio', 'baggio6@yahoo.co.jp', '1983-12-14', 'China', 'Female'),
    ('Viole', 'Sarath', 'vsarath7@elegantthemes.com', '1960-01-29', 'United States', 'Female'),
    ('Boigie', 'Etridge', 'betridge8@ed.gov', '1978-11-17', 'France', 'Male'),
    ('Hilliard', 'Burnsyde', 'hburnsyde9@omniture.com', '1962-09-08', 'Germany', 'Male'),
    ('Margarita', 'Bartova', 'mbartova@example.com', '1984-12-03', 'Russia', 'Female'),
    ('Innis', 'Hugh', 'ihughb@marriott.com', '1983-08-28', 'Germany', 'Male'),
    ('Lera', 'Trimnella', 'ltrimnellc@msn.com', '1980-03-28', 'Russia', 'Female'),
    ('Jakob', 'Bransby', 'jbransbyd@nasa.gov', '1966-08-05', 'Spain', 'Male'),
    ('Loretta', 'Gronaver', 'lgronavere@technorati.com', '1962-10-17', 'United States', 'Female');

insert into languages(name)
values ('English'),
       ('French'),
       ('German'),
       ('Chinese'),
       ('Russian'),
       ('Spanish');


insert into books(name, country, published_year, price, genre, language_id, publisher_id, author_id)
values ('Taina', 'Russia', '2021-11-12', '568', 'DETECTIVE', '5', '12', '6'),
       ('Zvezdopad', 'Russia', '2004-12-09', '446', 'ROMANCE', '5', '13', '11'),
       ('Homo Faber', 'Germany', '2022-04-10', '772', 'FANTASY', '3', '5', '3'),
       ('Der Richter und Sein Henker', 'Germany', '2011-02-01', '780', 'DETECTIVE', '3', '3', '10'),
       ('Lord of the Flies', 'United States', '2015-07-11', '900', 'FANTASY', '1', '2', '4'),
       ('Un soir au club', 'France', '2018-01-12', '480', 'DRAMA', '2', '1', '1'),
       ('Voina', 'Russia', '2004-12-06', '880', 'HISTORY', '5', '4', '13'),
       ('Sun Tzu', 'China', '2022-09-05', '349', 'HISTORY', '4', '4', '2'),
       ('Emil und die Detektive', 'Germany', '2010-06-11', '228', 'DETECTIVE', '3', '5', '10'),
       ('Coule la Seine', 'France', '2015-03-01', '732', 'FANTASY', '2', '6', '1'),
       ('Love and hatred', 'Russia', '2012-02-03', '763', 'ROMANCE', '5', '14', '13'),
       ('Fantastic Mr Fox', 'United States', '2018-03-10', '309', 'FANTASY', '1', '9', '8'),
       ('Contes de la Bécasse', 'France', '2019-10-05', '378', 'ROMANCE', '2', '6', '9'),
       ('The Death of Ivan Ilyich', 'Russia', '2000-09-24', '814', 'DRAMA', '5', '6', '6'),
       ('Bonjour Tristesse', 'France', '2015-08-02', '502', 'ROMANCE', '2', '8', '5'),
       ('Die Verwandlung', 'Germany', '2008-06-19', '305', 'DETECTIVE', '3', '7', '12'),
       ('The Inspector Barlach Mysteries', 'Germany', '2007-03-10', '566', 'DETECTIVE', '3', '3', '3'),
       ('LÉtranger', 'France', '2017-11-14', '422', 'ROMANCE', '2', '8', '5'),
       ('Lao Tse', 'China', '2005-07-16', '900', 'FANTASY', '4', '4', '2'),
       ('Semya', 'Russia', '2004-04-12', '194', 'DRAMA', '5', '13', '11'),
       ('Empty World', 'United States', '2008-01-04', '324', 'FANTASY', '1', '11', '15'),
       ('Domainer', 'Germany', '2020-01-06', '420', 'ROMANCE', '3', '5', '10'),
       ('The Fault in Our Stars', 'United States', '2008-02-13', '396', 'ROMANCE', '1', '9', '4'),
       ('Die Räuber', 'Germany', '2020-06-25', '300', 'ROMANCE', '3', '7', '12'),
       ('Jung Chang', 'China', '2021-05-14', '600', 'HISTORY', '4', '10', '7'),
       ('Les Aventures de Tintin', 'France', '2015-04-10', '582', 'DRAMA', '2', '1', '5'),
       ('Unvollendete Geschichte', 'Germany', '2010-12-12', '269', 'DETECTIVE', '3', '5', '10'),
       ('Amy Tan', 'China', '2023-01-09', '486', 'DRAMA', '4', '4', '7'),
       ('Krasnaya luna', 'Russia', '2020-02-07', '550', 'FANTASY', '5', '12', '11'),
       ('Emma', 'United States', '2021-10-11', '599', 'BIOGRAPHY', '1', '2', '15');
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TODO 1👇 ---мне надо вывести, название книги, его жанр и год выпуска
select books.name, books.published_year, genre from books; --ну тут просто, чисто по переводу можно понять || выберите название, год публикации, жанр из списка книг;

--TODO 2👇--- пусть выведутся страны авторов ввиде уникальностей в ед.экземпляре
select distinct authors.country, authors.first_name, authors.last_name  from authors;--я тут добавил ещё имя и фамилию чтобы было конкретнее

--TODO 3👇 ---должно вывестись те книги которые вышли между 2020-2023 годов
select * from books where books.published_year between '2020-01-01' and '2023-12-31'; -- тут все ясно

--TODO 4👇 ---мне нужно вывести книги жанра детектив и их названия
select books.name, books.genre from books where genre = 'DETECTIVE'; -- выбрать все кни

--TODO 5👇 --- надо вывести имя и фамилию автора в одном столбце
select concat(authors.first_name, ' ' , authors.last_name ) as full_name_of_authors from authors; -- concat выступает в роли объеденения./ и в конце я типа приказываю вывести конечный результат изпользуя as

--TODO 6👇 --- надо вывести автором из стран таких как Франция и Германия
select concat(authors.first_name,' ',authors.last_name) as full_Name, authors.country from authors where authors.country in ('Germany','France') order by full_Name;

--TODO 7👇 --- вывести нужно те книги кроме Романа и цена у которых ниже 500, вывести имя книги страна в которой она вышла и так же и цена и жанр
select books.name , books.country, books.published_year, books.price, books.genre from books where genre != 'ROMANCE' and books.price < 500;-- тут изпользуется ! что озночает тут|| where genre != 'ROMANCE'|| ГДЕ ГЕНДЕР НЕ РАВЕН РОМАНУ, он исключает из списка роман выводя остальные

--TODO 8👇 --- создать запрос в котором вывести только трех авторов женмкого пола
select * from authors where gender  = 'Female' limit 3; -- limit озночает что и по названию создает лимит, тут надо вывести менно только троих не больше

--TODO 9👇 --- создать запрос в котором надо вывести людей так же женского пола и имена у них содержат только 4 буквы так же их почта должна содержать окончание .com
select * from authors where gender = 'Female' and  authors.email like '%.com' and length(authors.first_name )= 4;

--TODO 10👇 --- как я понял надо вывести стран в которых есть по три автора(не особо понял) ну ещё и сортируя
--select authors.country, count(authors.id) from authors group by authors.country

--TODO 11👇 --- сколько по жанрам есть книги с максимальной стоимостью, конкретнее их макс цена на один жанр
select genre , max(books.price) from  books group by genre;

--TODO 12👇 --- среди жанров роман и детектив надо вывести самые дешевые
select genre, min(books.price) from books where genre in ('ROMANCE','DETECTIVE') group by genre;

--TODO 13👇 --- количество книг по биографии и истории ну их колво кароче
select genre , count(genre) from books where genre in ('BIOGRAPHY','HISTORY') group by genre;

--TODO 14👇 ---
select books.name, publishers.id from books join publishers on books.publisher_id= publishers.id;

--TODO 15👇 --- надо вывести имена издательсвт и их языки
select authors.first_name ,authors.last_name, authors.email,authors.date_Of_Birth, authors.country, gender, publishers.name
from authors left join books on authors.id = books.author_id left join publishers on books.id = publishers.id;

--TODO 16👇 --- надо вывести всю информацию о авторах и их издательства, а если нету издательства то должен выйти null
select authors.first_name ,authors.last_name, books.name from authors left join books on authors.id= books.author_id;

--TODO 17👇 --- по какому язку есть те книги, их кол-во надо сортироватт с низу в вверх
select languages.name, count(books.id) from languages join books on languages.id= books.language_id group by languages.name order by languages.name desc;

--TODO 18👇 --- надо вывести мена издательств и их зарплату при этом найдя среднее число округлив его
select publishers.name, round(avg(books.price)) from publishers join books on publishers.id = books.publisher_id group by publishers.name order by publishers.name desc;

--TODO 19👇 --- с 2010 по 2015 надо вывести авторов с именем и фамилией
select authors.first_name, authors.last_name, books.name from authors join books on authors.id = books.author_id where books.published_year between '2010-01-01' and '2015-12-31';

--TODO 20👇 --- надо снова так же с 2010-2015 года вывести  фуллл имена и фамилии и общую сумму их зарплат
select concat(authors.first_name,' ',authors.last_name) as fullName, sum(books.price) from authors join books on authors.id = books.author_id where books.published_year between '2010-01-01' and '2015-12-31' group by fullName;
