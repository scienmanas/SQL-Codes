SET SQL_SAFE_UPDATES = 0;

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
    -- ON UPDATE CASCADE
    -- ON DELETE CASCADE
);

-- SELECT DISTINCT author_id AS id
-- FROM Views
-- WHERE author_id  = viewer_id
-- ORDER BY id ASC;

ALTER TABLE student
ADD COLUMN age INT;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

INSERT INTO student
(rollno, name, marks, grade, city, age)
VALUES
(107, "Manas", 99, "A", "Gorakhpur", 100);

ALTER TABLE student
CHANGE age stu_age INT;

INSERT INTO student
(rollno, name, marks, grade, city, stu_age)
VALUES
(107, "Manas", 99, "A", "Gorakhpur", 100);

INSERT INTO student
(name, marks, grade, stu_age)
VALUES
("Manas", 99, "A", 100);

ALTER TABLE student
DROP COLUMN stu_age;

ALTER TABLE student
RENAME To stu

ALTER TABLE stu
RENAME TO student

ALTER TABLE student
CHANGE name full_name VARCHAR(50);
DELETE FROM student
WHERE marks < 80;
ALTER TABLE student
DROP COLUMN grade;

