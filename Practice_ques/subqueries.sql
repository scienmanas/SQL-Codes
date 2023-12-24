
SELECT name, marks
FROM student
WHERE marks (SELECT AVG(marks) FROM student);

USE college_2;

SELECT rollno 
FROM student 
WHERE rollno % 2 = 0;


SELECT full_name, rollno 
FROM student
WHERE rollno IN (102,104,106);

SELECT full_name, rollno
FROM student
WHERE rollno % 2 = 0

-- Subqueries: 

SELECT full_name, rollno 
FROM student
WHERE rollno IN (SELECT rollno 
    FROM student 
    WHERE rollno % 2 = 0);


SELECT *
FROM student
WHERE city = 'Delhi'

SELECT MAX(marks)
FROM (SELECT * FROM student WHERE city = 'Delhi') AS temp;

-- OR

SELECT MAX(marks)
FROM student
WHERE city = 'Delhi';

SELECT (SELECT MAX(marks) FROM student), full_name
FROM student;

CREATE VIEW view1 AS
SELECT rollno, full_name, marks 
FROM student;

SELECT * 
FROM view1
WHERE marks > 90

DROP view1;