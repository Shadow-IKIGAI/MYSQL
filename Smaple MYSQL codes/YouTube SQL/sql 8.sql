use youtube;
CREATE TABLE Employee1 (
empID INT,
Fname VARCHAR(50),
Lname VARCHAR(50),
depart VARCHAR(50),
salary INT);
INSERT INTO Employee1 (empID, Fname, Lname, depart, salary)
VALUES
(1, 'John', 'Doe', 'HR', 55000),
(2, 'Jane', 'Smith', 'IT', 60000),
(3, 'Bob', 'Johnson', 'IT', 62000),
(4, 'Alice', 'Williams', 'HR', 54000),
(5, 'Eva', 'Davis', 'Finance', 58000),
(6, 'Mike', 'Brown', 'Finance', 59000);
select * from Employee1;
select avg(salary) from Employee1 group by salary<60000;