# UNION

create table college(id int(10), name varchar(20));

insert into college values(53, 'tim');
insert into college values(643, 'ben');
insert into college values(223, 'tam');
insert into college values(574, 'sam');
insert into college values(422, 'ram');
insert into college values(983, 'joe');
insert into college values(5399, 'ten');
insert into college values(5399, 'ten');
insert into college values(574, Null);
insert into college values(5399, 'ten');


select * from college;

create table results(id int(10), name varchar(20));

insert into results values(9893, 'tina');
insert into results values(53, 'tim');
insert into results values(24, 'Harsh');
insert into results values(223, 'tam');
insert into results values(575459, 'sam');
insert into results values(887, 'jack');
insert into results values(5444, 'ten');
insert into results values(98003, 'joepp');

select * from results;
# UNION - removes duplicates
select * from college union (select * from results);
# To have duplicates also
select * from college union all (select * from results);

# INTERSECT - common records present in both tables
# intersect keyword is in oracle
select * from college where id in (select id from results);

# EXISTS - if an id belongs to a table then retrieve all details or else dont retrieve

select * from college where exists (select * from college where name = 'ram');
select * from college where exists (select * from college where name = 'ewe');

create table marks(score int(10), name varchar(20));

insert into marks values(45, 'tina');
insert into marks values(23, 'tim');
insert into marks values(64, 'harsh');
insert into marks values(65, 'tam');
insert into marks values(98, 'sam');
insert into marks values(34, 'jack');

select * from marks;

# CASE - manipulate the content of your table on runtime and give new table on fly

select score, case name 
when 'tim' then score*2 
when 'sam' then score-25
when 'tina' then score*3 
else score
end
'NewScore', name from marks;