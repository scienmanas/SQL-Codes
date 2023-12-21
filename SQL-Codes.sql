CREATE DATABASE temp1;

CREATE DATABASE temp2;

CREATE DATABASE IF NOT EXISTS college;

DROP DATABASE temp1;
DROP DATABASE temp2;

USE college;

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
)

INSERT INTO student Values(1, "Manas", 20);
INSERT INTO student Values(2, "Mayank", 15);

SELECT * FROM student;

-- SHOW DATABASES;
SHOW TABLES;

DROP DATABASE IF EXISTS company;

DROP TABLE student;

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

SELECT * FROM student;

INSERT INTO student
(rollno, name)
VALUES
(1, "Manas"),
(2, "Mayank"),
(3, "Rahul");

CREATE TABLE temp1 (
    id INT UNIQUE
);

INSERT INTO temp1
VALUES
(101);
INSERT INTO temp1 VALUES (101);
