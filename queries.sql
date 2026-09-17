-- =====================================================
-- UNIVERSITY COURSE MANAGEMENT SYSTEM
-- PR. FINAL PROJECT - MYSQL
-- =====================================================

-- 1. CREATE DATABASE

DROP DATABASE IF EXISTS UniversityCourseManagement;
--Query OK, 5 rows affected (0.03 sec)

CREATE DATABASE UniversityCourseManagement;
--Query OK, 1 row affected (0.00 sec)

USE UniversityCourseManagement;
--Database changed

-- =====================================================
-- 2. CREATE TABLES
-- =====================================================

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
--Query OK, 0 rows affected (0.01 sec)

-- Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    BirthDate DATE NOT NULL,
    EnrollmentDate DATE NOT NULL
);
--Query OK, 0 rows affected (0.01 sec)

-- Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Credits INT NOT NULL,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID),
    CHECK (Credits > 0)
);
--Query OK, 0 rows affected (0.01 sec)

-- Instructors Table
-- Salary column added as requested
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID),
    CHECK (Salary >= 0)
);
--Query OK, 0 rows affected (0.01 sec)

-- Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Courses(CourseID),
    UNIQUE (StudentID, CourseID)
);
--Query OK, 0 rows affected (0.01 sec)

-- =====================================================
-- 3. INSERT SAMPLE DATA
-- =====================================================

-- Departments
INSERT INTO Departments
(DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics');
--Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

-- Students
INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com',
 '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com',
 '1999-05-25', '2021-08-01'),
(3, 'Rahul', 'Patel', 'rahul.patel@email.com',
 '2002-03-10', '2023-08-01'),
(4, 'Krisha', 'Tandel', 'krisha.tandel@email.com',
 '2007-01-31', '2024-08-01'),
(5, 'Aarav', 'Shah', 'aarav.shah@email.com',
 '2001-11-20', '2022-08-01'),
(6, 'Diya', 'Mehta', 'diya.mehta@email.com',
 '2003-06-15', '2025-08-01');
 --Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

-- Courses
INSERT INTO Courses
(CourseID, CourseName, DepartmentID, Credits)
VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Database Management Systems', 1, 4),
(104, 'Web Development', 1, 3),
(105, 'Probability Theory', 2, 4),
(106, 'Linear Algebra', 2, 3);
--Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

-- Instructors
-- Salary included in the sample data
INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com',
 1, 85000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com',
 2, 78000.00),
(3, 'Charlie', 'Brown', 'charlie.brown@univ.com',
 1, 95000.00),
(4, 'Diana', 'Wilson', 'diana.wilson@univ.com',
 2, 82000.00);
 --Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

-- Enrollments
INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, 101, '2022-08-01'),
(2, 1, 102, '2022-08-01'),
(3, 2, 101, '2021-08-01'),
(4, 2, 102, '2021-08-01'),
(5, 3, 103, '2023-08-01'),
(6, 3, 104, '2023-08-01'),
(7, 4, 101, '2024-08-01'),
(8, 4, 103, '2024-08-01'),
(9, 5, 102, '2022-08-01'),
(10, 5, 105, '2022-08-01'),
(11, 6, 104, '2025-08-01'),
(12, 6, 106, '2025-08-01');
--Query OK, 12 rows affected (0.00 sec)
Records: 12  Duplicates: 0  Warnings: 0

-- =====================================================
-- 4. DISPLAY ALL TABLES
-- =====================================================

SELECT * FROM Departments;
--+--------------+------------------+
| DepartmentID | DepartmentName   |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mathematics      |
+--------------+------------------+
2 rows in set (0.00 sec)

SELECT * FROM Students;
--+-----------+-----------+----------+-------------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                   | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+-------------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com      | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com    | 1999-05-25 | 2021-08-01     |
|         3 | Rahul     | Patel    | rahul.patel@email.com   | 2002-03-10 | 2023-08-01     |
|         4 | Krisha    | Tandel   | krisha.tandel@email.com | 2007-01-31 | 2024-08-01     |
|         5 | Aarav     | Shah     | aarav.shah@email.com    | 2001-11-20 | 2022-08-01     |
|         6 | Diya      | Mehta    | diya.mehta@email.com    | 2003-06-15 | 2025-08-01     |
+-----------+-----------+----------+-------------------------+------------+----------------+
6 rows in set (0.00 sec)

