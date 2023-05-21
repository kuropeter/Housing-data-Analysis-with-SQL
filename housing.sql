SELECT * 
FROM housing

--Removing null values from table
DELETE FROM housing
WHERE longitude IS null
	OR latitude  IS NULL
	OR housing_median_age IS NULL
	OR total_rooms IS NULL
	OR total_bedrooms IS NULL
	OR population IS NULL
	OR households IS NULL
	OR median_house_value IS NULL
	OR ocean_proximity IS NULL

--469 rolls that have null values deleted

--1. What is the median house value in different ocean proximities?
SELECT AVG(median_house_value) AS Average_House_Value, ocean_proximity
FROM housing
GROUP BY ocean_proximity
ORDER BY Average_House_Value DESC
---Houses in the island have the highest average value followed by Houses closest to a water body.

--2. How does the number of households vary based on the ocean proximity?
SELECT SUM(households) AS "Number of households", ocean_proximity
FROM housing
GROUP BY ocean_proximity
ORDER BY "Number of households" DESC
--Household less than 1 Hour from Ocean have the most housing 
--and the further you get away from the ocean the more households they are

--3. What is the population distribution across different ocean proximities?
SELECT SUM(population) AS population_by_ocean_proximity, ocean_proximity
FROM  housing
GROUP BY ocean_proximity
ORDER BY population_by_ocean_proximity DESC
-- Predictable the results are similar as the 
-- areas with the most households have the most population

--4. What is the average number of total bedrooms in each ocean proximity category?
SELECT AVG(total_rooms) AS avg_pop_by_ocean_proximity, ocean_proximity
FROM housing
GROUP BY ocean_proximity
ORDER BY avg_pop_by_ocean_proximity DESC
--Inland has the highest avg total rooms and the closer you go to the land, the lower the average total rooms

--5. How does the number of total rooms differ based on the ocean proximity?
SELECT SUM(total_rooms) AS total_room, ocean_proximity
FROM housing
GROUP BY ocean_proximity
ORDER BY total_room DESC
--

--6. What is the median age of housing in different ocean proximities?
SELECT AVG(housing_median_age) AS average_house_age, ocean_proximity
FROM housing
GROUP BY ocean_proximity
ORDER BY average_house_age DESC
--The island has the oldest housing, while Inland has the youngest 

--7. How does latitude affect the median house value?
SELECT latitude, AVG(median_house_value) AS median_house_value_latitude
FROM housing
GROUP BY latitude
ORDER BY median_house_value_latitude DESC


--8. How does longitude impact the number of households?
SELECT longitude, AVG(median_house_value) AS median_house_value_longitude
FROM housing
GROUP BY longitude
ORDER BY median_house_value_longitude DESC

--9. What is the relationship between median house value and population?
SELECT median_house_value, population
FROM housing
ORDER BY median_house_value DESC

--11. What is the average number of total rooms in each housing median age group?
SELECT housing_median_age, AVG(total_rooms)
FROM housing
GROUP BY housing_median_age

--12. How does the median house value vary with the total number of rooms?
SELECT housing_median_age, AVG(total_rooms) AS average_total_rooms
FROM housing
GROUP BY housing_median_age
ORDER BY average_total_rooms 
--IN GENERAL OLDER HOUSING HAVE MORE ROOMS

--14. How does the population change with the housing median age?
SELECT housing_median_age, AVG(population) AS Avg_population
FROM housing
GROUP BY housing_median_age
ORDER BY Avg_population DESC
--It appears the younger households have a larger population

--
Select *
FROM housing