use testcoursedb;

#1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

select location_id,street_address,city,state_province,country_name
from locations  natural join countries ;

#2.Write a query to find the names (first_name, last name), department ID and name of all the employees.
select first_name,last_name
from employees e join departments d
on e.department_id=d.department_id;
select  first_name, last_name, department_id
from employees 
join departments using (department_id);



#3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.
select e.first_name,e.last_name ,e.job_id,e.department_id,d.department_name 
from employees e  join departments d join locations l
on e.department_id= d.department_id and  d.location_id=l.location_id  and l.city="london";

#4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).
select  e1.employee_id  'Employee_id',e1.last_name  'Employee',e2.employee_id ,'Manager_id',e2.last_name 'Manager'
from employees e1 join employees e2
on e1.manager_id=e2.employee_id ;

select e.EMPLOYEE_ID, e.LAST_NAME , e.MANAGER_ID as ManagerId, m.LAST_NAME as ManagerName
from employees e join employees m
on e.MANAGER_ID= m.EMPLOYEE_ID;

#5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.

select e1.first_name,e1.last_name,e2.hire_date
from employees e1 join employees e2
on e1.hire_date > e2.hire_date and e2.last_name="jones"; 

select e.FIRST_NAME,e.LAST_NAME, e.HIRE_DATE
from employees e join employees c
on e.HIRE_DATE<c.HIRE_DATE
and  c.LAST_NAME like 'Jones';


#6. Write a query to get the department name and number of employees in the department.

select department_name as 'Department Name', 
COUNT(*) as 'No of Employees' 
FROM departments 
INNER JOIN employees 
ON employees.department_id = departments.department_id 
GROUP BY departments.department_id, department_name 
ORDER BY department_name;

select department_name, count(*) as Total
from employees e join departments d
on e.DEPARTMENT_ID=d.DEPARTMENT_ID
group by e.DEPARTMENT_ID
order by total asc;


#7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
select jh.employee_id,j.job_title,jh.end_date -jh.start_date as 'NumberOfDays'
from job_history jh natural join jobs j 
where jh.department_id=90;

#8. Write a query to display the department ID, department name and manager first name.

select d.department_id,d.department_name,e.first_name
from departments d  join employees e
on (d.manager_id = e.employee_id);

select d.DEPARTMENT_ID,d.DEPARTMENT_NAME,e.FIRST_NAME 
from departments d join employees e
on d.MANAGER_ID= e.EMPLOYEE_ID;


#9. Write a query to display the department name, manager name, and city.
select d.department_name ,e.first_name,l.city
from departments d join employees e 
on d.manager_id=e.employee_id
join locations l using( location_id);

select d.DEPARTMENT_ID,d.DEPARTMENT_NAME,e.FIRST_NAME, l.CITY 
from departments d join employees e join locations l
on d.MANAGER_ID= e.EMPLOYEE_ID and d.LOCATION_ID = l.LOCATION_ID;


#10. Write a query to display the job title and average salary of employees.
select job_title,avg(salary)
from employees  natural join jobs
group by job_title;

#Mam
select job_title, avg(salary) as AverageSal
from employees e join jobs j
on e.JOB_ID= j.JOB_ID
group by j.job_id;

#11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
select e.first_name, j.job_title,salary-min_salary as 'difference'
from employees e natural join jobs j;



#12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary
select jh.*
from job_history jh join employees e
on jh.employee_id=e.employee_id
where salary>10000;

select jh.* , e.SALARY
from job_history jh join employees e
on jh.EMPLOYEE_ID= e.EMPLOYEE_ID
and e.SALARY>10000; 

#13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years

