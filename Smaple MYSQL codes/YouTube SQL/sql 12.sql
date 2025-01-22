use youtube;
create table emp(emp_id int auto_increment primary key,
emp_name varchar(40),
age int,
depart varchar(40),
salary int,hire_date DATE);
INSERT INTO emp (emp_name, age, depart, salary, hire_date)
VALUES
('John Doe', 25, 'HR', 35000, '2020-01-15'),
('Jane Smith', 30, 'Finance', 45000, '2019-03-22'),
('Michael Johnson', 28, 'Marketing', 40000, '2021-06-30'),
('Emily Davis', 32, 'IT', 50000, '2018-11-10'),
('William Brown', 35, 'Sales', 37000, '2020-04-12'),
('Sophia Taylor', 29, 'HR', 38000, '2020-08-20'),
('James Anderson', 40, 'Finance', 55000, '2017-09-17'),
('Isabella Wilson', 24, 'Marketing', 36000, '2021-12-05'),
('Mason Thomas', 38, 'IT', 60000, '2019-05-30'),
('Olivia White', 27, 'Sales', 41000, '2020-02-27'),
('Ethan Harris', 26, 'HR', 39000, '2020-10-14'),
('Ava Martin', 33, 'Finance', 47000, '2018-07-23'),
('Liam Thompson', 31, 'Marketing', 43000, '2021-03-01'),
('Charlotte Garcia', 36, 'IT', 52000, '2018-09-05'),
('Lucas Lee', 39, 'Sales', 48000, '2019-12-10'),
('Mia Walker', 23, 'HR', 34000, '2021-01-19'),
('Benjamin Hall', 37, 'Finance', 56000, '2016-04-21'),
('Amelia Young', 34, 'Marketing', 44000, '2019-11-11'),
('Elijah King', 41, 'IT', 61000, '2017-06-08'),
('Harper Scott', 22, 'Sales', 35000, '2021-08-09');

select * from emp;
INSERT INTO emp (emp_name, age, depart, salary, hire_date)
VALUES ('Murali Lion', 26, 'Sales', 60000, '2024-09-24');

select sum(salary) as total_sal,depart from emp 
group by depart having total_sal >180000;

select count(*)as tot_count ,
avg(salary)as avg_sal,depart from emp 
group by depart having avg_sal>160000 or tot_count<5; 

select max(salary) as max_sal ,depart from emp 
group by depart having max_sal >60000; 

select sum(salary)as tot_sal ,age from emp group by age having tot_sal >58000;

select count(emp_name) as count,depart from emp group by depart having count >4;  
 
select avg(age) as avg_age,count(*) as count_emp,depart from emp  group by depart having avg_age > 30 and count_emp >=4;

select sum(salary) sum_sal,hire_date,depart,emp_name from emp group by hire_date ,depart,emp_name having sum_sal >55000;

select sum(salary) tot_sal,depart from emp group by depart order by tot_sal desc limit 1;
