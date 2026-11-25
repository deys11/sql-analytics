-- First retrieve the two employee tables from day1 and day2. Those two are being used for joins
-- Retrieve the employee_id, first_name, and occupation for every employee in employee_salary, along with their age and gender from employee_demographics (showing NULL if they have no demographic record).

Select 
s.employee_id, s.first_name, s.occupation, d.age, d.gender
from employee_salary as s
left join employee_demographics as d
on s.employee_id = d.employee_id;

-- Find the employee_id, first_name, and occupation of every employee in employee_salary who has no matching record in employee_demographics.

Select s.employee_id, s.first_name, s.occupation
from employee_salary as s
left join employee_demographics as d
on s.employee_id = d.employee_id
where d.employee_id is null;


-- Salary Audit by Gender (INNER JOIN + GROUP BY) - Find the average salary and headcount for each gender, considering only employees who exist in both employee_demographics and employee_salary.

SELECT 
    d.gender, 
    AVG(s.salary) AS avg_salary, 
    COUNT(s.employee_id) AS headcount
FROM employee_salary AS s
INNER JOIN employee_demographics AS d
    ON s.employee_id = d.employee_id
GROUP BY d.gender;


-- Missing Demographics Check (LEFT ANTI JOIN): Identify the employee_id, first_name, last_name, and salary of any employee on the payroll (employee_salary) who is missing from employee_demographics (like Tom Haverford).

SELECT 
    s.employee_id, 
    s.first_name, 
    s.last_name, 
    s.salary
FROM employee_salary AS s
LEFT JOIN employee_demographics AS d
    ON s.employee_id = d.employee_id
WHERE d.employee_id IS NULL;

-- Young High-Earners (INNER JOIN + WHERE): Retrieve the first_name, last_name, age, occupation, and salary of all employees under 35 years old who earn more than 10,000, sorted by salary from highest to lowest.

Select d.first_name, d.last_name, d.age, s.occupation, s.salary
from employee_salary as s
inner join employee_demographics as d
on s.employee_id = d.employee_id
where d.age< 35 and s.salary> 10000
order by s.salary desc;
