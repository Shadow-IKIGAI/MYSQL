use youtube;
create table student(
student_name varchar(200),
mark int,
department varchar(200));
insert into student values ("Barath", 67, "CSE");
insert into student values("Venkat", 89, "ECE");
insert into student values ("Praveen", 23, "MECH");
insert into student values ("Abdul", 63, "CSE");
insert into student values ("Kadhir", 88, "CSE");
insert into student values("John", 81, "MECH");
insert into student values("Manoj", 91, "CSE");
insert into student values("Mani", 50, "ECE");
 
 select * from student order by  student_name desc;
 select max(mark) as max,department from student group by department;