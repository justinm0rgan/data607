DROP TABLE IF EXISTS title_authors;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS authors;

CREATE TABLE titles
(
  title_id int PRIMARY KEY,
  title varchar(100) NOT NULL UNIQUE
);

INSERT INTO titles (title_id, title) VALUES ( 1, 'Elements of Statistical Learning');
INSERT INTO titles (title_id, title) VALUES ( 2, 'Introduction to Statistical Learning');

SELECT *
 FROM titles;

CREATE TABLE authors
(
  author_id int PRIMARY KEY,
  lastname varchar(30) NOT NULL,
  firstname varchar(30) NULL
);

INSERT INTO authors (author_id, lastname, firstname) VALUES ( 1, 'Hastie', 'Trevor');
INSERT INTO authors (author_id, lastname, firstname) VALUES ( 2, 'Tibshiraini', 'Robert');
INSERT INTO authors (author_id, lastname, firstname) VALUES ( 3, 'Friedman', 'Jerome');
INSERT INTO authors (author_id, lastname, firstname) VALUES ( 4, 'James', 'Gareth');
INSERT INTO authors (author_id, lastname, firstname) VALUES ( 5, 'Witten', 'Daniela');

SELECT * 
  FROM authors 
  ORDER BY lastname, firstname;

CREATE TABLE title_authors
(
  title_id int NOT NULL REFERENCES titles(title_id),
  author_id int NOT NULL REFERENCES authors(author_id),
  CONSTRAINT pk_title_authors PRIMARY KEY(title_id, author_id)
 );

INSERT INTO title_authors ( title_id, author_id) VALUES ( 1, 1);
INSERT INTO title_authors ( title_id, author_id) VALUES ( 1, 2);
INSERT INTO title_authors ( title_id, author_id) VALUES ( 1, 3);
INSERT INTO title_authors ( title_id, author_id) VALUES ( 2, 1);
INSERT INTO title_authors ( title_id, author_id) VALUES ( 2, 2);
INSERT INTO title_authors ( title_id, author_id) VALUES ( 2, 4);
INSERT INTO title_authors ( title_id, author_id) VALUES ( 2, 5);

SELECT * FROM title_authors;

SELECT t.title, a.lastname, a.firstname
  FROM titles t LEFT JOIN title_authors ta ON t.title_id = ta.title_id
                LEFT JOIN authors a ON ta.author_id = a.author_id
ORDER BY t.title, a.lastname, a.firstname;

SELECT a.lastname, a.firstname, t.title
  FROM titles t LEFT JOIN title_authors ta ON t.title_id = ta.title_id
                LEFT JOIN authors a ON ta.author_id = a.author_id
ORDER BY a.lastname, a.firstname, t.title;
 
