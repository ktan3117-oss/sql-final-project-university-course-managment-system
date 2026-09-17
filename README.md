# sql-final-project-university-course-managment-system
🎓 University Course Management System

A MySQL-based database project for managing university students, courses, instructors, enrollments, and departments. This project demonstrates SQL concepts through practical queries, CRUD operations, joins, subqueries, aggregate functions, and window functions.

---

📋 Table of Contents

- 📌 "Overview" (#-overview)
- 🎯 "Problem Statement" (#-problem-statement)
- ✨ "Key Features" (#-key-features)
- 🏗️ "Project Structure" (#-project-structure)
- 🔄 "Project Workflow" (#-project-workflow)
- 📥 "Part A — Database Design & Data Input" (#-part-a--database-design--data-input)
- 📊 "Part B — SQL Analysis & Operations" (#-part-b--sql-analysis--operations)
- 🛠️ "Tech Stack" (#️-tech-stack)
- 📈 "Results & Insights" (#-results--insights)
- 🏆 "Advantages" (#-advantages)
- 📄 "License" (#-license)
- 👤 "Author" (#-author)
- 🙏 "Acknowledgements" (#-acknowledgements)

---

📌 Overview

The University Course Management System is a beginner-friendly MySQL database project developed to demonstrate fundamental and advanced SQL concepts. It manages university-related information through five interconnected tables: Students, Courses, Instructors, Enrollments, and Departments.

The project uses a relational database structure with primary keys, foreign keys, and constraints to maintain data integrity. It also includes practical SQL queries to retrieve, update, analyze, and organize university data.

This project is designed to:

- Demonstrate database creation and relational table design.
- Practice SQL commands and CRUD operations.
- Understand relationships between students, courses, and departments.
- Perform data analysis using aggregate functions, joins, subqueries, and window functions.
- Develop practical database management skills using MySQL.

---

🎯 Problem Statement

Universities need an organized system to manage student records, course information, instructor details, and enrollment data. Managing these records manually can make it difficult to retrieve information, track enrollments, and analyze academic data.

The objective of this project is to develop a relational database that stores university information efficiently and supports SQL queries for retrieving, modifying, and analyzing data.

---

✨ Key Features

- 🗄️ Database and table creation using SQL.
- 👨‍🎓 Student record management.
- 📚 Course and credit management.
- 👩‍🏫 Instructor details with salary information.
- 🏛️ Department management.
- 📝 Student enrollment tracking.
- 🔄 CRUD operations on all five tables.
- 🔗 INNER JOIN and LEFT JOIN queries.
- 📊 Aggregate functions such as COUNT, AVG, and MAX.
- 🔍 Subqueries and filtering using WHERE and HAVING.
- 📅 Date functions and year extraction.
- 📈 Running totals using window functions.
- 🏷️ Senior and Junior student classification.
- 📖 Complete project documentation and GitHub submission.

---

🏗️ Project Structure

University-Course-Management/
│
├── university_course_management.sql
├── README.md
└── screenshots/
    ├── database.png
    ├── students.png
    ├── courses.png
    └── query_results.png

Database Tables

Table| Purpose
Students| Stores student personal and enrollment information.
Courses| Stores course names, departments, and credits.
Instructors| Stores instructor details, departments, and salaries.
Enrollments| Connects students with their enrolled courses.
Departments| Stores university department information.

---

🔄 Project Workflow

1. Create the UniversityCourseManagement database.
2. Create all five relational tables.
3. Define primary keys, foreign keys, and constraints.
4. Insert sample data into the tables.
5. Perform CRUD operations.
6. Execute the assigned SQL queries.
7. Verify the query results.
8. Document the project and upload it to GitHub.

---

📥 Part A — Database Design & Data Input

Database Creation

The project begins by creating a MySQL database named "UniversityCourseManagement".

Table Creation

Five tables are created with suitable data types and relationships.

- Students: StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate.
- Courses: CourseID, CourseName, DepartmentID, Credits.
- Instructors: InstructorID, FirstName, LastName, Email, DepartmentID, Salary.
- Enrollments: EnrollmentID, StudentID, CourseID, EnrollmentDate.
- Departments: DepartmentID, DepartmentName.

Sample Data

Sample records are inserted into each table to demonstrate database operations and execute the required SQL queries.

The Instructors table includes a Salary column with the data type "DECIMAL(10,2)".

---

📊 Part B — SQL Analysis & Operations

The project implements the following practical SQL tasks:

CRUD Operations

- CREATE — Insert new records.
- READ — Retrieve records using SELECT.
- UPDATE — Modify existing records.
- DELETE — Remove records.

Data Retrieval and Analysis

- Retrieve students enrolled after 2022.
- Retrieve Mathematics department courses with a limit of 5.
- Count students enrolled in each course with more than 5 students.
- Find students enrolled in both Introduction to SQL and Data Structures.
- Find students enrolled in either of the two courses.
- Calculate the average credits of all courses.
- Find the maximum instructor salary in Computer Science.
- Count students enrolled in each department.

SQL Concepts Demonstrated

- INNER JOIN and LEFT JOIN.
- Subqueries.
- UNION.
- GROUP BY and HAVING.
- Aggregate functions.
- YEAR() and date functions.
- CONCAT() for instructor names.
- CASE statements for student classification.
- Window functions for running totals.

---

🛠️ Tech Stack

Technology| Purpose
MySQL| Relational database management system.
SQL| Database creation, manipulation, and analysis.
VS Code| Writing and managing SQL source code.
GitHub| Version control and project submission.

---

📈 Results & Insights

The University Course Management System successfully demonstrates the use of SQL for managing and analyzing relational data.

The project provides practical results such as:

- Student enrollment information by course and department.
- Average course credits.
- Maximum instructor salary in the Computer Science department.
- Student details with their corresponding courses.
- Running totals of student enrollments.
- Student classification based on enrollment date.

The sample database is designed for academic demonstration and can be extended with additional students, courses, instructors, and departments.

---

🏆 Advantages

- Easy to understand and implement.
- Organized relational database structure.
- Reduces data redundancy through separate tables.
- Maintains relationships using foreign keys.
- Demonstrates important SQL concepts in one project.
- Suitable for academic practical examination and viva.
- Can be expanded into a complete university management application.

---

📄 License

This project is developed for educational and academic purposes. The source code is intended for learning and demonstrating SQL database management concepts.

---

👤 Author

Krisha Tandel

B.Tech Computer Science and Engineering