SELECT * FROM Courses;
--+----------+-----------------------------+--------------+---------+
| CourseID | CourseName                  | DepartmentID | Credits |
+----------+-----------------------------+--------------+---------+
|      101 | Introduction to SQL         |            1 |       3 |
|      102 | Data Structures             |            2 |       4 |
|      103 | Database Management Systems |            1 |       4 |
|      104 | Web Development             |            1 |       3 |
|      105 | Probability Theory          |            2 |       4 |
|      106 | Linear Algebra              |            2 |       3 |
+----------+-----------------------------+--------------+---------+
6 rows in set (0.01 sec)

SELECT * FROM Instructors;
--+--------------+-----------+----------+------------------------+--------------+----------+
| InstructorID | FirstName | LastName | Email                  | DepartmentID | Salary   |
+--------------+-----------+----------+------------------------+--------------+----------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 | 85000.00 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 | 78000.00 |
|            3 | Charlie   | Brown    | charlie.brown@univ.com |            1 | 95000.00 |
|            4 | Diana     | Wilson   | diana.wilson@univ.com  |            2 | 82000.00 |
+--------------+-----------+----------+------------------------+--------------+----------+
4 rows in set (0.00 sec)

SELECT * FROM Enrollments;
--+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         1 |      102 | 2022-08-01     |
|            3 |         2 |      101 | 2021-08-01     |
|            4 |         2 |      102 | 2021-08-01     |
|            5 |         3 |      103 | 2023-08-01     |
|            6 |         3 |      104 | 2023-08-01     |
|            7 |         4 |      101 | 2024-08-01     |
|            8 |         4 |      103 | 2024-08-01     |
|            9 |         5 |      102 | 2022-08-01     |
|           10 |         5 |      105 | 2022-08-01     |
|           11 |         6 |      104 | 2025-08-01     |
|           12 |         6 |      106 | 2025-08-01     |
+--------------+-----------+----------+----------------+
12 rows in set (0.00 sec)

-- =====================================================
-- 5. CRUD OPERATIONS ON ALL TABLES
-- =====================================================

-- CREATE / INSERT

INSERT INTO Departments
VALUES (3, 'Physics');
--Query OK, 1 row affected (0.01 sec)

INSERT INTO Students
VALUES (7, 'Riya', 'Desai', 'riya.desai@email.com',
        '2002-09-12', '2026-08-01');
        --Query OK, 1 row affected (0.00 sec)

INSERT INTO Courses
VALUES (107, 'Physics Fundamentals', 3, 4);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Instructors
VALUES (5, 'Ethan', 'Miller', 'ethan.miller@univ.com',
        3, 76000.00);
        ---Query OK, 1 row affected (0.00 sec)
    

INSERT INTO Enrollments
VALUES (13, 7, 107, '2026-08-01');
---Query OK, 1 row affected (0.01 sec)

-- READ / SELECT

SELECT * FROM Departments;
--+--------------+------------------+
| DepartmentID | DepartmentName   |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mathematics      |
|            3 | Physics          |
+--------------+------------------+
3 rows in set (0.00 sec)

SELECT * FROM Students;
--+-----------+-----------+----------+-------------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                   | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+-------------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com      | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com    | 1999-05-25 | 2021-08-01     |
|         3 | Rahul     | Patel    | rahul.patel@email.com   | 2002-03-10 | 2023-08-01     |
|         4 | Krisha    | Tandel   | krisha.tandel@email.com | 2007-01-31 | 2024-08-01     |
|         5 | Aarav     | Shah     | aarav.shah@email.com    | 2001-11-20 | 2022-08-01     |
|         6 | Diya      | Mehta    | diya.mehta@email.com    | 2003-06-15 | 2025-08-01     |
|         7 | Riya      | Desai    | riya.desai@email.com    | 2002-09-12 | 2026-08-01     |
+-----------+-----------+----------+-------------------------+------------+----------------+
7 rows in set (0.00 sec)

SELECT * FROM Courses;
--+----------+-----------------------------+--------------+---------+
| CourseID | CourseName                  | DepartmentID | Credits |
+----------+-----------------------------+--------------+---------+
|      101 | Introduction to SQL         |            1 |       3 |
|      102 | Data Structures             |            2 |       4 |
|      103 | Database Management Systems |            1 |       4 |
|      104 | Web Development             |            1 |       3 |
|      105 | Probability Theory          |            2 |       4 |
|      106 | Linear Algebra              |            2 |       3 |
|      107 | Physics Fundamentals        |            3 |       4 |
+----------+-----------------------------+--------------+---------+
7 rows in set (0.00 sec)


