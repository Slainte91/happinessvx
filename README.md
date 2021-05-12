# happinessvx

The purpose of this project is to clean data, and join together tables of countries based on their happiness versus some other data point 
(one per group member) taken from two data sources.

John: Education
Josh: Gender
Amy: Average Temperature
Nabila: Salary

Education Report
The sources of data that you will extract from.
I extracted all data in the form of a csv from the following two sources:
https://www.kaggle.com/mathurinache/world-happiness-report-20152021

For the above link, I used the 2019 happiness report.

https://data.oecd.org/eduatt/adult-education-level.htm#indicator-chart 
The type of transformation needed for this data (cleaning, joining, filtering, aggregating, etc).

Renamed columns in both csv’s in excel
	The data all fits nicely into rows and columns so it is relational
Sorted the country column of the happiness csv alphabetically. Treated it’s rank on the happiness sheet as it’s primary key. Used the filter in excel to filter the years to just 2019 column
Extracted the csv’s in the dataframe using pandas pd.read_csv()
Set a new dataframe equal to a copy of the old dataframe with only the columns we want 	using df[[‘list of columns we want’]].copy
Created a database connection to both databases in postgres using create_engine(f'postgresql://postgres:postgres@localhost:5432/[your_db_name_here]')
Loaded dataframes in sql using df.to_sql()
Joined together two databases into one to get only the info we need in both jupyter and pgAdmin 4
Created a scatterplot of the values from the single database and our r-squared value (0.056...) suggested not a strong correlation between our two variables







Gender Report
The sources of data that you will extract from.
I extracted my data using the World Bank Indicators API.
The type of transformation needed for this data (cleaning, joining, filtering, aggregating, etc).
The main transformations/operations were:
Calling an indicator from the api to get the number of pages needing to be iterated through, then iterating through them and the dicts to a list, then transforming that entire list into a df. 
From there I needed to parse remaining dictionaries in the df from the api into their own columns.
After that, the final step was to make multiple tables to get to 2nf. 


The type of final production database to load the data into (relational or non-relational).
Relational database was used 


The final tables or collections that will be used in the production database.
Final tables were compiled onto John’s SQL Schema, which had two tables to which I added an additional 3
country_information
Contains detailed information about countries in question
series_information
For eventually adding on multiple series from the world bank api, this would be a useful table that can catalog which worldbank series are available and where.
gender
This table has the values for my series pulled from the world bank api, this includes country and 20 years worth of data. The series collected for the ETL_Project was 'Women participating in decision of what food to cook daily (% of women age 15-49)'.
Happiness vs Weather Report
Sources of data 
Happiness Report: https://www.kaggle.com/mathurinache/world-happiness-report-20152021
I used the 2021 csv file
I used the open weather API:
https://openweathermap.org/api
Using pandas I was able to go through a list of capitals from the countries on the happiness report.  I extracted the current temp, the minimum temp, maximum temp, and the country from the API
Next Steps
I created a happiness database in postgres and created two tables:
Happy: which contains capital (PK), country, happiness_score, gdp_per_capita, social_support, and healthy_llife_expectancy
Weather: which contains:capital (PK), temp, min_temp, max_temp
Transformation
In Jupyter Lab I read in the CSV files, one which contained the happiness scores and other information and the other which was from the open weather API.  
I looked through the happiness csv and determined that I did not need all the columns, I only selected those of interest.  I then renamed the columns so they could match those that I had already created in my Happy table in postgres. I checked for null values and dropped those that were null--there was one country where the capital could not be found and was therefore dropped.  I then set the Country as my index as that is the primary key in my table in postgres.
I followed the same steps for the weather data, chose the columns I needed, renamed them to match my already created table in my happy database, checked for nulls (none were present) and set the Country column as my index. 
Load
I connected to postgres and checked that my tables were created and accessible.  Once I established that I loaded both dataframes into SQL and did a quick Select statement on both tables to make sure it was loaded correctly.  
In postgres I also did some simple queries, selecting all from both tables and then did a join on Capital so that I could get the weather information as it corresponds, or doesn’t correspond to happiness.  




