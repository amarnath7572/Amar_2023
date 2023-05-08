# VIEWS
use demo;

create view google_info as
select * from company where name = 'google' ;

select * from google_info;

# Using View get the list of companies whose emmployee count is greater than the average count

create view Avg_comp as
select name, sum(employees) from company group by name having sum(employees) > (select avg(employees) from company);

select * from avg_comp;

# STRING FUNCTIONS 
# Concat - join two columns name, branch

select concat(name,branch) as concatenated_column from company;

# SUB STRING
select substr(name,7) from company where name = 'QAClickAcademy';
# Prints substring from the nth letter mentioned in the function

select substr(name,2,5) from company where name = 'QAClickAcademy';
#Starting and ending index

# REPLACE - you can replace a string with some other text
select replace(name,'Aca','d') from company where name = 'QAClickAcademy';

# LENGTH - length of string in column
select length(name) from company;

# TRIM - white spaces will be removed
select trim('  king  ');

select * from company;

# LIMIT , top3 in microsoft SQL server
select name from company limit 3;