SELECT * FROM Instructors;
+--------------+-----------+----------+------------------------+--------------+----------+
| InstructorID | FirstName | LastName | Email                  | DepartmentID | Salary   |
+--------------+-----------+----------+------------------------+--------------+----------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 | 85000.00 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 | 78000.00 |
|            3 | Charlie   | Brown    | charlie.brown@univ.com |            1 | 95000.00 |
|            4 | Diana     | Wilson   | diana.wilson@univ.com  |            2 | 82000.00 |
|            5 | Ethan     | Miller   | ethan.miller@univ.com  |            3 | 76000.00 |
+--------------+-----------+----------+------------------------+--------------+----------+
5 rows in set (0.00 sec)

SELECT * FROM Enrollments;
----------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         1 |      102 | 2022-08-01     |
|            3 |         2 |      101 | 2021-08-01     |
|            4 |         2 |      102 | 2021-08-01     |
|            5 |         3 |      103 | 2023-08-01     |
|            6 |         3 |      104 | 2023-08-01     |
|            7 |         4 |      101 | 2024-08-01     |
|            8 |         4 |      103 | 2024-08-01     |
|            9 |         5 |      102 | 2022-08-01     |
|           10 |         5 |      105 | 2022-08-01     |
|           11 |         6 |      104 | 2025-08-01     |
|           12 |         6 |      106 | 2025-08-01     |
|           13 |         7 |      107 | 2026-08-01     |
+--------------+-----------+----------+----------------+
13 rows in set (0.00 sec)

-- UPDATE

UPDATE Departments
SET DepartmentName = 'Physics and Applied Sciences'
WHERE DepartmentID = 3;
--Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

UPDATE Students
SET Email = 'riya.desai.updated@email.com'
WHERE StudentID = 7;
--Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

UPDATE Courses
SET Credits = 3
WHERE CourseID = 107;
--Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

UPDATE Instructors
SET Salary = 80000.00
WHERE InstructorID = 5;
--Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

UPDATE Enrollments
SET EnrollmentDate = '2026-08-15'
WHERE EnrollmentID = 13;
--Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- DELETE
-- Delete the records inserted above

DELETE FROM Enrollments
WHERE EnrollmentID = 13;
--Query OK, 1 row affected (0.01 sec)

DELETE FROM Instructors
WHERE InstructorID = 5;
--Query OK, 1 row affected (0.00 sec)



DELETE FROM Courses
WHERE CourseID = 107;
--Query OK, 1 row affected (0.00 sec)

DELETE FROM Students
WHERE StudentID = 7;
--Query OK, 1 row affected (0.00 sec)

DELETE FROM Departments
WHERE DepartmentID = 3;
--    -> WHERE DepartmentID = 3;
Query OK, 1 row affected (0.00 sec)

-- =====================================================
-- 6. STUDENTS WHO ENROLLED AFTER 2022
-- =====================================================

SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';
--+-----------+-----------+----------+-------------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                   | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+-------------------------+------------+----------------+
|         3 | Rahul     | Patel    | rahul.patel@email.com   | 2002-03-10 | 2023-08-01     |
|         4 | Krisha    | Tandel   | krisha.tandel@email.com | 2007-01-31 | 2024-08-01     |
|         6 | Diya      | Mehta    | diya.mehta@email.com    | 2003-06-15 | 2025-08-01     |
+-----------+-----------+----------+-------------------------+------------+----------------+
3 rows in set (0.00 sec)

-- =====================================================
-- 7. MATHEMATICS COURSES WITH LIMIT 5
-- =====================================================

SELECT c.CourseID,
       c.CourseName,
       d.DepartmentName,
       c.Credits
FROM Courses c
INNER JOIN Departments d
    ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

--+----------+--------------------+----------------+---------+
| CourseID | CourseName         | DepartmentName | Credits |
+----------+--------------------+----------------+---------+
|      102 | Data Structures    | Mathematics    |       4 |
|      105 | Probability Theory | Mathematics    |       4 |
|      106 | Linear Algebra     | Mathematics    |       3 |
+----------+--------------------+----------------+---------+
3 rows in set (0.00 sec)

-- =====================================================
-- 8. NUMBER OF STUDENTS IN EACH COURSE
-- FILTER MORE THAN 5 STUDENTS
-- =====================================================

SELECT c.CourseID,
       c.CourseName,
       COUNT(e.StudentID) AS StudentCount
FROM Courses c
INNER JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;
--Empty set (0.00 sec)

-- =====================================================
-- 9. STUDENTS ENROLLED IN BOTH COURSES
-- INTRODUCTION TO SQL AND DATA STRUCTURES
-- =====================================================

SELECT s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName IN
      ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;
