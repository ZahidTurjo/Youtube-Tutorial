USE company_db;
-- Q1. Find employees earning more than average salary
SELECT * from employees
where salary>
(SELECT avg(salary) from employees);


-- Q2. Find highest paid employee in each department
SELECT * from employees e
where salary=(
SELECT max(salary)
from employees 
where department_id=e.department_id
);

Select department_id, max(salary)
from employees
group by 1;






-- Q3. Find employees working on projects 
-- with budget > average budget

SELECT * from employees
where emp_id in (
SELECT emp_id from employee_projects
where project_id in (
SELECT project_id from projects
where budget>(
SELECT avg(budget) from projects)));




-- Q4. Find second highest salary
Select max(salary) from employees
where salary<
(SELECT max(salary) from employees);


SELECT * from employees
ORDER BY salary desc
limit 1 OFFSET 1;

SELECT * from employees
ORDER BY salary desc
limit 1 OFFSET 2;




-- Q5. Find employees who earn more than their manager
select emp_id,
emp_name,salary from employees e
where salary>
(
	SELECT salary from employees
    where emp_id=e.manager_id
);






-- Q6. Find departments with no projects
SELECT * from departments
where department_id not in 
(SELECT department_id from projects);




-- Q7. Find employees not assigned to any project





 -- Q8. Find employee's name  who worked maximum hours
 SELECT emp_id,emp_name,salary
 from employees
 where emp_id in (
 SELECT emp_id from employee_projects
 where hours_worked=
 (Select max(hours_worked) from employee_projects));