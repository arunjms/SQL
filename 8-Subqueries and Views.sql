-- (1) Find the number of persons in each country
SELECT Country_name, COUNT(*) AS Person_Count 
FROM Persons 
GROUP BY Country_name;

-- (2) Find the number of persons in each country sorted from high to low
SELECT Country_name, COUNT(*) AS Person_Count 
FROM Persons 
GROUP BY Country_name 
ORDER BY Person_Count DESC;

-- (3) Find the average rating for Persons in respective countries if the average is greater than 3.0
SELECT Country_name, AVG(Rating) AS Average_Rating 
FROM Persons 
GROUP BY Country_name 
HAVING AVG(Rating) > 3.0;

-- (4) Find the countries with the same rating as the USA (Use Subqueries)
SELECT Country_name 
FROM Country 
WHERE Country_name IN (
    SELECT Country_name 
    FROM Persons 
    WHERE Country_name = 'USA'
);

-- (5) Select all countries whose population is greater than the average population of all nations
SELECT Country_name, Population 
FROM Country 
WHERE Population > (SELECT AVG(Population) FROM Country);

-- Create the Product database
CREATE DATABASE Product;

-- Use the Product database
USE Product;

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'New York', 'NY', '10001', 'US'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St', 'San Francisco', 'CA', '94101', 'US'),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com', '1122334455', '789 Pine St', 'Seattle', 'WA', '98101', 'US'),
    (4, 'Bob', 'Brown', 'bob.brown@example.com', '2233445566', '321 Maple St', 'Los Angeles', 'CA', '90001', 'US');

-- (1) Create a view named customer_info that displays Customer's full name and email address
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email 
FROM Customer;

-- Select operation for the customer_info view
SELECT * FROM customer_info;

-- (2) Create a view named US_Customers that displays customers located in the US
CREATE VIEW US_Customers AS
SELECT * FROM Customer 
WHERE Country = 'US';

-- (3) Create another view named Customer_details
CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name, 
    Email, 
    Phone_no, 
    State 
FROM Customer;

-- (4) Update phone numbers of customers who live in California for the Customer_details view
UPDATE Customer 
SET Phone_no = 'Updated_Phone' 
WHERE State = 'California';

-- (5) Count the number of customers in each state and show only states with more than 5 customers
SELECT State, COUNT(*) AS Customer_Count 
FROM Customer 
GROUP BY State 
HAVING COUNT(*) > 5;

-- (6) Write a query to return the number of customers in each state from the "customer_details" view
SELECT State, COUNT(*) AS Customer_Count 
FROM Customer_details 
GROUP BY State;

-- (7) Write a query to return all columns from the "customer_details" view sorted by the "state" column in ascending order
SELECT * 
FROM Customer_details 
ORDER BY State ASC;
