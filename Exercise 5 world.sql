use world;
select * from country;
SELECT name FROM country ORDER BY population DESC LIMIT 1;
SELECT name FROM country ORDER BY population DESC LIMIT 1, 1;
SELECT name FROM country ORDER BY population ASC LIMIT 1;
SELECT name FROM country ORDER BY population ASC LIMIT 2, 1;

SELECT continent, SUM(surfaceArea) AS total_surface_area 
FROM country 
WHERE lifeExpectancy > 75 
GROUP BY continent 
ORDER BY total_surface_area DESC 
LIMIT 1;
