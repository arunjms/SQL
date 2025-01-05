-- (1) Add a new column called DOB in Persons table with data type as Date
SELECT * FROM persons;
ALTER TABLE Persons ADD DOB DATE;

-- (2) Create a user-defined function to calculate age using DOB
DELIMITER //
CREATE FUNCTION CalculateAge(DOB DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
RETURN TIMESTAMPDIFF(YEAR, DOB, CURDATE());
END;
//
DELIMITER ;

-- (3) Write a select query to fetch the Age of all persons using the function that has been created

SELECT Fname, Lname, CalculateAge(DOB) AS Age FROM Persons;

-- (4) Find the length of each country name in the Country table
SELECT * From country;
DELIMITER //
CREATE FUNCTION Countrynamelength(country_name VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN
RETURN length(country_name);
END;
//
DELIMITER ;
Drop FUNCTION Countrynamelength;
SELECT country_name, Countrynamelength(country_name) FROM country;

-- (5) Extract the first three characters of each country's name in the Country table

SELECT Country_name, SUBSTRING(Country_name, 1, 3) AS First_Three_Chars FROM Country;

-- (6) Convert all country names to uppercase and lowercase in the Country table
SELECT 
    Country_name, 
    UPPER(Country_name) AS Uppercase_Name, 
    LOWER(Country_name) AS Lowercase_Name 
FROM Country;
