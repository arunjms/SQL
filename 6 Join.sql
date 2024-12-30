-- Joining Tables: Inner Join
SELECT p.Fname, p.Lname, c.Country_name, p.Rating 
FROM Persons p
INNER JOIN Country c
ON p.Country_Id = c.Id;

-- Joining Tables: Left Join
SELECT p.Fname, p.Lname, c.Country_name, p.Rating 
FROM Persons p
LEFT JOIN Country c
ON p.Country_Id = c.Id;

-- Joining Tables: Right Join
SELECT p.Fname, p.Lname, c.Country_name, p.Rating 
FROM Persons p
RIGHT JOIN Country c
ON p.Country_Id = c.Id;

-- Retrieve Distinct Country Names from Two Tables
SELECT DISTINCT Country_name 
FROM (
    SELECT Country_name FROM Country
    UNION
    SELECT Country_name FROM Persons
) AS AllCountries;

-- Combine and List All Country Names with Duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

-- Round Ratings to the Nearest Integer in the Persons Table
SELECT Fname, Lname, ROUND(Rating) AS RoundedRating 
FROM Persons;



