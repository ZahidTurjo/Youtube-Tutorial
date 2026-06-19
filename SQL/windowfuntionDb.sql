CREATE DATABASE window_practice;
USE window_practice;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(101,'Alice','IT',90000,'2020-01-10'),
(102,'Bob','IT',85000,'2020-03-15'),
(103,'Charlie','IT',85000,'2021-06-01'),
(104,'David','IT',70000,'2022-01-20'),

(105,'Eva','HR',75000,'2019-07-10'),
(106,'Frank','HR',65000,'2020-08-12'),
(107,'Grace','HR',65000,'2021-11-25'),

(108,'Henry','Finance',95000,'2018-05-01'),
(109,'Ivy','Finance',90000,'2019-10-15'),
(110,'Jack','Finance',80000,'2020-04-20'),

(111,'Kevin','Marketing',72000,'2021-02-11'),
(112,'Lily','Marketing',68000,'2021-05-01'),
(113,'Mike','Marketing',68000,'2022-01-01'),
(114,'Nancy','Marketing',62000,'2023-03-15');

