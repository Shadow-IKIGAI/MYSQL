use ckey;
CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    manager_id INT
);
INSERT INTO employee (id, first_name, last_name, salary, manager_id)
VALUES
(1, 'John', 'Doe', 5000, 3),
(2, 'Jane', 'Smith', 7000, 3),
(3, 'Michael', 'Brown', 10000, NULL),
(4, 'Emily', 'Davis', 3000, 3),
(5, 'David', 'Wilson', 15000, NULL);

CREATE TABLE salgrade (
    grade INT,
    lower_limit DECIMAL(10, 2),
    upper_limit DECIMAL(10, 2)
);
INSERT INTO salgrade (grade, lower_limit, upper_limit)
VALUES
(1, 1000, 4000),
(2, 4001, 8000),
(3, 8001, 12000),
(4, 12001, 16000);

CREATE TABLE benefits (
    salary_req DECIMAL(10, 2),
    benefit_name VARCHAR(100)
);
INSERT INTO benefits (salary_req, benefit_name)
VALUES
(3000, 'Health Insurance'),
(5000, 'Paid Leave'),
(10000, 'Retirement Plan'),
(15000, 'Company Car');

SELECT b.benefit_name, COUNT(e.id) AS employee_count
FROM employee e
JOIN benefits b
ON e.salary >= b.salary_req
GROUP BY b.benefit_name
HAVING COUNT(e.id) >0;

SELECT e.first_name, e.last_name, e.salary, s.grade
FROM employee e
JOIN salgrade s
ON e.salary BETWEEN s.lower_limit AND s.upper_limit;

