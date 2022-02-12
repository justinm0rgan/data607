-- start by creating a new database, e.g. movies
-- make sure that you're in that database before you run the script

-- create tables
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS ratings;

CREATE TABLE people (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(255) NOT NULL
);

INSERT INTO people VALUES
(1, 'Sean Forte'),
(2, 'Ryan Blecher'),
(3, 'Conrad Mata'),
(4, 'Kat Lees'),
(5, 'Darren Nanos');

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    year INT NOT NULL
);

INSERT INTO movies VALUES
(1, 'Dune', 2021),
(2, 'The French Dispatch', 2021),
(3, 'Godzilla vs. Kong', 2021),
(4, 'Army of the Dead', 2021),
(5, 'Pig', 2021),
(6, 'Black Widow', 2021);

CREATE TABLE ratings (
    person_id INT REFERENCES people ON DELETE RESTRICT,
    movie_id INT REFERENCES movies ON DELETE CASCADE,
    rating INT,
    PRIMARY KEY (person_id, movie_id)
);

