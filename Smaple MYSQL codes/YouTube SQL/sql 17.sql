use youtube;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    class INT
);
CREATE TABLE grades (
    grade_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO students (student_id, student_name, class) VALUES
(1, 'Alice', 5),
(2, 'Bob', 5),
(3, 'Charlie', 5),
(4, 'David', 6),
(5, 'Eva', 6),
(6, 'Frank', 6),
(7, 'Grace', 7
);
INSERT INTO grades (grade_id, student_id, subject, marks) VALUES
(1, 1, 'Math', 95),   -- Alice, Class 5
(2, 1, 'Science', 85),
(3, 1, 'English', 78),
(4, 2, 'Math', 42),   -- Bob, Class 5
(5, 2, 'Science', 39), -- Bob failed Science
(6, 2, 'English', 35), -- Bob failed English
(7, 3, 'Math', 88),   -- Charlie, Class 5
(8, 3, 'Science', 92),
(9, 3, 'English', 91),
(10, 4, 'Math', 58),  -- David, Class 6
(11, 4, 'Science', 63),
(12, 5, 'Math', 37),  -- Eva, Class 6 failed Math
(13, 5, 'Science', 55),
(14, 6, 'Math', 41),  -- Frank, Class 6
(15, 6, 'Science', 43),
(16, 7, 'Math', 67),  -- Grace, Class 7
(17, 7, 'Science', 78),
(18, 7, 'English', 85
);

select stud.student_name,stud.class,count(grade.subject)as grade_sub from students stud
inner join grades grade on stud.student_id=grade.student_id
group by stud.class,stud.student_id having grade_sub >2;

select stud.class,stud.student_name,max(grade.marks)as sum_mark from students stud 
inner join grades grade on stud.student_id=grade.student_id
group by stud.class,stud.student_name order by sum_mark desc;

select stud.student_name,stud.class, -- with mark coulmn the count will one 
count(grade.subject)as fail_stud from students stud-- without the mark column in group by we get count
inner join grades grade on stud.student_id=grade.student_id 
where grade.marks<40
group by stud.class,stud.student_name;

select stud.class,grade.subject,avg(grade.marks) as avg_mark
from students as stud inner join grades grade  on -- with stud name it will nto correct
stud.student_id=grade.student_id-- because stud name must in group by so we cant get the avg mark :) 
group by grade.subject,stud.class;

select  distinct stud.student_name,stud.class,count(grade.subject) as grade_sub
from students stud
inner join grades grade on stud.student_id=grade.student_id
where grade.marks > 40
group by stud.class,stud.student_name having  grade_sub >2;

select  distinct stud.student_name,stud.class,count(grade.subject) as grade_sub
from students stud
inner join grades grade on stud.student_id=grade.student_id
group by stud.class,stud.student_name having  grade_sub =3;

select stud.class,avg(grade.marks) as avg_mark from grades grade 
inner join students stud on grade.student_id=stud.student_id
 group by stud.class,stud.student_id,(select 