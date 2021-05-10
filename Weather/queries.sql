SELECT * FROM happy;
SELECT * FROM weather;

SELECT
  *
FROM happy h
INNER JOIN weather w
ON h.capital = w.capital;

SELECT
  h.country
  ,h.capital
  ,h.happiness_score
  ,w.temp AS current_temp
  ,w.min_temp
  ,w.max_temp
FROM happy h
INNER JOIN weather w
on h.capital = w.capital
Order BY h.happiness_score desc;

/*checking one to see what the happiness score is when order by max_temp desc*/

SELECT
  h.country
  ,h.capital
  ,h.happiness_score
  ,w.temp AS current_temp
  ,w.min_temp
  ,w.max_temp
FROM happy h
INNER JOIN weather w
on h.capital = w.capital
Order BY w.max_temp desc;

