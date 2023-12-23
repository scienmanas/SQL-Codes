-- SET SQL_SAFE_UPDATES = 0;

UPDATE student 
SET grade = "O"
WHERE grade = "A";

SELECT * 
FROM student;

UPDATE student
SET marks = 82
WHERE rollno = 105;

UPDATE student 
SET grade = "B"
WHERE marks > 80;

UPDATE student
SET marks = marks + 1;

UPDATE student
SET marks = 12
WHERE name = "emanuel";

DELETE FROM student
WHERE marks < 20

-- DELETE FROM student
-- All data will be deleted 

CREATE TABLE dept (
    id INt PRIMARY Key,
    name VARCHAR(50)
);

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
);

-- SELECT DISTINCT author_id AS id
-- FROM Views
-- WHERE author_id  = viewer_id
-- ORDER BY id ASC;