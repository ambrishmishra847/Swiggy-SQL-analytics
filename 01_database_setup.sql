create database swiggy_db;
use swiggy_db;

-- Display the table
select * from restaurant;

-- check column information
describe restaurant;

-- Count the number of data values
select count(*) as total_restaurants from restaurant;

-- Check stats of cost column 
select min(cost), max(cost), avg(cost) 
from restaurant;

-- Check stats of rating column
select min(rating), max(rating), avg(rating) 
from restaurant;