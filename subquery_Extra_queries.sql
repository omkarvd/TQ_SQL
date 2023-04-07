use testcoursedb;


#Write a query to find the names (first_name, last_name), the salary of the employees whose salary is equal to the minimum salary for their job grade
select first_name, last_name, salary 
from employees 
where employees.salary = (select min_salary
                                      from jobs
where employees.job_id = jobs.job_id);

#Write a query to find the names (first_name, last_name), the salary of the employees who earn more than the average salary and who works in any of the IT departments

select first_name, last_name, salary 
from employees 
where department_id in
(select department_id from departments where department_name like 'IT%') 
and salary > (select avg(salary) from employees);
