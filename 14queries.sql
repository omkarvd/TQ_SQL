use studentdb;

#Q1. Show all the student whose course id is either 103,102;
select  name
from student
where courseid=1 or courseid=3;

#Q2. Show student name whose name starts with s
select  * from student 
where name like "s%";

#Q3. Show all the faculty whose email id is not null
select email
from faculty
where email is Not Null;

#Q4. Show the number of student in each course

select  cname,count(*)
from student
group by cname;

#Q5. Show the numbers of courses according to duration
select courseduration,count(*)  as TotalCourses
from course
group by courseduration;

#Q6. Increase the fees of all courses by 10%
select * from faculty;

update course
set fees=fees+(0.1*fees);

#Q7. Increase the salary of faculty by 20% whose experience is greater than 5 years

update faculty
set salary=salary+(0.3*salary)
where exp>5;

#Q8. Delete the course .net
delete from course
where cname=".net";
select * from course;


#Q9. Delete the students who has not paid the fees
delete from student
where feestatus="not paid";
select * from student;

#Q10.Show the faculty in desc order of salary 

select   * from faculty 
order by salary desc;

#Q11. Show the student in asc order of course id and if the course is same then desc order of joining date
select * from student
order by courseid asc ,  joiningDate desc;

#q12. Show the total student in each course in asc order

select cname,count(*) 
from student
group by cname order by cname asc;
select * from student;

#q13. Add the column joining date in faculty
alter table faculty 
add column joiningDate date;

#q14. Change the column to exp of experience
alter table faculty
rename column exp to experience;
select * from faculty;


