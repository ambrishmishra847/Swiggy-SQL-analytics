# Which are the Top 10 restaurants in India? (Based on rating and rating_count)
select
	name,
    city,
    rating,
    rating_count
from restaurant 
where rating_count>100
order by rating desc, rating_count desc
limit 10;

# Which restaurants are overpriced?
select 
	name,
    city,
    cost,
    rating
from restaurant
where cost>2*
		(select avg(cost)
        from restaurant)
and rating<
		(select avg(rating)
        from restaurant);

# Most popular cuisine
SELECT
cuisine,
COUNT(*) restaurants
FROM restaurant
GROUP BY cuisine
ORDER BY restaurants DESC;
        
# Cities with most restaurants!
select 
	city,
    count(*) as restaurants,
    round(avg(rating),2) as ratings,
    round(avg(cost),2) as avg_cost
FROM restaurant
group by city
order by restaurants desc;

# Does expensive food receive better ratings?
SELECT
CASE
WHEN cost<300 THEN 'Budget'
WHEN cost BETWEEN 300 AND 700 THEN 'Mid Range'
ELSE 'Premium'
END AS category,
ROUND(AVG(rating),2)
FROM restaurant
GROUP BY category;

# Restaurant with highest engagement
select 
	name, 
	sum(rating_count) as total_rating,
    round(avg(rating),2) as ratings
from restaurant
group by name
order by total_rating desc, ratings desc
limit 10;

# Underrated restaurants
SELECT
    name,
    city,
    cost,
    rating
FROM restaurant
WHERE cost < (
    SELECT AVG(cost)
    FROM restaurant)
AND rating > (
    SELECT AVG(rating)
    FROM restaurant)
ORDER BY rating DESC, cost ASC;

# Overrated restaurants 
SELECT
    name,
    city,
    cost,
    rating
FROM restaurant
WHERE cost > (
    SELECT AVG(cost)
    FROM restaurant)
AND rating < (
    SELECT AVG(rating)
    FROM restaurant)
ORDER BY cost DESC;

# Which cities have the happiest customers?
SELECT
	city,
	ROUND(AVG(rating),2) as avg_rating
FROM restaurant
GROUP BY city
HAVING COUNT(*) > 30
ORDER BY AVG(rating) DESC
Limit 20;

# Best Value restaurants
SELECT
    city,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rating),2) AS avg_rating,
    ROUND(AVG(cost),2) AS avg_cost,
    ROUND(AVG(rating)/AVG(cost),5) AS value_score
FROM restaurant
GROUP BY city
HAVING COUNT(*) >= 20
ORDER BY value_score DESC;

# Where should Swiggy expand?
select 
	city ,
    Round(count(*)*avg(rating)/avg(cost),2)
    as expansion_score
from restaurant
group by city
order by expansion_score desc;

# Cities needing quality improvement
select 
	city,
    round(avg(rating),2) as avg_rating,
    avg(rating_count) as avg_reviews
FROM restaurant
group by city
order by avg_rating asc, avg_reviews asc;

/*
BUSINESS INSIGHTS

1. City "Bangalore" has the largest restaurant network.
2. North Indian Cuisine is the most popular.
3. Restaurant "McDonald's" has the highest customer engagement with 126450 reviews.
4. Premium restaurants have the highest average customer ratings (4.17),
	followed by Mid Range (3.93) and Budget (3.85).This indicates a 
    positive relationship between higher pricing and customer satisfaction
    in the dataset.
5. Although Premium restaurants charge more, they have a lower average rating
	than Mid Range restaurants. Therefore, higher prices do not necessarily 
    result in better customer satisfaction.
6. "Barnala" offers the highest value for customers.
7. "Bangalore" is a strong candidate for Swiggy expansion.
*/