-------------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | John      | Doe      |
|         2 | Jane      | Smith    |
+-----------+-----------+----------+
2 rows in set (0.00 sec)


-- =====================================================
-- 10. STUDENTS ENROLLED IN EITHER COURSE
-- UNION REMOVES DUPLICATE STUDENTS
-- =====================================================

SELECT s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Introduction to SQL'

UNION

SELECT s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Data Structures';

--    -> WHERE c.CourseName = 'Data Structures';
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | John      | Doe      |
|         2 | Jane      | Smith    |
|         4 | Krisha    | Tandel   |
|         5 | Aarav     | Shah     |
+-----------+-----------+----------+
4 rows in set (0.01 sec)

-- =====================================================
-- 11. AVERAGE NUMBER OF CREDITS
-- =====================================================

SELECT AVG(Credits) AS AverageCredits
FROM Courses;

--+----------------+
| AverageCredits |
+----------------+
|         3.5000 |
+----------------+
1 row in set (0.00 sec)

-- =====================================================
-- 12. MAXIMUM SALARY IN COMPUTER SCIENCE
-- =====================================================

SELECT MAX(i.Salary) AS MaximumSalary
FROM Instructors i
INNER JOIN Departments d
    ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

--+---------------+
| MaximumSalary |
+---------------+
|      95000.00 |
+---------------+
1 row in set (0.00 sec)

-- =====================================================
-- 13. NUMBER OF STUDENTS IN EACH DEPARTMENT
-- =====================================================

SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

--+--------------+------------------+--------------+
| DepartmentID | DepartmentName   | StudentCount |
+--------------+------------------+--------------+
|            1 | Computer Science |            5 |
|            2 | Mathematics      |            4 |
+--------------+------------------+--------------+
2 rows in set (0.00 sec)

-- =====================================================
-- 14. INNER JOIN
-- STUDENTS AND THEIR CORRESPONDING COURSES
-- =====================================================

SELECT s.StudentID,
       CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
       c.CourseID,
       c.CourseName,
       e.EnrollmentDate
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID;

    --+-----------+---------------+----------+-----------------------------+----------------+
| StudentID | StudentName   | CourseID | CourseName                  | EnrollmentDate |
+-----------+---------------+----------+-----------------------------+----------------+
|         1 | John Doe      |      101 | Introduction to SQL         | 2022-08-01     |
|         1 | John Doe      |      102 | Data Structures             | 2022-08-01     |
|         2 | Jane Smith    |      101 | Introduction to SQL         | 2021-08-01     |
|         2 | Jane Smith    |      102 | Data Structures             | 2021-08-01     |
|         3 | Rahul Patel   |      103 | Database Management Systems | 2023-08-01     |
|         3 | Rahul Patel   |      104 | Web Development             | 2023-08-01     |
|         4 | Krisha Tandel |      101 | Introduction to SQL         | 2024-08-01     |
|         4 | Krisha Tandel |      103 | Database Management Systems | 2024-08-01     |
|         5 | Aarav Shah    |      102 | Data Structures             | 2022-08-01     |
|         5 | Aarav Shah    |      105 | Probability Theory          | 2022-08-01     |
|         6 | Diya Mehta    |      104 | Web Development             | 2025-08-01     |
|         6 | Diya Mehta    |      106 | Linear Algebra              | 2025-08-01     |
+-----------+---------------+----------+-----------------------------+----------------+
12 rows in set (0.01 sec)

-- =====================================================
-- 15. LEFT JOIN
-- ALL STUDENTS AND THEIR COURSES, IF ANY
-- =====================================================

SELECT s.StudentID,
       CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
       c.CourseName,
       e.EnrollmentDate
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
LEFT JOIN Courses c
    ON e.CourseID = c.CourseID;
    --+-----------+---------------+-----------------------------+----------------+
| StudentID | StudentName   | CourseName                  | EnrollmentDate |
+-----------+---------------+-----------------------------+----------------+
|         1 | John Doe      | Introduction to SQL         | 2022-08-01     |
|         1 | John Doe      | Data Structures             | 2022-08-01     |
|         2 | Jane Smith    | Introduction to SQL         | 2021-08-01     |
|         2 | Jane Smith    | Data Structures             | 2021-08-01     |
|         3 | Rahul Patel   | Database Management Systems | 2023-08-01     |
|         3 | Rahul Patel   | Web Development             | 2023-08-01     |
|         4 | Krisha Tandel | Introduction to SQL         | 2024-08-01     |
|         4 | Krisha Tandel | Database Management Systems | 2024-08-01     |
|         5 | Aarav Shah    | Data Structures             | 2022-08-01     |
|         5 | Aarav Shah    | Probability Theory          | 2022-08-01     |
|         6 | Diya Mehta    | Web Development             | 2025-08-01     |
|         6 | Diya Mehta    | Linear Algebra              | 2025-08-01     |
+-----------+---------------+-----------------------------+----------------+
12 rows in set (0.00 sec)



