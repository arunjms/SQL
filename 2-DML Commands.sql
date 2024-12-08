-- Step 1: Create the Managers table with constraints
CREATE TABLE Managers (
Manager_Id VARCHAR(20) PRIMARY KEY,
First_name  VARCHAR(20) NOT NULL,
Last_Name VARCHAR (20) NOT NULL,
DOB DATE NOT NULL,
Age INT CHECK (Age >= 18 AND Age <= 100),
Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Gender varchar(20), 
Department VARCHAR(20),
Salary INT NOT NULL)

-- Step 2: Insert 10 rows into the Managers table
Insert Into Managers (Manager_Id, First_name, Last_name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'John', 'Doe', '1980-01-15', 44, 'M', 'HR', 30000),
(2, 'Jane', 'Smith', '1975-08-23', 49, 'F', 'IT', 35000),
(3, 'Aaliya', 'Khan', '1990-03-10', 34, 'F', 'Marketing', 27000),
(4, 'James', 'Bond', '1985-04-12', 39, 'M', 'IT', 40000),
(5, 'Michael', 'Clark', '1978-07-30', 46, 'M', 'Finance', 32000),
(6, 'Sarah', 'Lee', '1992-09-19', 32, 'F', 'Sales', 23000),
(7, 'David', 'Taylor', '1982-11-25', 42, 'M', 'HR', 28000),
(8, 'Emily', 'Davis', '1987-06-09', 37, 'F', 'IT', 29000),
(9, 'Chris', 'Evans', '1988-12-12', 36, 'M', 'Finance', 31000),
(10, 'Olivia', 'Johnson', '1984-05-20', 40, 'F', 'Sales', 26000);


-- Step 3: Retrieve name and date of birth of the manager with Manager_Id 1
SELECT First_Name, Last_name, DOB as Date_of_Birth From Managers
where Manager_id =1;


-- Step 4: Display the annual income of all managers
SELECT First_name, Last_name, Salary * 12 AS Annual_Income
FROM Managers;

-- Step 5: Display records of all managers except 'Aaliya'
SELECT * FROM Managers
WHERE First_name != 'Aaliya';

-- Step 6: Display details of managers in IT department earning more than 25000 per month
SELECT * FROM Managers
WHERE salary > 25000 and department = 'It'


-- Step 7: Display details of managers whose salary is between 10000 and 35000
SELECT * FROM Managers
WhERE salary Between 10000 and 35000;