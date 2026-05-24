-- =========================================
-- CREATE DATABASE
-- =========================================

CREATE DATABASE company_db;
USE company_db;

-- =========================================
-- CREATE TABLES
-- =========================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT,
    manager_id INT,
    hire_date DATE
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    department_id INT,
    budget INT
);

CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    hours_worked INT
);

-- =========================================
-- INSERT DATA
-- =========================================

-- Departments

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Sales'),
(4, 'Finance');

-- Employees

INSERT INTO employees VALUES
(101, 'Alice', 2, 90000, NULL, '2020-01-10'),
(102, 'Bob', 2, 70000, 101, '2021-03-15'),
(103, 'Charlie', 3, 60000, NULL, '2019-07-20'),
(104, 'David', 3, 65000, 103, '2022-01-12'),
(105, 'Eva', 1, 50000, NULL, '2021-11-11'),
(106, 'Frank', 4, 80000, NULL, '2018-05-05'),
(107, 'Grace', 2, 75000, 101, '2023-02-01'),
(108, 'Helen', 4, 82000, 106, '2020-08-18');

-- Projects

INSERT INTO projects VALUES
(1, 'AI Platform', 2, 200000),
(2, 'Sales Dashboard', 3, 120000),
(3, 'Payroll System', 4, 90000),
(4, 'Recruitment Portal', 1, 70000);

-- Employee Projects

INSERT INTO employee_projects VALUES
(101, 1, 120),
(102, 1, 100),
(107, 1, 90),
(103, 2, 110),
(104, 2, 95),
(106, 3, 130),
(108, 3, 120),
(105, 4, 80);