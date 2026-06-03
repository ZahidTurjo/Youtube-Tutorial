USE company_db;

-- Q1. Find employees earning above company average salary
with avg_salary as (
	select avg(salary) as avg_sal from employees
) 
select emp_id,emp_name,salary from employees
where salary>
(select avg_sal from avg_salary);





-- Q2. Find department-wise average salary with dept name
with dept_avg_sal as(
select department_id,avg(salary) as dept_avg_sal from employees
group by department_id)
SELECT d.department_id,d.department_name,da.dept_avg_sal
 from departments d
join dept_avg_sal da
ON d.department_id=da.department_id
 ;

-- Q3. Find employees earning more than their department average

with cte as (
select department_id,avg(salary) as dept_avg
from employees
group by 1)
SELECT e.emp_id,e.emp_name,e.salary,
c.dept_avg
 from employees e
join cte c
on c.department_id=e.department_id
where e.salary>c.dept_avg;



-- Q4. Find total salary spent by each department
with total_dept_sal as (
SELECT 
    department_id, SUM(salary) AS total_sal
FROM
    employees
GROUP BY department_id)
SELECT 
    d.department_id, d.department_name, td.total_sal
FROM
    departments d
        JOIN
    total_dept_sal td ON d.department_id = td.department_id
;




-- Q5.Find employees who worked on more than 1lak budget in project 
with cte as(
	SELECT project_id,project_name,budget
    from projects where budget>100000)
SELECT distinct (e.emp_id)
,e.emp_name,c.project_id,
c.project_name,c.budget
 from employee_projects ep
join cte c
on ep.project_id=c.project_id
join employees e
on e.emp_id=ep.emp_id;





-- Q6.Find employees who worked on highest budget project 

with cte as(
	SELECT project_id,project_name,budget
    from projects where budget=
    (select max(budget) from projects)
    )
SELECT distinct (e.emp_id)
,e.emp_name,c.project_id,
c.project_name,c.budget
 from employee_projects ep
join cte c
on ep.project_id=c.project_id
join employees e
on e.emp_id=ep.emp_id;





-- Q7. Find project-wise total hours worked
with thw as (
select project_id,sum(hours_worked) total_hrs_worked
from employee_projects
GROUP BY 1
)
SELECT p.project_name,
p.project_id, th.total_hrs_worked
from projects p
join thw th
on th.project_id=p.project_id;




