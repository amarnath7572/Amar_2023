# CONSTRAINTS

# NOT NULL
use qadbt;
create table constab(flightname varchar(20), flightid integer not null );
describe constab;

insert into constab values ('abcd', null);

# DEFAULT constraint - when value is not provided while creating the database, a default value is put into the column if this constraint is given

create table constab2(name varchar(20), age integer default 25);
describe constab2;

insert into constab2 (name) values  ('abcd');
# Writing the column name before values makes the mapping easy while inserting the data in the table

select * from constab2;

# UNIQUE constraint

create table constab3(name varchar(20), id integer unique);
describe constab3;

insert into constab3 (name,id) values ('jack', 21);

select * from constab3;

insert into constab3 values ('ram', 22);

# PRIMARY KEY constraint
# to uniquely identify a row of a table, a column would be the primary key for the table

create table emp(emp_id int(10), name varchar(20), branch varchar(20), primary key(emp_id));
describe emp;
# shouldnt allow null primary key
insert into emp values(null, 'jack', 'delhi');
# shouldnt allow duplicate primary keys
insert into emp values (1, 'ram', 'hyd');

select * from emp;

# FOREIGN KEY
# A column that references to a column (mostly primary key) of another table
# Purpose of foreign key is to maintain referential integrity of the data
# When tried to delete a record in the primary key table, SQL asks you to delete the records with the foreign key table

create table customerdetails(customer_id int(10), address varchar(50), zipcode varchar(10), primary key(customer_id));
describe customerdetails;

create table orderdetails(order_id int(10), customer_id int(10), amount int(10), date varchar(50), primary key(order_id), foreign key(customer_id) references customerdetails(customer_id));
describe orderdetails;

insert into customerdetails values (12345, 'bangalore', '500011');

select * from customerdetails;
select * from orderdetails;

insert into orderdetails values (111, 222, 123, 'Jan'); # will get an error as foreignkey constraint fails
insert into orderdetails values (111, 12345, 123, 'Jan'); # will get inserted as foreignkey is there in the table

delete from customerdetails where customer_id=12345; # cannot delete the record due to foreign key constriant

# if you add another record into customer details where there is no primary key detail in order details

insert into customerdetails values (123456, 'bangalore', '500011');
delete from customerdetails where customer_id=123456;  # will be able to delete this record

# ON DELETE CASCADE- child dependencies will be automatically deleted when tried to delete rows in parent table

create table customerdetails2(customer_id int(10), address varchar(50), zipcode varchar(10), primary key(customer_id)) ;
create table orderdetails2(order_id int(10), customer_id int(10), amount int(10), date varchar(50), primary key(order_id), foreign key(customer_id) references customerdetails2(customer_id) on delete cascade);
insert into customerdetails2 values (123456, 'bangalore', '500011');

select * from customerdetails2;

insert into orderdetails2 values (111, 123456, 123, 'Jan');

select * from orderdetails2;

delete from customerdetails2 where customer_id=123456; 
