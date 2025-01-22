use youtube;
create table customer(cs_id int,
cs_name varchar(30),
cs_address varchar(50),
cs_city varchar(20),
cs_state varchar(30),
zipcode int);
insert into customer values(1,"John doe","392 Sunset Divd","New York","NT",10059,"555-123-4569");
insert into customer values(2,"Marry Smith","6900 Main st","San francisco","CA",94032,"555-987-6543");
insert into customer values(3,"Richard Nevman","2040 River side rd","San Diego","CA",92010,"555-555-5555");
insert into customer values(4,"CAthy Coak","4010 SpeedDways","Tucose","AZ",85316,'555-321-4566');
insert into customer values(1,"John doe","392 Sunset Divd","Chicago","CA",10059,'555-111-2222');
insert into customer values(1,"John doe","392 Sunset Divd","L:os Angel","LA",10059,'555-444-777');
alter table customer change cs_address address varchar(50);
alter table customer add column moblie_no varchar(10);
alter table customer change moblie_no moblie_no varchar(100);
delete from customer where moblie_no is null;
update customer set moblie_no='822206-1234' where cs_name='Marry Smith'; 
delete from customer where zipcode='92010';
select * from customer;
select * from customer where cs_state='CA';
update customer set cs_id=6 where cs_state='LA';
select * from customer where cs_id >5;
alter table customer drop column moblie_no;
truncate customer;