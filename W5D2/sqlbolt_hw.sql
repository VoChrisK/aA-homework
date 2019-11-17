# https://sqlbolt.com/

#SQLBolt Tutorial 1-12

-- Lesson 1: Writing SQL Queries
1. SELECT title FROM movies;
2. SELECT director FROM movies;
3. SELECT title, director FROM movies;
4. SELECT title, year FROM movies;
5. SELECT * FROM movies;

-- Lesson 2: Queries with constraints (Pt. 1)
1. SELECT * FROM movies WHERE id = 6;
2. SELECT * FROM movies WHERE year BETWEEN 2000 AND 2010;
3. SELECT * FROM movies WHERE year NOT BETWEEN 2000 AND 2010;
4. SELECT * FROM movies WHERE id BETWEEN 1 AND 5;

-- Lesson 3: Queries with constraints (Pt. 2)
1. SELECT * FROM movies WHERE title LIKE "Toy Story%";
2. SELECT * FROM movies WHERE director = 'John Lasseter';
3. SELECT * FROM movies WHERE director != 'John Lasseter';
4. SELECT * FROM movies WHERE title LIKE "WALL-%";

-- Lesson 4: Filtering and sorting Query results
1. SELECT DISTINCT(director) FROM movies ORDER BY director;
2. SELECT DISTINCT(title) FROM movies ORDER BY year DESC LIMIT 4;
3. SELECT * FROM movies ORDER BY title LIMIT 5;
4. SELECT * FROM movies ORDER BY title LIMIT 5 OFFSET 5;

-- Review: Simple SELECT Queries
1. SELECT * FROM north_american_cities WHERE country = 'Canada';
2. SELECT * FROM north_american_cities WHERE country = 'United States' ORDER BY latitude DESC;
3. SELECT * FROM north_american_cities WHERE longitude < -87.629798 ORDER BY longitude;
4. SELECT * FROM north_american_cities WHERE country = 'Mexico' ORDER BY population DESC LIMIT 2;
5. SELECT * FROM north_american_cities WHERE country = 'United States' ORDER BY population DESC LIMIT 2 OFFSET 2;

-- Lesson 6: Multi-table queries with JOINs
1. SELECT domestic_sales, international_sales FROM movies JOIN boxoffice ON movies.id = movie_id;
2. SELECT international_sales FROM movies JOIN boxoffice ON movies.id = movie_id WHERE international_sales > domestic_sales;
3. SELECT title FROM movies JOIN boxoffice ON movies.id = movie_id ORDER BY rating DESC;

-- Lesson 7: OUTER JOINs
1. SELECT distinct(building_name) FROM buildings JOIN employees ON building_name = employees.building;
2. SELECT distinct(building_name), capacity FROM buildings LEFT JOIN employees ON building_name = employees.building;
3. SELECT DISTINCT(building_name), role FROM buildings LEFT JOIN employees ON building_name = employees.building;

-- Lesson 8: A short note on NULLs
1. SELECT name, role FROM employees LEFT JOIN buildings ON building_name = employees.building WHERE building_name IS NULL;
2. SELECT building_name FROM buildings LEFT JOIN employees ON building_name = employees.building WHERE name IS NULL;

-- Lesson 9: Queries with expressions
1. SELECT title, (domestic_sales + international_sales) / 1000000 AS Gross_In_Millions FROM movies JOIN boxoffice ON movies.id = movie_id;
2. SELECT title, rating * 10 AS Rating_In_Percentage FROM movies JOIN boxoffice ON movies.id = movie_id;
3. SELECT title FROM movies JOIN boxoffice ON movies.id = movie_id WHERE year % 2 = 0;

-- Lesson 10: Queries with aggregates (Pt. 1)
1. SELECT name, MAX(years_employed) FROM employees;
2. SELECT role, AVG(years_employed) FROM employees GROUP BY role;
3. SELECT building, SUM(years_employed) AS Total_Years_Employed FROM employees GROUP BY building;

-- Lesson 11: Queries with aggregates (Pt. 2)
1. SELECT role, count(*) AS Number_Of_Artists FROM employees WHERE role = 'Artist';
2. SELECT role, count(*) AS Total FROM employees GROUP BY role;
3. SELECT role, SUM(years_employed) AS Total FROM employees WHERE role = 'Engineer';

-- Lesson 12: Order of execution of a Query
1. SELECT director, count(*) AS Movies FROM movies GROUP BY director;
2. SELECT director, SUM(domestic_sales + international_sales) AS Total_Sales FROM movies JOIN boxoffice ON movies.id = movie_id GROUP BY director;