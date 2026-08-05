use swiggy_db;
select * from restaurant;

# Highest rated restaurants
SELECT *
FROM restaurant
ORDER BY rating DESC
LIMIT 10;

#Lowest rated restaurants
SELECT *
FROM restaurant
ORDER BY rating ASC
LIMIT 10;

# Rating distribution
SELECT
    FLOOR(rating) AS rating_group,
    COUNT(*) AS restaurant
FROM restaurant
GROUP BY FLOOR(rating)
ORDER BY rating_group;

-- Restaurants with above average rating
SELECT COUNT(*) AS above_average
FROM restaurant
WHERE rating >
( SELECT AVG(rating)
FROM restaurant
);

# Cheapest restaurants
SELECT *
FROM restaurant
ORDER BY cost
LIMIT 10;

# Most expensive restaurant
SELECT *
FROM restaurant
ORDER BY cost DESC
LIMIT 10;

#cost statistics
SELECT
MIN(cost),
MAX(cost),
ROUND(AVG(cost),2)
FROM restaurant;

# Class distribution
select 
case
	when cost<200 Then 'Budget'
    when cost between 200 and 500 then 'Affordable'
    when cost between 501 and 1000 then 'Premium'
    else 'Luxury'
end
as category,
count(*) as restaurants
from restaurant
group by category;

# Most Reviewed Restaurants
SELECT
	name,
	city,
	rating_count
FROM restaurant
ORDER BY rating_count DESC
LIMIT 20;

# Popular restaurants (restaurants with 1000+ reviews)
SELECT
COUNT(*) as popular_restro
FROM restaurant
WHERE rating_count>1000;

# Average rating by cities
SELECT
	city,
	ROUND(AVG(rating),2) AS avg_rating
FROM restaurant
GROUP BY city
ORDER BY avg_rating DESC;

# Top 10 popular cuisine
SELECT
cuisine,
COUNT(*) AS restaurants
FROM restaurant
GROUP BY cuisine
ORDER BY restaurants DESC
LIMIT 10;