CREATE DATABASE college_2;
USE college_2;

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student 
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 91, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT name, marks FROM student;
-- SELECT DISTINCT city, marks FROM student;
SELECT DISTINCT city FROM student;

SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city = "Mumbai" AND marks > 80;

SELECT COUNT(rollno) FROM student;

SELECT city, COUNT(rollno)
FROM student 
GROUP By city;

SELECT city, name, COUNT(rollno)
FROM student 
GROUP By city, name;

SELECT city, name, COUNT(rollno)
FROM student 
GROUP By city;

SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY avg(marks) DESC;

-- SELECT mode, COUNT(customer_id)
-- FROM table
-- GROUP BY mode

SELECT city, COUNT(rollno)
FROM student
GROUP BY city
HAVING max(marks) > 90;

SELECT city
FROM student
WHERE grade="A"
GROUP By city
HAVING MAX(marks) > 90
ORDER By city ASC;