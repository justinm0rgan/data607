-- book_publishers.sql

DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS publishers;

CREATE TABLE publishers
(
  publisher_id int PRIMARY KEY,
  publisher varchar(30) NOT NULL
);

INSERT INTO publishers (publisher_id, publisher) VALUES (1, 'Springer');
INSERT INTO publishers (publisher_id, publisher) VALUES (2, 'O''Reilly');

SELECT * FROM publishers;

CREATE TABLE titles
(
  title_id int PRIMARY KEY,
  title varchar(100) NOT NULL UNIQUE,
  publisher_id int NULL REFERENCES publishers(publisher_id)
);

INSERT INTO titles (title_id, title, publisher_id) VALUES ( 1, 'Elements of Statistical Learning', 1);
INSERT INTO titles (title_id, title, publisher_id) VALUES ( 2, 'Introduction to Statistical Learning', 1);
INSERT INTO titles (title_id, title, publisher_id) VALUES ( 3, 'Easy Peasy Database Modeling', NULL);

SELECT *
 FROM titles;

SELECT t.title, p.publisher
  FROM titles t INNER JOIN publishers p ON t.publisher_id = p.publisher_id;

SELECT t.title, p.publisher
  FROM titles t JOIN publishers p ON t.publisher_id = p.publisher_id;
  
SELECT t.title, p.publisher
  FROM titles t LEFT JOIN publishers p ON t.publisher_id = p.publisher_id;

SELECT t.title, p.publisher
  FROM titles t RIGHT JOIN publishers p ON t.publisher_id = p.publisher_id;

SELECT t.title, p.publisher
  FROM publishers p LEFT JOIN titles t ON t.publisher_id = p.publisher_id;

  
SELECT t.title, p.publisher
  FROM titles t FULL JOIN publishers p ON t.publisher_id = p.publisher_id;

 SELECT t.title, p.publisher
  FROM titles t CROSS JOIN publishers p;

  
  
  
  