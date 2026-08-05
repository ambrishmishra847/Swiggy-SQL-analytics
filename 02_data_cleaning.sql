use swiggy_db;

-- See the table
select * from restaurant;

-- Count the number of rows in data
SELECT COUNT(*) AS total_restaurants 
FROM restaurant;

-- alter data types of column 
ALTER TABLE restaurant
MODIFY cuisine VARCHAR(100);
ALTER TABLE restaurant
MODIFY name VARCHAR(100);
ALTER TABLE restaurant
MODIFY city VARCHAR(100);

-- Count the number of duplicate ID data
SELECT COUNT(*) AS total_rows, 
COUNT(DISTINCT id) AS unique_ids 
FROM restaurant;

-- Check for duplicate values in the data with same ID
SELECT 
	id,
	COUNT(*) AS duplicate_count
FROM restaurant
GROUP BY id 
HAVING COUNT(*) > 1;

-- Check for branches of same restaurant in the city
select 
	name,
    city,
    count(*) as occurrence
from restaurant
group by name,city
having count(*)>1
order by occurrence desc;

-- Check for null values in raw data
SELECT
SUM(name IS NULL) AS missing_name,
SUM(city IS NULL) AS missing_city,
SUM(rating IS NULL) AS missing_rating,
SUM(rating_count IS NULL) AS missing_rating_count,
SUM(cuisine IS NULL) AS missing_cuisine,
SUM(cost IS NULL) AS missing_cost,
SUM(link IS NULL) AS missing_link
FROM restaurant;

-- check rating's authenticity (if any data falls outside the data range)
SELECT *
FROM restaurant
WHERE rating < 0
   OR rating > 5;
 
-- Check the name of different cities in our data
SELECT DISTINCT city
FROM restaurant
ORDER BY city;