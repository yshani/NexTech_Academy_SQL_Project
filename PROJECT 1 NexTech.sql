-- TASK 1 --
SHOW DATABASES; -- To list databases 
USE llin_analysis; -- To choose a database
CREATE DATABASE llin_analysis; -- To create a database

-- To Create a Table
CREATE TABLE llin_distribution (
ID INT,
Number_distributed INT,
Location VARCHAR(50),
Country VARCHAR(50),
Year INT,
By_whom VARCHAR(50),
Country_code VARCHAR (10));


-- TASK 2 --
SELECT
SUM(Number_distributed) AS Total_llins, 
Country
FROM 
llin_distribution
GROUP BY Country; -- -- To Calculate the total number of LLINs distributed in each country


SELECT
ROUND(AVG(Number_distributed) ,2)AS avg_llins,
Country
FROM
llin_distribution
GROUP BY Country; -- To find the average number of LLINs distributed per distribution event


SELECT
MAX(Year) AS Latest_date,
MIN(Year) AS Earliest_date
FROM
llin_distribution; -- To Determine the earliest and latest distribution dates in the dataset

-- TASK 3 --
SELECT
SUM(Number_distributed) AS Total_llins_per_organization,
By_whom
FROM 
llin_distribution
GROUP BY By_whom; -- To Identify the total number of LLINs distributed by each organization

SELECT
SUM(Number_distributed) AS Total_llins_per_year,
Year
FROM 
llin_distribution
GROUP BY Year;

-- TASK 4 --
SELECT
MAX(Number_distributed) AS highest_llins,
MIN(Number_distributed) AS lowest_llins,
Location
FROM
llin_distribution
GROUP BY Location; -- To Find the locations with the highest and lowest number of LLINs distributed


SELECT
ROUND(AVG(Number_distributed) ,2)AS avg_llins,
Country
FROM
llin_distribution
GROUP BY Country; -- 

SELECT
by_whom,
MAX(Number_distributed) AS highest_llins, -- This is the calculation for the Highest number of LLINS --
MIN(Number_distributed) AS lowest_llins,  -- This is the calculation for the Lowest number of LLINS --
(MAX(Number_distributed) - MIN(Number_distributed)) AS Difference
FROM
llin_distribution
GROUP BY by_whom;

-- TASK 5 --
-- This is the task for Outliers--
SELECT * FROM llin_distribution
WHERE Number_distributed > 4000000;