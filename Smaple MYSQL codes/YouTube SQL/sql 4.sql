use ckey;
create table coll_stud(co_id int primary key,co_name varchar(30));
insert into coll_stud values(103,"Kris"),(104,"Manoj"),(105,"Murali");

/*create table dep_coll(dept_id int primary key,dept_name varchar(30),co_id int,foreign key(co_id) references coll_stud(co_id));
insert into dep_coll values (233,"Sci",103),(344,"Bio",105),(567,"Chem",104);
select * from dep_coll;*/

alter table coll_stud add column mark int;
update coll_stud set mark=89 where co_id=103;
update coll_stud set mark=91 where co_id=104;
update coll_stud set mark=46 where co_id=105;
select * from coll_stud where not co_id=104 or mark=89;
select count(mark) from coll_stud where co_id=103;
