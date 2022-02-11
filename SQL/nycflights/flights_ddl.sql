-- flights_ddl.sql
-- loads 5 .csv files into tables in flights database
-- documentation: https://cran.r-project.org/web/packages/nycflights13/nycflights13.pdf

-- start by creating a new database, e.g. nycflights
-- make sure that you're in that database before you run the script

DROP TABLE IF EXISTS airports;

CREATE TABLE airports (
  faa varchar(3) PRIMARY KEY,
  name varchar(70) NOT NULL,
  lat numeric NOT NULL,
  lon numeric NOT NULL,
  alt int NOT NULL,
  tz int NOT NULL,
  dst CHAR(1) NOT NULL,
  tzone varchar(20) NULL
);

COPY airports FROM 'c:/users/public/airports.csv' csv header null 'NA';

SELECT * FROM airports;

DROP TABLE IF EXISTS flights;

CREATE TABLE flights (
year integer NOT NULL,
month integer NOT NULL,
day integer NOT NULL,
dep_time integer NULL,
sched_dep_time integer NULL,
dep_delay integer NULL,
arr_time integer NULL,
sched_arr_time integer NULL,
arr_delay integer NULL,
carrier char(2) NOT NULL,
flight integer NOT NULL,
tailnum char(6) NULL,
origin char(3) NOT NULL,
dest char(3) NOT NULL,
air_time integer NULL,
distance integer NULL,
hour integer NOT NULL,
minute integer NOT NULL,
time_hour timestamptz NOT NULL
);

COPY flights FROM 'c:/users/public/flights.csv' csv header null 'NA';

SELECT * FROM flights;

DROP TABLE IF EXISTS planes;

CREATE TABLE planes (
  tailnum varchar(6) PRIMARY KEY,
  year int NULL,
  type varchar(30) NOT NULL,
  manufacturer varchar(30) NOT NULL,
  model varchar(20) NOT NULL,
  engines int NOT NULL,
  seats int NOT NULL,
  speed int NULL,
  engine varchar(20) NOT NULL
);

COPY planes FROM 'c:/users/public/planes.csv' csv header null 'NA';

SELECT * FROM planes;

DROP TABLE IF EXISTS airlines;

CREATE TABLE airlines (
  carrier varchar(2) PRIMARY KEY,
  name varchar(30) NOT NULL
);
  
COPY airlines FROM 'c:/users/public/airlines.csv' csv header null 'NA';

SELECT * FROM airlines;

DROP TABLE IF EXISTS weather;

CREATE TABLE weather (
	origin char(3) NOT NULL,
	year int NOT NULL,
	month int NOT NULL,
	day int NOT NULL,
	hour int NOT NULL,
	temp numeric NULL,
	dewp numeric NULL,
	humid numeric NULL,
	windir int NULL,
	windspeed numeric NULL,
	windgust numeric NULL,
	precip numeric NULL,
	pressure numeric NULL,
	visib numeric NULL,
	time_hour timestamptz NOT NULL,
	PRIMARY KEY (origin, time_hour)
);

COPY weather FROM 'c:/users/public/weather.csv' csv header null 'NA';

SELECT * FROM weather;

SELECT time_hour FROM flights;

