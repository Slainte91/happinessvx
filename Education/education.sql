drop table if exists happiness;
drop table if exists education;
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


-- Joins tables
SELECT happiness.id, happiness.country, happiness.score, education.percent_educated
FROM happiness
JOIN education
ON happiness.id = education.country_code;
