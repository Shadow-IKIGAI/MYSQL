
USE repeate;

-- Step 3: Create the students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    grade VARCHAR(10)
);

-- Step 4: Insert some data into the table
INSERT INTO students (first_name, last_name, age, grade)
VALUES ('John', 'Doe', 15, '10'), 
       ('Jane', 'Smith', 16, '11');
-- Retrieve all data from the students table
SELECT * FROM students;

alter table students add email varchar(50); 

update students set email="jondoe21@gmail.com"
where first_name="john";

update students set email="jaindoe31@gmail.com"
where first_name="jane";
select *from students;

select * from students where grade=10;

update students set age=16 where first_name="john";

alter table students add phone_number varchar(15);
select * from students;

insert into students(first_name,last_name,age,grade,email)
value("Sam","Wilson",14,9,"sam.wilson@example.com");

delete from students where first_name="jane";

-- joins anf the forgein keys

create table classes (
class_id int primary key auto_increment,
class_name varchar(20),
teacher_name varchar(30)
);
insert into classes (class_name,teacher_name)
values("Math","Mrs.Robinson"),("Sciencs","Mr.Clark");

alter table students add class_id int;
select * from students;

alter table students 
add constraint fk_class foreign key(class_id) references classes(class_id); 

update students set class_id=(select class_id from classes where class_name="Math")
where first_name="John";
update students set class_id=(select class_id from classes where class_name="Sciencs")
where first_name="Sam";
select * from students;

SELECT students.first_name, students.last_name, classes.class_name, classes.teacher_name
FROM students
INNER JOIN classes ON students.class_id = classes.class_id;

SELECT students.first_name, students.last_name, classes.class_name, classes.teacher_name
FROM students
left JOIN classes ON students.class_id = classes.class_id;

select students.first_name,students.last_name,
( select count(*) as total_students from students s where s.class_id=students.class_id)
as calss_count from students;

CREATE INDEX idx_last_name ON students(last_name);

-- Add Alex Cooper to Math class
INSERT INTO students (first_name, last_name, age, grade, email, class_id)
VALUES ('Alex', 'Cooper', 15, '10', 'alex.cooper@example.com', 
        (SELECT class_id FROM classes WHERE class_name = 'Math'));

-- Add Emily Davis to Science class
INSERT INTO students (first_name, last_name, age, grade, email, class_id)
VALUES ('Emily', 'Davis', 14, '9', 'emily.davis@example.com', 
        (SELECT class_id FROM classes WHERE class_name = 'Sciencs'));

SELECT students.first_name, students.last_name, 
    (SELECT COUNT(*) FROM students s WHERE s.class_id = students.class_id) AS class_size
FROM students;

select students.first_name,students.last_name,students.age,
(select * from students s where s.age<10)as Youngest_stud from students;

select concat(students.first_name,students.age)as name_and_age from students;
select concat("Baka"," ","Oni/chan") Bro; 