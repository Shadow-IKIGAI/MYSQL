use youtube;
CREATE TABLE havin (
empID INT,
Fname VARCHAR(50),
Lname VARCHAR(50),
depart VARCHAR(50),
salary INT);
INSERT INTO havin (empID, Fname, Lname, depart, salary)
VALUES
(1, 'John', 'Doe', 'HR', 55000),
(2, 'Jane', 'Smith', 'IT', 60000),
(3, 'Bob', 'Johnson', 'IT', 62000),
(4, 'Alice', 'Williams', 'HR', 54000),
(5, 'Eva', 'Davis', 'Finance', 59000),
(6, 'Mike', 'Brown', 'Finance', 65000),
(7, 'Mai', 'Elven', 'Finance', 57000);
select count(*)as count,avg(salary) as avg_sal,depart 
from havin group by depart 
having avg(salary)>55000 or count(*)>2; 
