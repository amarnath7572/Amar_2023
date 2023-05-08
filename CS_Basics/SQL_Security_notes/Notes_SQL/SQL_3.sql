# Sub_Queries - Gettiing info from two tables, can also do using Joins

# what is the age of a person who's located in texas

select name, age from citizens where name = (select name from citizenloc where location = 'texas');

# What is the experience of the people located in chicago
select name, exp from citizens where name = (select name from citizenloc where location = 'chicago');

# go for equal to if query is returning only single value or else go for IN operator
select name,age from citizens where name in (select name from citizenloc where location = 'california');

create database demo;
use demo;
create table citizens(name varchar(20), age int(5), exp int(3));
create table citizenloc(name varchar(20), Location varchar(20));
create table company(name varchar(20), Branch varchar(20), employees int(10));
create table Established(name varchar(20), Year int(10));
create table student(name varchar(20), id int(10), age int(10), gender varchar(20), location varchar(20));
create table grades(grade varchar(20), id int(10));

insert into student values('sai', 1, 12, 'female', 'spain');
insert into student values('baba', 2, 15, 'male', 'newyork');
insert into student values('sai', 3, 15, 'male', 'spain');
insert into student values('sai', 4, 15, 'female', 'newyork');
insert into student values('sai', 5, 12, 'male', 'nigeria');
insert into student values('sai', 6, 12, 'male', 'spain');

update student set name = 'mathru' where id = 6;

select * from student;
select * from grades;

insert into grades values('A', 2);
insert into grades values('B', 3);
insert into grades values('A', 4);
insert into grades values('C', 5);
insert into grades values('B', 7);

insert into citizens values('rahul', 34, 6);
insert into citizens values('subash', 34, 6);
insert into citizens values('george', 41, 10);
insert into citizens values('flex', 23, 15);
insert into citizens values('husain', 10, 0);
insert into citizens values('steve', 24, 7);

select * from citizens;

insert into citizenloc values('rahul', 'california');
insert into citizenloc values('george', 'california');
insert into citizenloc values('flex', 'texas');
insert into citizenloc values('steve', 'california');
insert into citizenloc values('husain', 'chicago');
insert into citizenloc values('subash', 'florida');

select * from citizenloc;

insert into company values ('QAClickAcademy', 'US', 20);
insert into company values ('Google', 'US', 500);
insert into company values ('Yahoo', 'Canada', 250);
insert into company values ('Google', 'India', 400);
insert into company values ('QAClickAcademy', 'India', 75);
insert into company values ('QAClickAcademy', 'UK', 10);
insert into company values ('QAClickAcademy', 'Canada', 30);
insert into company values ('Yahoo', 'US', 200);
insert into company values ('Yahoo', 'India', 150);
insert into company values ('Facebook', 'US', 50);

select * from company;

insert into Established values ('QAClickAcademy', 2010);
insert into Established values ('Google', 1990);
insert into Established values ('Yahoo', 1992);
insert into Established values ('Facebook', 2010);

select * from Established;

# JOINs - performance is better than sub queries
select c.name, cl.location, c.age from citizens as c join citizenloc as cl on c.name = cl.name;
# get the details of the person located in california
select c.name, cl.location, c.age from citizens as c join citizenloc as cl on c.name = cl.name where cl.location='california';

# need total employees count of a company which is established in a year 1990
# using subqueries:
select * from company where name = (select name from Established where Year = 1990);
select name, sum(employees) from company where name = (select name from Established where Year = 1990) group by name;
# using joins
select c.name, e.year from company as c join established as e on c.name = e.name where e.year = '1990';
# Complete Query
select c.name, e.year, sum(c.employees) from company as c join established as e on c.name = e.name group by c.name having e.year=1990;
# Established after 1990
select c.name, e.year, sum(c.employees) from company as c join established as e on c.name = e.name group by c.name having e.year>1990;
# minimum number of employees in a branch for all companies established after 1990
select c.name, min(c.employees) from company as c join established as e on c.name = e.name group by c.name ;

# INNER JOIN
select * from student;
select * from grades;

select * from student s inner join grades g on s.id=g.id;

# LEFT JOIN
select * from student s left join grades g on s.id=g.id;

# RIGHT JOIN
select * from student s right join grades g on s.id=g.id;

# Conditions on inner join
select * from student s inner join grades g on s.id=g.id where s.gender = 'female';
# condition on right join
select * from student s right join grades g on s.id=g.id where s.age > 12;