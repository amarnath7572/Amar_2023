# Practice exercises - 2
 
 create table exam_results (student_id int(10), first_name varchar(10), last_name varchar(10), exam_id int(10), exam_score int(10));
 describe exam_results;
 select* from exam_results;
 insert into exam_results values (10,'LAURA','LYNCH',1,90);
 insert into exam_results values (10,'LAURA','LYNCH',2,85);
 insert into exam_results values (11,'GRACE','BROWN',1,78);
 insert into exam_results values (11,'GRACE','BROWN',2,72);
 insert into exam_results values (12,'JAY','JACKSON',1,95);
 insert into exam_results values (12,'JAY','JACKSON',2,92);
 insert into exam_results values (13,'WILLIAM','BISHOP',1,70);
 insert into exam_results values (13,'WILLIAM','BISHOP',2,100);
 insert into exam_results values (14,'CHARLES','PRADA',2,85);
 
 SELECT COUNT(DISTINCT STUDENT_ID) FROM EXAM_RESULTS;
 
 select avg(exam_score), exam_id from exam_results group by exam_id;
 
 select count(distinct student_id), exam_id from exam_results group by exam_id;
 
 select * from exam_results where last_name like 'L%';

SELECT MAX(EXAM_SCORE) FROM EXAM_RESULTS WHERE EXAM_ID = 1 AND FIRST_NAME LIKE '%E%';

select * from exam_results where first_name like '%A' or last_name like '%A';

select first_name,last_name, exam_score from exam_results where exam_id = 2 and exam_score>90;

SELECT FIRST_NAME, LAST_NAME, SUM(EXAM_SCORE) FROM EXAM_RESULTS GROUP BY FIRST_NAME, LAST_NAME HAVING SUM(EXAM_SCORE) > 180;

SELECT * FROM EXAM_RESULTS WHERE LAST_NAME LIKE '%N%' AND EXAM_SCORE > 88;

SELECT * FROM EXAM_RESULTS WHERE STUDENT_ID <= 12 AND EXAM_SCORE > 85;
