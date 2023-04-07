use bikeshowroomdb;
create table cust_copy(select * from customer);

create table feedback_copy(select * from feedback_rating);
create table model_copy(select * from model);
create table payment_mode_copy(select * from payment_mode);
create table purchase_copy(select * from purchase);


# join queries

