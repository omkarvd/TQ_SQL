create database bikeshowroomdb;
use bikeshowroomdb;
create table model(model_id int primary key,model_name varchar(30),cost float);

create table customer(cust_id int primary key ,first_name varchar(30),last_name varchar(30) ,mobile_no bigint,gender varchar(20));

create table purchase(purchase_id int primary key ,
cust_id int ,foreign key (cust_id) references customer(cust_id),
model_id int,foreign key(model_id) references model(model_id),
booking_amount float,
payment_id int,foreign key(payment_id) references payment_mode(payment_id),
purchase_date date ,
rating_id int,foreign key(rating_id) references feedback_rating(rating_id) );

create table payment_mode(	payment_id int primary key,payment_type int);

create table feedback_rating	(rating_id int primary key,rating int);

insert into model values (1,"Yamaha MT15 ",210000.0),(2,"Royal Enfield  Bullet ",250000.0),(3,"Hero Splendor Plus ",120000.0);
insert into customer values(1,"Omkar","Dhamane",9527741470,"Male"),(2,"Suyog","Zanjad",9868668870,"Male"),(3,"Vivek","Dange",9868868688,"Male");
insert into payment_mode values(1,11),(2,22),(3,33);
insert into feedback_rating values(1,5),(2,4),(3,3);
insert into purchase values(1,1,1,20000.0,1,"2023-04-01",1),(2,2,2,30000.0,2,"2022-05-01",2),(3,3,3,23000.0,3,"2024-01-01",3);

#	Add the column of email in customer
alter table customer add column(email varchar(25));
select * from customer;

#Show the number of bikes sold of a particular model
select model_name,count(*) as NumberofBikes
from model
group by model_name;

#Show the total cost of each model name
select model_name,sum(cost ) as Total_cost
from model
group by model_name;

#	Increase the cost of each bike by 10%
update model set cost= cost +(0.1*cost);
select * from model;

#	Show the purchases whose booking amount is greater than 20,000
select purchase_id from purchase where booking_amount > 20000;

#.	Show the customer whose mobile no is not given
select  * from customer where mobile_no is null;

#	Show the average cost of all the model name
select model_name ,avg(cost) as average_cost from model group by model_name;











