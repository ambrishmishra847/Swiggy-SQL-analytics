select * from restaurant;

-- best restuarant in every city
SELECT city, name, rating, rating_count,
    ROW_NUMBER() OVER(
        PARTITION BY city
        ORDER BY rating DESC, rating_count DESC
    ) AS city_rank
FROM restaurant;

-- 5 Top rated Restaurants in Every City

with ranked_restro as 
	(SELECT
		city,
		name,
		rating,
		rating_count,
		ROW_NUMBER() OVER(
			PARTITION BY city
			ORDER BY rating DESC, rating_count DESC)
		AS city_rank
	FROM restaurant)
select * from ranked_restro
where city_rank<=5; 

-- highest rated restaurant in every cuisine 

with cuisine_rank as
	(SELECT cuisine,
			name,
            rating,
            row_number() over
            (partition by cuisine
            order by rating desc, rating_count desc)
		as rnk from restaurant)
select * from cuisine_rank
where rnk=1;

--  Most Expensive Restaurant in Each City
with expensive as 
(select city,
		name,
        cost,
        row_number() over
        (partition by city
        order by cost desc) 
        as restro_rnk from restaurant)
select * from expensive
where restro_rnk=1;

-- Overall restaurant ranking
SELECT
name,
city,
rating,
rating_count,
RANK() OVER
(ORDER BY rating DESC,rating_count DESC)
AS overall_rank
FROM restaurant;

-- Dense ranking the restaurants

SELECT
name,
city,
rating,
rating_count,
Dense_RANK() OVER
(ORDER BY rating DESC,rating_count DESC)
AS overall_rank
FROM restaurant;

-- Restaurants with rating better than their city average

select name,
	   city,
       rating
from restaurant
where rating>
			(select avg(rating)
            from restaurant
            where city=restaurant.city);
            
-- Restaurants division into four section based on rating.
SELECT
name,
rating,
NTILE(4)
OVER
(
ORDER BY rating DESC
)
AS quartile
FROM restaurant;

-- KPIS
	# Popularity score
	SELECT
	name,
	city,
	rating,
	rating_count,
	ROUND(rating*rating_count,2)
	AS popularity_score
	FROM restaurant
	ORDER BY popularity_score DESC;

	# Customer Value Index
	SELECT
	name,
	city,
	rating,
	rating_count,
	cost,
	ROUND(
	(rating*LN(rating_count+1))/cost,5)
	AS customer_value_index
	FROM restaurant
	ORDER BY customer_value_index DESC;

	# budget win
	SELECT
	name,
	rating,
	cost,
	ROUND(rating/cost,5)
	AS budget_score
	FROM restaurant
	where cost>30
	ORDER BY budget_score DESC;

-- Best Restaurant in Every City
WITH restaurant_score AS
(SELECT
city,
name,
ROUND(
(rating*LN(rating_count+1))/cost,5)
AS score,
ROW_NUMBER()
OVER
(PARTITION BY city
ORDER BY
(rating*LN(rating_count+1))/cost DESC)
AS rn
FROM restaurant)
SELECT *
FROM restaurant_score
WHERE rn=1;

# Calculate running average for the dataset
SELECT
id,
name,
rating,
ROUND(
AVG(rating)
OVER
(
ORDER BY id
),2)
AS running_avg
FROM restaurant;