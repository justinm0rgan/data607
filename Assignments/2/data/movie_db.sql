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

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    year INT NOT NULL
);

CREATE TABLE ratings (
    person_id INT REFERENCES people ON DELETE CASCADE,
    movie_id INT REFERENCES movies ON DELETE CASCADE,
    rating INT,
    PRIMARY KEY (person_id, movie_id)
);

