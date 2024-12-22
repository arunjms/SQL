
select * from country;
select * from persons;

-- 1. Query to print the first three characters of Country_name from the Country table
Select Left (country_name, 3) AS First_3_letters From country;

-- 2. Query to concatenate Fname and Lname from the Persons table
SELECT CONCAT(Fname, ' ', Lname) AS full_name FROM Persons;


-- 3. Query to count the number of unique country names from the Persons table
SELECT COUNT(DISTINCT Country_name) FROM Persons;


-- 4. Query to print the maximum population from the Country table
SELECT MAX(Population) AS Max_population FROM country;


-- 5. Query to print the minimum population from the Persons table
SELECT MIN(Population) AS Min_population FROM country;

-- 6. Insert 2 new rows into Persons table with NULL Lname and query to count non-null Lname
ALTER TABLE Persons MODIFY Id INT AUTO_INCREMENT;
INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES 
('Amar', NULL, 90000, 4, 1, 'USA'), 
('Richard', NULL, 20000, 5, 3, 'Canada');

Select count(*) From Persons
Where Lname is not null;

-- 7. Query to find the number of rows in the Persons table
Select count(*) AS Total_rows From Persons;

-- 8. Query to show the population of the Country table for the first 3 rows using LIMIT
SELECT Population AS Top_3population FROM country
order by Population DESC
limit 3;


-- 9. Query to print 3 random rows of countries using RAND() and LIMIT
SELECT * FROM Country
ORDER BY RAND()
LIMIT 3;


-- 10. Query to list all persons ordered by their rating in descending order
SELECT Rating AS Top_Rating FROM country
order by Rating DESC;


-- 11. Query to find the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS TotalPopulation FROM Persons
GROUP BY Country_name;

-- 12. Query to find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS TotalPopulation FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- 13. Query to list the total number of persons and average rating for each country, ordered by average rating (ascending)
SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AverageRating FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY AverageRating;

