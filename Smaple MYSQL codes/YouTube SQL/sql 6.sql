use youtube;
CREATE TABLE Employee (
empID INT,
Fname VARCHAR(50),
Lname VARCHAR(50),
depart VARCHAR(50),
salary INT);
INSERT INTO Employee (empID, Fname, Lname, depart, salary)
VALUES
(1, 'John', 'Doe', 'HR', 55000),
(2, 'Jane', 'Smith', 'IT', 60000),
(3, 'Bob', 'Johnson', 'IT', 62000),
(4, 'Alice', 'Williams', 'HR', 54000),
(5, 'Eva', 'Davis', 'Finance', 58000),
(6, 'Mike', 'Brown', 'Finance', 59000);
select * from Employee order by Lname asc;
select * from Employee where depart='IT' order by salary desc;
select count(*)as count,depart from Employee group by depart;
select avg(salary) as avg_sal,depart from Employee group by depart order by depart asc;
select avg(salary)as avg_sal,depart from Employee group by depart order by avg_sal desc ;
