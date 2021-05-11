DROP TABLE weather;
CREATE TABLE weather (
  capital VARCHAR NOT NULL,
  temp decimal NOT NULL,
  min_temp decimal NOT NULL,
  max_temp decimal NOT NULL,
	PRIMARY KEY (capital)
);

DROP TABLE happy;
CREATE TABLE happy (
    capital VARCHAR NOT NULL,
	country VARCHAR NOT NULL,
	happiness_score decimal NOT NULL,
	gdp_per_capita decimal NOT NULL,
	social_support decimal NOT NULL,
	healthy_life_expectancy decimal NOT NULL,
	PRIMARY KEY (capital)
);