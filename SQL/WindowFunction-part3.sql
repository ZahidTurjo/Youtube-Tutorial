USE window_practice;
-- q1.Previous Employee Salary(lag) 
SELECT emp_name,salary,
lag(salary) over(order by salary desc) as prev_salary
from employees;

-- q2.Salary Difference From Previous Salary
SELECT emp_name,salary,
lag(salary) over(order by salary desc) as prev_salary,
salary-lag(salary) over(order by salary desc) as diff_sal
from employees;

with cte as (
SELECT emp_name,salary,
lag(salary) over(order by salary desc) as prev_salary
from employees
)
SELECT *,
salary-prev_salary as diff_sal
 from cte;

--  q3.Previous Employee in Same Department
select emp_name,department,salary,hire_date,
lag(emp_name) over(PARTITION BY department order by hire_date) as prev_emp
from employees;

-- q.4 Next Employee Salary(LEAD)
select emp_name,salary,department,
lead(salary) over(ORDER BY salary desc) as next_emp_Salary
from employees;

-- q.5 Salary Difference With Next Employee
select emp_name,salary,department,
lead(salary) over(ORDER BY salary desc) as next_emp_Salary,
salary-lead(salary) over(ORDER BY salary desc) as diff_salary
from employees;
 
 -- task q3.next Employee in Same Department
 
-- q6. Divide Employees Into 4 Salary Buckets
SELECT * ,
NTILE(4) over(order by salary) as qr
from employees;

 -- q.7 Top 25% Highest Earners
with cte as(
SELECT * ,
NTILE(4) over(order by salary) as qr
from employees)

select * from cte
where qr=4;


-- q.8 Highest Salary in Every Department
 select *,
 FIRST_VALUE(salary) over(PARTITION BY department order by salary desc) as high_sal
 from employees;
 
select *,
 max(salary) over(PARTITION BY department order by salary desc) as high_sal_use_max
 from employees;
 
-- q.9 Lowest Salary in Every Department
-- rows between current row and unbounded preceding
 select *,
 LAST_VALUE(salary) over(PARTITION BY department order by salary desc
 rows BETWEEN CURRENT ROW and UNBOUNDED FOLLOWING
 ) as high_sal
 from employees;
