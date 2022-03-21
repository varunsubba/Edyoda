create database  if not exists edyoda;
use edyoda;

create table if not exists  salesPeople(
snum int primary key auto_increment,
sname varchar(15),
city varchar(15),
comm int
);

insert into salesPeople values (1001 ,"Peel" ,"London" ,12),

(1002 , "Serres" ,"Sanjose" ,13),

(1004 ,"Motika", "London" ,11),

(1007 ,"Rifkin", "Barcelona" ,15),

(1003 ,"Axelrod" ,"Newyork", 10);

create table if not exists  customers(
cnum int primary key auto_increment ,
cname varchar(15) not null ,
city varchar(15) not null ,
snum int,
foreign key(snum) references salesPeople(snum)
);

insert into customers values (2001 , "Hoffman" ,"London", 1001),

(2002 , "Giovanni", "Rome", 1003),

(2003 , "Liu" ,"Sanjose" ,1002),

(2004  ,"Grass" ,"Berlin" ,1002),

(2006 ,"Clemens" ,"London" ,1001),

(2008 ,"Cisneros" ,"Sanjose" ,1007),

(2007 ,"Pereira" ,"Rome", 1004);


create table if not exists orders (
onum int primary key auto_increment ,
amt decimal(8,2),
odate date,
cnum int,
snum int,
foreign key(cnum) references customers(cnum),
foreign key(snum) references salesPeople(snum)
);

insert into orders values (3001 ,18.69 ,"1990-10-03",2008, 1007),

(3003, 767.19 ,"1990-10-03" ,2001 ,1001),

(3002, 1900.10 ,"1990-10-03" ,2007 ,1004),

(3005 , 5160.45 ,"1990-10-03", 2003 ,1002),

(3006 , 1098.16 ,"1990-10-03", 2008 ,1007),

(3009 ,1713.23, "1990-10-04" ,2002, 1003),

(3007 , 75.75, "1990-10-04", 2004, 1002),

(3008 , 4273.00, "1990-10-05", 2006, 1001),

(3010 , 1309.95 ,"1990-10-06", 2004 ,1002),

(3011 , 9891.88 ,"1990-10-06", 2006 ,1001);

select * from orders;
select * from salesPeople;
select * from customers;


-- Here the Questions started :
-- 1) Count the number of Salesperson whose name begin with ‘a’/’A’.
-- 2) Display all the Salesperson whose all orders worth is more than Rs. 2000.
-- 3) Count the number of Salesperson belonging to Newyork.
-- 4) Display the number of Salespeople belonging to London and belonging to Paris.
-- 5) Display the number of orders taken by each Salesperson and their date of orders.


-- 1 ans:
select count(snum) as A_salesperson
from salesPeople
where sname like 'a%' or "A%";

-- 2 ans:
select orders.snum,salesPeople.sname, orders.amt 
from (orders
inner join salesPeople on orders.snum = salesPeople.snum) where(amt>2000) ;

-- 3 ans:
select sname,count(sname) as count_salesperson from salesPeople where city="Newyork" ;

-- 4 ans:
select city, count(sname) as count_belonging from salesPeople where city="London" or "Paris"; 

-- 5 ans:
select salesPeople.sname,orders.odate,count(*)
from (salesPeople
inner join orders on salesPeople.snum = orders.snum) group by salesPeople.sname ,orders.odate ;
