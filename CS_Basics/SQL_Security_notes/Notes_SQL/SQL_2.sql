use qadbt;
select * from Employeeinfo;

insert into Employeeinfo values ('ram',2,'newyork',22, 'male');
insert into Employeeinfo values ('tam',3,'florida',23, 'male');
insert into Employeeinfo values ('nam',4,'charlotte',24, 'male');
insert into Employeeinfo values ('lam',5,'texas',25, 'male');

# To get unique names from table
select distinct name from Employeeinfo;

# Get the employee names present in newyork
select name from Employeeinfo where location = 'newyork';

#get the Employee names present in newyork and age should be more than 20
select name from Employeeinfo where location = 'newyork' and age>20;

# Get the employee names who are present in florida where age is less than 23 or location is from charlotte
select name from Employeeinfo where (location = 'florida' and age<23) or (location = 'charlotte');

# Get the employee names whose id is either 2 or 4
select name from Employeeinfo where (id=2 or id =4);

# IN operator: Get Employee names whose age is in between 23 and 25
select distinct name from Employeeinfo where age in (23,24,25);

# BETWEEN Operator: Get Employee names whose age is between 21 and 99
select name from Employeeinfo where age between 21 and 99;

# Get Employee names whose age is less than 25
# age < 25
# in (1,2..25)
# between 0 and 25

# NOT 
select name from Employeeinfo where age not between 21 and 99;

# Regular expressions
# % - any character, any number of characters
# _ - single character
# whenever you use regular expressions use like operator

# Print the names with 3 letters where 1st letter should be t
select name from Employeeinfo where name = 't__';

use world;
select * from city;

select name, CountryCode from city where CountryCode like 'A%';
select name, CountryCode from city where name like '__T%';

#SORT
use qadbt;
select * from Employeeinfo order by name;
select * from Employeeinfo order by id desc;

use Business;
# Get Total sum of amount generated for each month
# Aggregate functions and group by clause
select * from transactions ;
select sum(Amount), Month from transactions group by Month;

# Get the maximum or minimum or average amount/transaction happened in every month
select Max(Amount), Month from transactions; # It will give max amount in the entire table
select Max(Amount), Month from transactions group by Month;
select Min(Amount), Month from transactions group by Month;
select Min(Amount), branch from transactions group by Branch;
select Sum(Amount), branch from transactions group by Branch;
select avg(Amount), Month from transactions group by Month;

# No of transactions occured each month
select count(*) from transactions;
select count(*), month from transactions group by month;

# Get the transactions which occurred less than twice for any month - April has only one transaction
# To apply condition on the results of the count, we need to use having keyword, Where is used on tables, having is used on the results
select count(*), month from transactions group by month having count(*) < 2;

#Get the total amount for only two branches - Bangalore and Chicago for a month
Select sum(amount), month from transactions where branch='chicago' or branch = 'bangalore'group by month;
# Get the total amounts for only two branches - Bangalore and Chicago for a month where total amount is greater than 20000
Select sum(amount), month from transactions where branch='chicago' or branch = 'bangalore'group by month having sum(amount) > 20000;

#get the month which has total sale amount less than 1000 when I combine both sydney and paris branches 
Select sum(Amount),month from transactions where branch = 'sydney' or branch = 'paris' group by month having sum(amount) < 1000;

# Branch having more than 4000 amount in feb
select branch,Amount,month from transactions where month = 'feb' having amount > 4000;