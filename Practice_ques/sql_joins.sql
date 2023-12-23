CREATE DATABASE college_3;
USE college_3;

CREATE TABLE student (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO student
(id, name) 
VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");

CREATE TABLE course (
    id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO course
(id, course)
VALUES
(102, "english"),
(105, "math"),
(103, "science"),
(107, "computer science");

SELECT * 
FROM student
INNER JOIN course
ON student.id = course.id;

SELECT * 
FROM student
LEFT JOIN course
ON student.id = course.id
WHERE course.id IS NULL;

SELECT *
FROM student
RIGHT JOIN course
ON student.id = course.id
WHERE student.id IS NULL;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT a.name as manager_name, b.name
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id;