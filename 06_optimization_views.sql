use swiggy_db;

# create a view of city summary
CREATE VIEW city_summary AS
SELECT
    city,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(rating),2) AS avg_rating,
    ROUND(AVG(cost),2) AS avg_cost,
    ROUND(AVG(rating_count),0) AS avg_reviews
FROM restaurant
GROUP BY city;

select * from city_summary;

# View for Premium Restaurants
create view Premium_restaurants as 
select * from restaurant 
where cost > 700 
and rating>=4;

select * from premium_restaurants;
-- index 1
CREATE INDEX idx_city
ON restaurant(city);
-- index 2
create index idx_rating
on restaurant(rating);
-- index 3
create index idx_cost
on restaurant(cost);
-- index 4(composite)
create index idx_city_rating
on restaurant(city,rating);

explain
select * from restaurant
where city='Delhi'
order by rating DESC;

-- create procedure to list top rated restaurants in the city
delimiter //
create procedure top_restaurants(in city_name varchar(100))
begin
select
		name,
        rating,
        rating_count,
        cost
from restaurant
where city=city_name
order by rating desc,rating_count Desc
limit 10;
end // 
delimiter;

call top_restaurants('Bangalore');

