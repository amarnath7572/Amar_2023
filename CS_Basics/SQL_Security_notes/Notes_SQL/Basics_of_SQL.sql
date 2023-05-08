#Creating Database
create database qadbt;

create database Business;

# point to database with use command
use qadbt;
use Business;

# Create a table called Employee info
create table Employeeinfo(name varchar(20), id int, location varchar(20), age int);

CREATE TABLE Transactions(Month varchar(50),Day int(50),Amount int(50),branch varchar(50));

#insert values into table
insert into Transactions values ('feb',13,124,'bangalore');
insert into Transactions values ('feb',17,20400,'chicago');
insert into Transactions values ('feb',212,320,'sydney');
insert into Transactions values ('mar',22,9600,'bangalore');
insert into Transactions values ('mar',16,5200,'chicago');
insert into Transactions values ('April',12,23,'sydney');
insert into Transactions values ('jan',13,666,'bangalore');
insert into Transactions values ('may',2,3111,'sydney');
insert into Transactions values ('may',1,99999,'paris');
insert into Transactions values ('jan',12,2000,'paris');

select * from transactions;

#to know the outer structure of the table Employee info
describe Employeeinfo;


# inserting records into the table Employee info
# Strings in single quotes
insert into Employeeinfo values ('sam',1,'new jersey',21);
insert into Employeeinfo values ('ram',2,'newyork',22);
insert into Employeeinfo values ('tam',3,'florida',23);
insert into Employeeinfo values ('nam',4,'charlotte',24);
insert into Employeeinfo values ('lam',5,'texas',25);

# to retrieve the data 
# Select column name from Table name
select name,id,location,age from Employeeinfo;
select name,age from Employeeinfo;

Delete from Employeeinfo where id=1;

# check safe mode is enabled
SHOW VARIABLES LIKE "sql_safe_updates";
#disable safe mode 
SET SQL_SAFE_UPDATES = 0;

# Select all data from the table
select * from Employeeinfo; 

# to add a new column
alter table Employeeinfo add gender varchar(10);

# to change the length of the column gender to 20 characters
alter table Employeeinfo modify gender varchar(20);

# to drop a column
alter table Employeeinfo drop gender;

# update column gender for all rows
# update table name set column-name = value where condition
update Employeeinfo set gender ='male';
update Employeeinfo set gender = 'female' where name = 'sam';

update Employeeinfo set gender = 'female' where name = 'ram';
update Employeeinfo set gender = 'male' where name = 'tam';
update Employeeinfo set gender = 'male' where name = 'nam';
update Employeeinfo set gender = 'female' where name = 'lam';

# delete a database completely
drop database qabdt;

