-- Step 1: Create the teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(100),
    experience INT,
    salary DECIMAL(10, 2));
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'John Doe', 'Math', 12, 60000),
(2, 'Jane Smith', 'Science', 8, 55000),
(3, 'Emily Davis', 'English', 5, 50000),
(4, 'Michael Brown', 'History', 3, 48000),
(5, 'Sarah Wilson', 'Biology', 10, 53000),
(6, 'James Anderson', 'Chemistry', 15, 70000),
(7, 'Patricia Taylor', 'Physics', 6, 52000),
(8, 'Robert Martinez', 'Geography', 2, 45000);

-- Step 2: Create a before insert trigger for salary validation
DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;//
DELIMITER ;
-- Step 3: Create the teacher_log table
CREATE TABLE teacher_log (
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

-- Create an after insert trigger for logging
DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END;//
DELIMITER ;
-- Step 4: Create a before delete trigger for experience validation
DELIMITER //
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END;//
DELIMITER ;
-- Step 5: Create an after delete trigger for logging
DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END;//
DELIMITER ;