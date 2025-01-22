use youtube_question;
create table student (id int,naem varchar(50),age int);
alter table student add column grade varchar(10);/* alter */
alter table student change grade final_grade varchar(20);/*one type*/
alter table student  rename column final_grade to grade;/*second type*/
INSERT INTO student (id, naem, age, final_grade) 
VALUES (101 ,'John Doe', 20, 'A'), 
       (102 ,'Jane Smith', 22, 'B'), 
       (103 ,'Bob Johnson', 19, 'C'), 
       (104 ,'Alice Brown', 21, 'A'), 
       (105 ,'Charlie Davis', 20, 'B'), 
       (106 ,'Emma Wilson', 23, 'A'), 
       (107 ,'Michael Lee', 20, 'C'), 
       (108 ,'Olivia Moore', 19, 'B'), 
       (109 ,'William Turner', 21, 'A'), 
       (110 ,'Sophia Rodriguez', 22, 'C');
select * from student;
update student set age=21 where id=101; /* update */
delete from student where id=101;
select * from student where age>=19;
select * from student where naem="William Turner" or naem="Alice Brown";
select * from student where naem in("William Turner","Alice Brown");
select * from student where final_grade in( 'A' ,'B') and age >= 20;
select * from student where age>18 and age<20;
select * from student where age <18;/* no records */
select * from student where final_grade >'b';
select count(*) from student ;
select avg(age) from student;
select sum(age)from student where final_grade='A' or 'B';
select count(*),final_grade from student group by final_grade order by final_grade asc; 
select avg(age),final_grade from student group by final_grade;
insert into student values (111,"John",23,'c');
select count(*),final_grade from student group by final_grade order by final_grade desc limit 1;
select avg(age),final_grade from student group by final_grade having avg(age)>21;
select count(*),final_grade from student group by final_grade having count(*)>3;
select avg(age),final_grade from student group by final_grade having avg(age) between 21 and 25 and final_grade >'B';
select * from student where final_grade='A' or 'B' order by age desc; 
select * from student order by final_grade asc;
 
 
