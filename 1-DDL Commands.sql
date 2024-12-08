CREATE DATABASE School;

-- Step 1: Create the STUDENT table

CREATE TABLE STUDENT (
	Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade VARCHAR(2)
);

-- Step 2: Insert sample data
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade)
VALUES
(1, 'Alice', 85, 'A'),
(2, 'James', 75, 'B'),
(3, 'Charlie', 90, 'A+'),
(4, 'Rahul', 65, 'C'),
(5, 'Eve', 88, 'A');

-- Step 3: Display the data
SELECT * FROM STUDENT;

-- Step 4: Add a Contact column
ALTER TABLE STUDENT ADD COLUMN Contact VARCHAR(20);

-- Step 5: Remove the Grade column
ALTER TABLE STUDENT DROP COLUMN grade;


-- Step 6: Rename the table to CLASSTEN
RENAME TABLE Student to classten

-- Step 7: Delete all rows (or truncate)
TRUNCATE TABLE CLASSTEN;

-- Step 8: Drop the table
DROP TABLE CLASSTEN;