-- Create the Country table
CREATE TABLE Country(
Id INT PRIMARY KEY,
Country_name Varchar(25) NOT NULL,
Population INT NOT NULL,
Area VARCHAR(25) NOT NULL
);

-- Create the Persons table
CREATE TABLE Persons(
Id INT PRIMARY KEY,
Fname VARCHAR(20),
Lname VARCHAR(20),
Population INT NOT NULL,
Rating DECIMAL NOT NULL,
Country_Id INT,
Country_name VARCHAR(20),
FOREIGN KEY (Country_ID) REFERENCES country(Id)
);

-- Insert data into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 'Washington'),
(2, 'India', 1393409038, 'Delhi'),
(3, 'Canada', 38005238, 'Ottawa'),
(4, 'UK', 68207114, 'London'),
(5, 'Australia', 25687041, 'Canberra'),
(6, 'Germany', 83166711, 'Berlin'),
(7, 'France', 67391582, 'Paris'),
(8, 'Japan', 125960000, 'Tokyo'),
(9, 'Brazil', 213993437, 'Brasilia'),
(10, 'Italy', 59554023, 'Rome');


-- Insert data into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 500000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 400000, 3.9, 2, 'India'),
(3, 'Emily', 'Jones', 300000, 4.8, 3, 'Canada'),
(4, 'Michael', 'Brown', 1000000, 5.0, 4, 'UK'),
(5, 'Sarah', 'Davis', 200000, 4.2, 5, 'Australia'),
(6, 'Chris', 'Taylor', 1500000, 4.1, 6, 'Germany'),
(7, 'Emma', 'Wilson', 900000, 4.0, 3, 'Canada'),
(8, 'Liam', 'Moore', 800000, 3.5, 9, 'Brazil'),
(9, 'Olivia', 'Anderson', 700000, 4.6, 10, 'Italy'),
(10, 'Noah', 'Thomas', 600000, 2.9, 8, 'Japan');


-- (1) Fetch all distinct country names from the Persons table
Select DISTINCT (Country_name) FROM persons;

-- (2) Select first names and last names from Persons table with aliases
SELECT Fname AS First_Name, Lname AS Last_name FROM persons;

-- (3) Retrieve all persons who have a rating greater than 4.0
SELECT * FROM persons
WHERE Rating > 4;

-- (4) Fetch countries with a population greater than 10 lakhs (1 million)
SELECT * FROM persons
WHERE Population > 100000 ;

-- (5) Retrieve persons who are either from 'USA' or have a rating greater than 4.5
SELECT Fname AS First_Name, Lname AS Last_Name, Country_name AS Country, Rating AS Rating_above FROM persons
WHERE Country_name = 'USA' OR Rating >4.5 ;

-- (6) Find all persons where the country name is missing (NULL)
SELECT Fname AS First_Name, Lname AS Last_Name, Country_name AS Country FROM persons
WHERE Country_name = NULL;

-- (7) Retrieve persons belonging to the countries 'USA', 'Canada', and 'UK'
SELECT Fname AS First_Name, Lname AS Last_Name, Country_name AS Country FROM persons
WHERE Country_name IN ('USA', 'Canada', 'UK') ;

-- (8) Fetch all persons who are not from 'India' or 'Australia'
SELECT Fname AS First_Name, Lname AS Last_Name, Country_name AS Country FROM persons
WHERE Country_name NOT IN ('India', 'Australia') ;

-- (9) Retrieve countries where the population is between 5 lakhs (500,000) and 20 lakhs (2 million)
SELECT Country_name AS Country FROM persons
WHERE Population BETWEEN 500000 AND 2000000 ;

-- (10) Fetch all countries whose names do not begin with the letter 'C'
SELECT Country_name AS Country FROM persons
WHERE Country_name NOT LIKE 'C%' ;