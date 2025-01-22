use ckey;
create table sales(pro_id int unique,pro_name varchar(40),
quan_sold int,
sale_date date);
INSERT INTO sales (pro_id,pro_name, quan_sold, sale_date) 
VALUES 
(233,"Computer" ,15, '2024-04-24'),  
(998, "Aripod",4, '2024-07-26'),    
(211, "iphone",3, '2024-08-12'),      
(322, "chager",1, '2022-09-19'),    
(765, "Mobile",12, '2024-05-31'),   
(007, "ps 5",20, '2021-02-22'),     
(108, "Game",16, '2023-01-17');   
select * from sales;
select sum(quan_sold) as sold from sales where quan_sold >10 and year(sale_date)=2024;
select sum(quan_sold) as sold from sales where quan_sold < 5 or year(sale_date)=2024;
select sum(quan_sold) as sold from sales where not year(sale_date)=2024;