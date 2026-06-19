USE window_practice;
-- Q1. Assign Row Number to Employees by Salary
select *,
ROW_NUMBER() over(ORDER BY salary desc) as rn
from employees;

-- Q2. Rank Employees by Salary
select *,
ROW_NUMBER() over(ORDER BY salary desc) as rn,
rank() over(order by salary desc) as rk,
DENSE_RANK() over(ORDER BY salary desc) as d_rnk
from employees;
-- num--rn--rk--drk
-- 100--1--1--1
-- 100--2--1--1
-- 100--3--1--1
-- 200--4--4--2

-- Q4. Row Number Inside Each Department
select *,
ROW_NUMBER() over(
	PARTITION BY department
ORDER BY salary desc) as rn
from employees;





-- Q5. Top Paid Employee From Every Department
with cte as(
select *,
DENSE_RANK() over(
	PARTITION BY department
ORDER BY salary desc) as rn
from employees)
select * from cte
where rn=1
;




-- Q6. Top 2 Highest Paid Employees Per Department
with cte as(
select *,
DENSE_RANK() over(
	PARTITION BY department
ORDER BY salary desc) as rn
from employees)
select * from cte
where rn<=2
;

-- Q7. Department Average Salary Beside Every Employee
SELECT emp_id,emp_name,department,salary, round(avg(salary) over(
	PARTITION BY department
),2) as dept_avg
from employees;



-- Q8. Difference Between Employee Salary and Department average
select * ,
avg(salary) over(PARTITION BY department) as dept_avg,
salary- avg(salary) over(PARTITION BY department) as diff
from employees;


 SELECT *,salary-dept_avg as diff
 from 
(select * ,
avg(salary) over(PARTITION BY department) as dept_avg
from employees) a;


-- Q9. Running Salary Total

select *,
sum(salary) over(order by emp_id) as running_total
 from employees;






-- Q10. Running Salary Total Department Wise





-- SELECT * from employees;

-- SELECT *,
-- AVG(salary) over(
-- 	PARTITION BY department
-- ) as avg_sal FROM employees;

-- -- funtion_name()
-- -- over(
-- -- 	partition by col_name,
-- --     order by col_name
-- -- )

-- select department,avg(salary)
-- from employees
-- group by department;




