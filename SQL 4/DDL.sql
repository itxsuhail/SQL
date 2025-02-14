--DDL 

--- cASE INSENSITVIE


-- Create 
create database test2

--USE
-- Before you perform any operations inside a DB( Data Base ) We first need to use it 


use test2


--DROP
--Completely remove an object(Database, Table, Column, views...etc) from your server 

drop database test2

---Creating a Table

create database DDL
use DDL 

DROP TABLE CUSTOMER


-- Commenting will prevent those lines of code from being executed 


-- Single line comment


/* This 
is
your 

multiline comment 


*/ 



Create table customer
(
customerid int,
CustomerNumber int,
lastname varchar(50),
firstname varchar(50),
areacode smallint,
adress varchar(max),
phonenumber varchar(50)
)

select * from customer


---insert 

insert into customer(customerid,CustomerNumber,firstname,phonenumber)
values (455512,98744,'Rajeev','78551452')

insert into customer(customerid,CustomerNumber,firstname,phonenumber)
values (455512,98744,'Rajeev','78551452'),(78552,86552,'Payal','788545622')
-

insert into  customer
values(52221,545412,'Kumar','Kishan',712,'5th street etc...' , '785545211')

--999 rows can be added at max from a single insert statement 


select * from customer


----
update customer
set 
firstname = 'Amit', lastname = 'Pahuja'
where customerid = 78552


-----SQL SERVER you cannot rename columns directly with the alter command but with other rdbms systems you can



---ALTER

alter table customer 
add Gender char(1)

alter table customer
drop column gender

alter table customer
alter column phonenumber bigint




---

select * from customer


--CONSTRAINT 

--We can set conditions for the value to entered into our column 
--SAME AS DATA Validation for Excel 


--NOT NULL
--This constraint is going to prevent a 
--NULL Value from being entered in your column 

-- NUll Value == Missing value == NA



drop table customer

Create table customer
(
customerid int,
CustomerNumber int,
lastname varchar(50),
firstname varchar(50) not null,
areacode smallint,
adress varchar(max),
phonenumber varchar(50)
)
insert into  customer(customerid,lastname)
values(52221,'Kumar')

select * from customer



--UNIQUE
--It will make sure that there are no Duplicate values in your column

drop table customer

Create table customer
(
customerid int,
CustomerNumber int,
lastname varchar(50),
firstname varchar(50) not null,
areacode smallint,
adress varchar(max),
phonenumber varchar(50) unique 
)

select * from customer

insert into  customer(customerid,lastname,firstname,phonenumber)
values(52221,'Kumar','Rajiv',7888542211)


insert into  customer(customerid,lastname,firstname,phonenumber)
values(52221,'Kumar','Payal',89965223)

insert into  customer(customerid,lastname,firstname,phonenumber)
values(52221,'Mehta','Rajiv',7888542211)



---Primary Key 
---

drop table customer

Create table customer
(
customerid int primary key,
CustomerNumber int,
lastname varchar(50),
firstname varchar(50) not null,
areacode smallint,
adress varchar(max),
phonenumber varchar(50) unique
)

select * from customer

insert into  customer(customerid,lastname,firstname,phonenumber)
values(52221,'Kumar','Rajiv',7888542211)


insert into  customer(customerid,lastname,firstname,phonenumber)
values(85555,'Singh','Amerender',7855555)

insert into  customer(lastname,firstname,phonenumber)
values('Mehta','Kishan',7888542211)

--- Combition of NOT NULL and UNIQUE 


--Foriegn Key

--It will check if the foreign key column holds values from your connecting primary key


create table orders 
(
orderid bigint,
custid int foreign key references  customer(customerid),
amount bigint ,
Product_name varchar(max)

)
select * from customer
select * from orders

insert into orders(orderid,custid , amount) 
values(7855542,52221,45000)

insert into orders(orderid,custid , amount) 
values(87878,78885,45340)


---CHECK 
--- You can provide an expressions that evaluetes to True/False. And the value will only be accepted if the it is True


drop table orders



create table orders 
(
orderid bigint,
custid int ,
amount bigint check(amount >= 0) ,
Product_name varchar(max)

)

select * from orders

insert into orders(orderid,custid , amount) 
values(7855542,52221,45000)

---
insert into orders(orderid,custid , amount) 
values(7855542,52221,-100)


---DEFAULT 
--- It will assign a predefined value instead OF NULL when the value has not been provided


drop table orders



create table orders 
(
orderid bigint,
custid int ,
amount bigint check(amount >= 0) ,
Product_name varchar(max) default('Electronics')
)

select * from orders


insert into orders(orderid,custid , amount,Product_name) 
values(7855542,52221,45000, 'Furniture' )



insert into orders(orderid,custid , amount) 
values(7855542,52221,45000)

---IDENTITY 
--- It will automatically set a unique value for the column based on a range with START and STEP


drop table orders

---



create table orders 
(
orderid bigint identity(50,5),
custid int ,
amount bigint check(amount >= 0) ,
Product_name varchar(max) default('Electronics')


)



insert into orders(custid , amount,Product_name)
values(87888,45000,'Furniture')

select * from orders


--------------
drop table customer

Create table customer
(
customerid int,
CustomerNumber int,
lastname varchar(50),
firstname varchar(50) not null,
areacode smallint,
adress varchar(max),
phonenumber varchar(50) unique
)

select * from customer
alter table customer
add constraint pk_demo primary key (firstname)

alter table customer
drop constraint pk_main



---- Truncate 
--- It will delete all the data/records/rows from your table 

--Drop : Deletes the data as well the structure of the table
--Truncate : will only delete the records


select * from orders


truncate table orders