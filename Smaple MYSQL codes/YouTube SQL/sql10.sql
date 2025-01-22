use youtube;
create table product(pro_id int unique,
pro_name varchar(50),
region varchar(20),
sale_amount int ,
sold int);
insert into product values (923,"computer","west",20000,18),
(115,"Moblie","east",40000,9),(999,"PS 5","east",30000,20),
(876,"Appple","west",50000,12),(082,"Apple","east",60000,7),
(007,"computer","east",70000,8),(564,"Mobile","west",15000,5),
(333,"PS 5","west",55000,10);
select* from product;

select avg(sale_amount)as avg_sale,
sum(sale_amount)as sum,
max(sale_amount)as max,pro_name  
from product where region='east' and sale_amount >40000  
group by pro_name;

select sum(sale_amount) as total,avg(sale_amount)as avg_sale,pro_name from product
group by pro_name having total>avg_sale;

select pro_name,sum(sale_amount) as total_amt,sum(sold)as sold from product 
group by pro_name 
having sold>10 and total_amt>50000;

select sum(sale_amount)as sum,pro_name from product 
where sold>10  group by pro_name having sum(sale_amount)>=50000;

select * from product where sold >10 and sale_amount>=50000;