-- =====================================================
-- 16. SUBQUERY
-- STUDENTS IN COURSES WITH MORE THAN 10 STUDENTS
-- =====================================================

SELECT DISTINCT
       s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
WHERE e.CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10
);

--Empty set (0.00 sec)

-- =====================================================
-- 17. EXTRACT YEAR FROM ENROLLMENT DATE
-- =====================================================

SELECT StudentID,
       CONCAT(FirstName, ' ', LastName) AS StudentName,
       EnrollmentDate,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;
--+-----------+---------------+----------------+----------------+
| StudentID | StudentName   | EnrollmentDate | EnrollmentYear |
+-----------+---------------+----------------+----------------+
|         1 | John Doe      | 2022-08-01     |           2022 |
|         2 | Jane Smith    | 2021-08-01     |           2021 |
|         3 | Rahul Patel   | 2023-08-01     |           2023 |
|         4 | Krisha Tandel | 2024-08-01     |           2024 |
|         5 | Aarav Shah    | 2022-08-01     |           2022 |
|         6 | Diya Mehta    | 2025-08-01     |           2025 |
+-----------+---------------+----------------+----------------+
6 rows in set (0.00 sec)

-- =====================================================
-- 18. CONCATENATE INSTRUCTOR FIRST AND LAST NAME
-- =====================================================

SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS InstructorName,
       Email,
       Salary
FROM Instructors;

--+--------------+----------------+------------------------+----------+
| InstructorID | InstructorName | Email                  | Salary   |
+--------------+----------------+------------------------+----------+
|            1 | Alice Johnson  | alice.johnson@univ.com | 85000.00 |
|            2 | Bob Lee        | bob.lee@univ.com       | 78000.00 |
|            3 | Charlie Brown  | charlie.brown@univ.com | 95000.00 |
|            4 | Diana Wilson   | diana.wilson@univ.com  | 82000.00 |
+--------------+----------------+------------------------+----------+
4 rows in set (0.00 sec)



-- =====================================================
-- 19. RUNNING TOTAL OF STUDENTS ENROLLED IN COURSES
-- =====================================================

SELECT c.CourseID,
       c.CourseName,
       COUNT(e.StudentID) AS StudentCount,
       SUM(COUNT(e.StudentID)) OVER (
           ORDER BY c.CourseID
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RunningTotal
FROM Courses c
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY c.CourseID;

--+----------+-----------------------------+--------------+--------------+
| CourseID | CourseName                  | StudentCount | RunningTotal |
+----------+-----------------------------+--------------+--------------+
|      101 | Introduction to SQL         |            3 |            3 |
|      102 | Data Structures             |            3 |            6 |
|      103 | Database Management Systems |            2 |            8 |
|      104 | Web Development             |            2 |           10 |
|      105 | Probability Theory          |            1 |           11 |
|      106 | Linear Algebra              |            1 |           12 |
+----------+-----------------------------+--------------+--------------+
6 rows in set (0.00 sec)

-- =====================================================
-- 20. LABEL STUDENTS AS SENIOR OR JUNIOR
-- SENIOR IF MORE THAN 4 YEARS FROM CURRENT DATE
-- =====================================================

SELECT StudentID,
       CONCAT(FirstName, ' ', LastName) AS StudentName,
       EnrollmentDate,
       CASE
           WHEN EnrollmentDate < DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
               THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students;
--+-----------+---------------+----------------+--------------+
| StudentID | StudentName   | EnrollmentDate | StudentLevel |
+-----------+---------------+----------------+--------------+
|         1 | John Doe      | 2022-08-01     | Senior       |
|         2 | Jane Smith    | 2021-08-01     | Senior       |
|         3 | Rahul Patel   | 2023-08-01     | Junior       |
|         4 | Krisha Tandel | 2024-08-01     | Junior       |
|         5 | Aarav Shah    | 2022-08-01     | Senior       |
|         6 | Diya Mehta    | 2025-08-01     | Junior       |
+-----------+---------------+----------------+--------------+
6 rows in set (0.00 sec)

-- =====================================================
-- END OF PROJECT
-- =====================================================