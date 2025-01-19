CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);

-- Populate the Worker table with sample data
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(1, 'John', 'Doe', 50000, '2023-01-01', 'HR'),
(2, 'Jane', 'Smith', 60000, '2022-07-15', 'Finance'),
(3, 'Robert', 'Brown', 55000, '2021-03-20', 'IT'),
(4, 'Emily', 'Davis', 45000, '2020-11-11', 'HR'),
(5, 'Michael', 'Wilson', 70000, '2019-05-25', 'Finance'),
(6, 'Sarah', 'Miller', 48000, '2023-02-28', 'Marketing'),
(7, 'David', 'Anderson', 52000, '2022-08-16', 'IT'),
(8, 'Laura', 'Taylor', 53000, '2021-12-01', 'Marketing'),
(9, 'James', 'Thomas', 58000, '2020-09-10', 'HR'),
(10, 'Linda', 'White', 62000, '2018-06-05', 'Finance');

-- 1. Stored Procedure to Add a New Worker Record
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

-- Call the AddWorker procedure
CALL AddWorker(11, 'Alice', 'Johnson', 54000, '2023-03-01', 'IT');


-- 2. Stored Procedure to Retrieve Salary of a Worker
DELIMITER $$

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Call the GetWorkerSalary procedure
CALL GetWorkerSalary(1, @salary);
SELECT @salary AS WorkerSalary;


-- 3. Stored Procedure to Update Department of a Worker
DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Call the UpdateWorkerDepartment procedure
CALL UpdateWorkerDepartment(1, 'Finance');


-- 4. Stored Procedure to Retrieve Number of Workers in a Department
DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;

-- Call the GetWorkerCountByDepartment procedure
CALL GetWorkerCountByDepartment('HR', @workerCount);
SELECT @workerCount AS WorkerCount;


-- 5. Stored Procedure to Retrieve Average Salary in a Department
DELIMITER $$

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;

-- Call the GetAverageSalaryByDepartment procedure
CALL GetAverageSalaryByDepartment('HR', @avgSalary);
SELECT @avgSalary AS AverageSalary;