use youtube_question;
create table stud (stud_id int primary key,stud_name varchar(50),class varchar(50));

create table grades(subject varchar(50),marks varchar(10),
stud_id int,foreign key(stud_id)references stud(stud_id));

INSERT INTO stud (stud_id, stud_name, class) VALUES
(1, 'John Doe', 'Std 10th'),
(2, 'Jane Smith', 'Std 9th'),
(3, 'Sam Brown', 'Std 10th'),
(4, 'Lisa White', 'Std 8th'),
(5, 'Mike Green', 'Std 9th'),
(6, 'Emily Clark', 'Std 10th'),
(7, 'Robert Black', 'Std 8th'),
(8, 'Sophia Harris', 'Std 10th'),
(9, 'James Martin', 'Std 9th'),
(10, 'Olivia Lee', 'Std 8th'),
(11, 'David Walker', 'Std 11th'),
(12, 'Daniel Moore', 'Std 10th'),
(13, 'Sarah Wilson', 'Std 9th'),
(14, 'Thomas Taylor', 'Std 10th'),
(15, 'Mary Johnson', 'Std 11th'),
(16, 'Linda Davis', 'Std 12th'),
(17, 'Karen Young', 'Std 10th'),
(18, 'Michael Turner', 'Std 12th'),
(19, 'Christopher White', 'Std 11th'),
(20, 'Emma King', 'Std 9th');

INSERT INTO grades (subject, marks, stud_id) VALUES
-- Michael Turner (highest marks)
('Math', 98, 18),
('Science', 96, 18),
('English', 99, 18),

-- Lisa White (lowest marks)
('Math', 35, 4),
('Science', 30, 4),
('English', 28, 4),

-- Other students (mixed marks)
('Math', 82, 1),
('Science', 85, 1),
('Math', 45, 2), -- Just passed
('English', 49, 2), -- Just passed
('Math', 78, 3), -- Above average
('History', 80, 3),
('Science', 47, 5), -- Just passed
('Math', 90, 5), -- Good
('Math', 83, 6),
('English', 88, 6),
('Science', 89, 7),
('Math', 81, 7),
('English', 92, 8),
('Math', 87, 8),
('Math', 77, 9), -- Slightly below 80
('Science', 79, 9),
('History', 81, 10),
('Math', 76, 10), -- Slightly below 80
('Math', 95, 11), -- High scorer
('Science', 90, 11), 
('Math', 85, 12), -- Strong scorer
('English', 88, 12),
('Math', 58, 13), -- Moderate
('History', 62, 13), 
('Science', 80, 14),
('Math', 78, 14),
('Math', 87, 15), 
('English', 88, 15),
('Science', 77, 16), 
('Math', 83, 16),
('History', 50, 17), -- Just above pass
('Science', 49, 17), -- Just pass
('Math', 89, 19),
('English', 92, 19),
('Math', 77, 20), 
('Science', 75, 20);

select * from grades;
select * from stud;

select s.stud_id,s.stud_name,avg(g.marks) as avg_grade,s.class from stud s
inner join grades g on s.stud_id=g.stud_id 
group by s.class,s.stud_id,s.stud_name;


SELECT s.class, s.student_id, s.avg_marks
FROM (
    SELECT stud.class, stud.student_id, AVG(grade.marks) AS avg_marks
    FROM grades grade
    INNER JOIN students stud ON grade.student_id = stud.student_id
    GROUP BY stud.class, stud.student_id
) AS s
WHERE (
    SELECT COUNT(*)
    FROM (
        SELECT AVG(g.marks) AS avg_marks
        FROM grades g
        INNER JOIN students st ON g.student_id = st.student_id
        WHERE st.class = s.class
        GROUP BY st.student_id
    ) AS class_avg
    WHERE class_avg.avg_marks > s.avg_marks
) < 2
ORDER BY s.class, s.avg_marks DESC;

