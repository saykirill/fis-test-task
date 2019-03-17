# Тестовое задание для стажеров аналитиков-технологов

_@ Воронин Кирилл_

## Задание

Необходимо разработать некоторые части приложения для учета книг в библиотеке. Описание данных, с которыми будет работать приложение – ниже.

Приложение для учета книг в библиотеке должно:
1. Хранить названия книг, ФИО авторов, наименования издательств, год издания.
2. Учитывать имеющиеся в библиотеке экземпляры конкретной книги.
3. Учитывать студентов, которым выдавалась конкретная книга. При каждой выдаче книги студенту, фиксируется дата выдачи. При возврате – дата возврата книги.

Задания:
1.	Опишите модель данных (в любом удобном для вас представлении) для обслуживания библиотеки. Это может быть описание таблиц с типами данных, диаграмма – что угодно.
2.	Напишите SQL-запрос, который бы возвращал самого популярного автора за год. Запрос должен основываться на модели данных, которую вы описали в задании 1. 
3.	Определите понятие «злостный читатель».  Предложите алгоритм для поиска самого злостного читателя библиотеки. На любом языке программирования опишите алгоритм поиска такого читателя. Алгоритм должен основываться на модели данных, которую вы описали в задании 1.

## Реализация

**1.	Опишите модель данных (в любом удобном для вас представлении) для обслуживания библиотеки. Это может быть описание таблиц с типами данных, диаграмма – что угодно.**

* Для описания модели данных будем использовать представление в виде таблиц с типами данных. Создадим три таблицы: книги, студенты и регистрация (для учета дат выдачи и возврата).

|Имя таблицы|Имя поля	|Тип поля	|Примечание |Описание
|-----------|-----------|-----------|:---------:|:--------------------------
|book    	|id	        |Integer(10)|PRIMARY_KEY|Учёт книг
|	        |bookName	|Char(45)	|           |Название
|	        |author	    |Char(45)   |           |Автор
|	        |publisher	|Char(45)   |           |Издатель
|        	|bookYear	|Date	    |           |Год
|        	|quantity	|Integer(4)	|           |Количество 
|student	|id	        |Integer(10)|PRIMARY_KEY|Учёт студентов           
|	        |studName   |Char(45)   |           |ФИО	
|registry	|id	        |Integer(10)|PRIMARY_KEY|Журнал учёта           
|        	|bookId	    |Integer(10)|           |Инвентарный номер книги
|       	|studId	    |Integer(10)|           |Номер читательского билета	
|        	|startDate	|Date	    |           |Дата выдачи
|        	|endDate	|Date	    |           |Дата возврата

**2.	Напишите SQL-запрос, который бы возвращал самого популярного автора за год. Запрос должен основываться на модели данных, которую вы описали в задании 1.**
* Запрос возвращает самого верхнего автора из отсортированных по количеству выдачи его книг. Для выбора года, в уже готовом приложении будет необходимо его запрашивать и передавать заместо '2018'.
```
SELECT author
FROM
(
	SELECT author, startDate, COUNT(author) AS cnt
	FROM registry
	INNER JOIN book 
	ON book.id = registry.bookid
	WHERE YEAR(startDate)='2018'
	GROUP BY author
	ORDER BY cnt DESC
) AS tmp
LIMIT 1;
```

**3.	Определите понятие «злостный читатель».  Предложите алгоритм для поиска самого злостного читателя библиотеки. На любом языке программирования опишите алгоритм поиска такого читателя. Алгоритм должен основываться на модели данных, которую вы описали в задании 1.**
