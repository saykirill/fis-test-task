/*MYSQL 8.0.15*/
DROP DATABASE IF EXISTS library;
CREATE DATABASE IF NOT EXISTS library;
USE library;

CREATE TABLE `book` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bookName` char(45) DEFAULT NULL,
  `author` char(45) DEFAULT NULL,
  `publisher` char(45) DEFAULT NULL,
  `bookYear` int(4) DEFAULT NULL,
  `quantity` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `studName` char(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `registry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bookId` int(10) DEFAULT NULL,
  `studId` int(10) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
);

/*----------------------------------------------------------------------------------------------------------------*/
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга0', 'автор0', 'издательство0', '1930', '5');
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга1', 'автор1', 'издательство1', '1921', '11');
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга2', 'автор2', 'издательство2', '1924', '10');
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга3', 'автор2', 'издательство3', '1992', '2');
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга4', 'автор4', 'издательство4', '1950', '8');
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга5', 'автор5', 'издательство5', '1959', '10');
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга6', 'автор5', 'издательство6', '1957', '8');
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга7', 'автор7', 'издательство7', '1993', '8');
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга8', 'автор8', 'издательство8', '1993', '9');
INSERT INTO book (bookName, author, publisher, bookYear, quantity) VALUE ('книга9', 'автор9', 'издательство9', '1939', '5');

INSERT INTO student (studName) VALUE ('студент0');
INSERT INTO student (studName) VALUE ('студент1');
INSERT INTO student (studName) VALUE ('студент2');
INSERT INTO student (studName) VALUE ('студент3');
INSERT INTO student (studName) VALUE ('студент4');

INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('6', '5', '2018-01-30', '2018-02-04');
INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('6', '3', '2018-02-10', '2018-03-04');
INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('1', '5', '2018-02-28', '2018-03-25');
INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('6', '5', '2018-03-03', '2018-03-23');
INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('1', '1', '2018-06-11', '2018-06-19');
INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('3', '3', '2018-06-21', '2018-06-28');
INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('3', '1', '2018-07-05', '2018-07-09');
INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('1', '4', '2018-08-07', '2018-08-14');
INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('7', '2', '2018-08-09', '2018-08-16');
INSERT INTO registry (bookId, studId, startDate, endDate) VALUE ('9', '2', '2018-08-26', '2018-12-31');
/*----------------------------------------------------------------------------------------------------------------*/
