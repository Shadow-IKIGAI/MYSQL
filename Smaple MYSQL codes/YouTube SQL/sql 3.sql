create database ckey; 
use ckey;
create table stud(stud_id int primary key unique,    /*frist table parent 1 with primary key*/
stud_name varchar(100)not null,
class varchar(50)not null);
insert into stud values(101,"Shadow","Magic"),(102,"Lufffy","SEA KING"),(103,"GOJO","Boss");

create table college (co_id int primary key,    /*second table parent 2 with primary key*/
co_name varchar(40),
place varchar(200));
insert into college values (233,"V.o.c","Thoothukudi"),(244,"Kamaraja","Thoothukudi"),(167,"srm","chennai");

create table Result(sch_id int primary key unique, /* Thrid table with foreign key so its child table */
sch_name varchar(100)not null,
mark int not null,
stud_id int not null,
foreign key (stud_id) references stud(stud_id),
co_id int,
foreign key(co_id) references college(co_id));
insert into Result values(3456,"Bell",205,101,167),(9076,"Star",405,101,244),(7893,"Vikasia",380,103,233);
select * from Result;
select * from stud;
