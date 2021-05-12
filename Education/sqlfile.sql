-- run this code BEFORE jupyterlab
drop table if exists happiness;
drop table if exists education;
drop table if exists country_information;
drop table if exists gender;
drop table if exists series_information;

-- Create tables for raw data to be loaded into
CREATE TABLE happiness (
id INT PRIMARY KEY,
country TEXT,
score FLOAT,
GDP FLOAT
);


CREATE TABLE education (
country TEXT,
percent_educated FLOAT,
country_code INT PRIMARY KEY
);


CREATE TABLE country_information (
country_value TEXT,
country_isocode varchar(3),
country_id varchar(2) PRIMARY KEY
);

CREATE TABLE series_information (
series_id varchar(17) PRIMARY KEY,
series_name TEXT
);

CREATE TABLE gender (   
country_id varchar(2),
val_date Date,
value float,
decimal INT,
PRIMARY KEY(country_id),
   CONSTRAINT fk_country
      FOREIGN KEY(country_id) 
	  REFERENCES country_information(country_id)
      FOREIGN KEY(series_id)
      REFERENCES series_information(series_id)
);
-- Run this code after running jupyter file
SELECT happiness.id, happiness.country, happiness.score, education.percent_educated
FROM happiness
JOIN education
ON happiness.id = education.country_code;

select * from happiness;