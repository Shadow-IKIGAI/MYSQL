use youtube_question;
create table cust(cus_id int primary key,
cus_name varchar(30),email varchar(50));

create table order_li(or_id int primary key,or_prod varchar(40),
or_price int,cus_id int,foreign key (cus_id) references cust(cus_id)); 

INSERT INTO cust (cus_id,cus_name, email) 
VALUES 
(1,'John Doe', 'john.doe@example.com'),
(2,'Jane Smith', 'jane.smith@example.com'),
(3,'Alice Johnson', 'alice.johnson@example.com'),
(4,'Bob Brown', 'bob.brown@example.com'),
(5,'Charlie Davis', 'charlie.davis@example.com'),
(6,'Diana Evans', 'diana.evans@example.com'),
(7,'Ethan Harris', 'ethan.harris@example.com'),
(8,'Fiona Clark', 'fiona.clark@example.com'),
(20,'George Wright', 'george.wright@example.com'),
(21,'Hannah Baker', 'hannah.baker@example.com'),
(22,'Ivy Moore', 'ivy.moore@example.com'),
(23,'Jack Wilson', 'jack.wilson@example.com'),
(24,'Kara Scott', 'kara.scott@example.com'),
(25,'Liam Hall', 'liam.hall@example.com'),
(26,'Mia Green', 'mia.green@example.com'),
(27,'Noah King', 'noah.king@example.com');

INSERT INTO order_li (or_id, or_prod, or_price, cus_id) 
VALUES 
(101, 'Laptop', 1000, 1),
(203, 'Smartphone', 700, 2),
(305, 'Tablet', 450, 3),
(407, 'Headphones', 150, 4),
(509, 'Monitor', 300, 5),
(611, 'Keyboard', 100, 6),
(713, 'Mouse', 50, 7),
(815, 'Smartwatch', 200, 8);

select * from cust;
select * from order_li;

select c.cus_id,c.cus_name,r.or_id,r.or_prod,r.or_price from order_li r
right join cust c on r.cus_id=c.cus_id order by cus_id;

SELECT c.cus_id, c.cus_name, r.or_prod
FROM cust c
LEFT JOIN order_li r ON c.cus_id = r.cus_id
WHERE r.or_id IS NULL;
