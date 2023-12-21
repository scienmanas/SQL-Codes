CREATE DATABASE XYZ;
USE XYZ;

-- DROP TABLE workers;

CREATE TABLE workers (
    id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    salary INT
);

INSERT INTO workers
(id, name, salary)
VALUES 
(1, 'adam', 25000),
(2, 'bob', 30000),
(3, 'casey', 40000);

SELECT * FROM workers;

CREATE TABLE emp (
    id INT,
    salary INT DEFAULT 25000
);

INSERT INTO emp (id) VALUES (101);
