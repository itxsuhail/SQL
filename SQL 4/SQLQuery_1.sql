Select * from sys.tables
Use AdventureWorks2017
SELECT * FROM HumanResources.Employee
USE DBATEST
DROP DATABASE DBATEST
Drop DATABASE Test
Drop DATABASE msdb
USE AdventureWorks201
CREATE Database PractiseCSV
SELECT * FROM sys.tables
SELECT * FROM ALLSKUProductTypeCategory

SELECT *, SUM(Pack_Ltrs) as Sump 
GROUP BY Sump
---DDL_---
CREATE DATABASE Test2
---Use Datbase---
/*


*/
Use Test2

DROP Database Test2
----Create Table ---
Create DATABASE Test1
Use Test1
 Create Table Test1(
CustomerId varchar(Max),
Amount_Spent NUMERIC
 )
DROP    TABLE Test1
 SELECT * from Test1

DROP DATABASE Test1
---This Code is for AILAB DATABASE

Create DATABASE AILAB
 USE AILAB
---Create Table inside the AILAB database

CREATE TABLE Customer(
    CustomerId INT,
    CustomerNumber INT,
    LastName VARCHAR(Max),
    FirstName VARCHAR(50),
    AreaCode SMALLINT,
    PhoneNumber VARCHAR(50),
)
INSERT INTO Customer(CustomerId,CustomerNumber,FirstName,PhoneNumber) VALUES (12345,123589,'Suhail','9622880407'),(1345,1589,'Hassan','9622880409')

Select * FROM Customer
 
 INSERT INTO Customer
VALUES (1000,1235789,'Hassan','Zubida',91,'9622880408'),(1002,21589,'Auqibssan','Hassan',91,'9622880409')
---Update---
UPDATE Customer 
SET 
FirstName='Soaheel',LastName='Hassan',AreaCode='01'
WHERE CustomerId=12345

---Alter---
alter TABLE customer
add Gender CHAR(1)
 insert into Customer(Gender) values('M') WHERE CustomerId=12345
 DROP COLUMN Gender;

DROP COLUMN Gender


ALTER TABLE Customer 
ALTER COLUMN PhoneNumber bigint

----Constraints-------
/* Restrictions, set Conditions for the values to enter into our column, data validation for excel */
---Not Null-- this is going to prevent the null value being enter in SQL Server---
----Null Value is simply value is not entered

Drop table Customer
SELECT * FROM Customer
 CREATE TABLE Customer(
    CustomerId INT,
    CustomerNumber INT,
    LastName VARCHAR(Max),
    FirstName VARCHAR(50) Not Null,
    AreaCode SMALLINT,
    PhoneNumber VARCHAR(50),
)
INSERT INTO Customer(CustomerId,LastName,FirstName)
VALUES (1000,'Hassan','ABCD'),(1002,21589,'Auqibssan','Hassan',91,'9622880409')


----Unique--
------It will make sure there are no duplicate values in our column 
DROP TABLE Customer
CREATE TABLE Customer(
    CustomerId INT,
    CustomerNumber INT,
    LastName VARCHAR(Max),
    FirstName VARCHAR(50) Not Null,
    AreaCode SMALLINT,
    PhoneNumber VARCHAR(50) Unique,
)
INSERT INTO Customer(CustomerId,LastName,FirstName,PhoneNumber)
VALUES (1001,'Auqib','DEF','123456') 

SELECT * FROM Customer

----Primary Key----
---identify the different records over table
---Combination of Not Null and Unique

DROP TABLE Customer

CREATE TABLE Customer(
    CustomerId INT PRIMARY KEY,
    CustomerNumber INT,
    LastName VARCHAR(Max),
    FirstName VARCHAR(50) Not Null,
    AreaCode SMALLINT,
    PhoneNumber VARCHAR(50) Unique,
)


INSERT INTO Customer(CustomerId,LastName,FirstName,PhoneNumber)
VALUES (1002,'Suhail','DEF','12345')
INSERT INTO Customer
VALUES (1003,12121,'Suhail','DEF',1,'123456789')

---Foriegn Key--
---How we relate to another table 

Create table Orders(
    OderId Bigint,
    Custid INT   FOREIGN KEY REFERENCES Customer(CustomerId),
    Amount Bigint,
    Product_Name VARCHAR(Max)
)
SELECT * from Customer;
SELECT * from Orders;
 INSERT into Orders(OderId,Custid,Amount)
VALUES(98989,7654,324567)

----Check----
---You can provide an expression that evaluates to True/False and the value will onlybe accepted if the it is true
DROP TABLE Orders; 

Create table Orders(
    OderId Bigint,
    Custid INT,
    Amount Bigint CHECK(amount >=0),
    Product_Name VARCHAR(Max)
)

INSERT into Orders(OderId,Custid,Amount)
VALUES(98989,7654,-12367)



---Default---
---It will assign a predifned instead of Null when the value has not been provided
DROP Table Orders
Create table Orders(
    OderId Bigint,
    Custid INT,
    Amount Bigint CHECK(amount >=0),
    Product_Name VARCHAR(Max) DEFAULT('Electronics')
)
INSERT into Orders(OderId,Custid,Amount)
VALUES(98989,7654,324567)

SELECT * from Orders

----Identity---
--It will automatically set value for the column based on a range with start and stop

DROP Table Orders
Create table Orders(
    OderId Bigint IDENTITY(1,5),
    Custid INT,
    Amount Bigint CHECK(amount >=0),
    Product_Name VARCHAR(Max) DEFAULT('Electronics')
)

INSERT into Orders(Custid,Amount)
VALUES(7654,324567)
SELECT * from Orders

DROP Table Orders
Create table Orders(
    OderId Bigint IDENTITY(101,1) PRIMARY Key,
    Custid INT FOREIGN KEY REFERENCES Customer(CustomerId),
    Amount Bigint CHECK(amount >=0),
    Product_Name VARCHAR(Max) DEFAULT('Electronics')
)

INSERT into Orders(Custid,Amount)
VALUES(1003,324567)
SELECT * from Orders

SELECT * from Customer
-----------------------
Create table Orders(
    OderId Bigint IDENTITY(101,1),
    Custid INT,
    Amount Bigint CHECK(amount >=0),
    Product_Name VARCHAR(Max) DEFAULT('Electronics'),

    
)

Create DATABASE NorthwindDB;
DROP DATABASE NorthwindDB----- Deletes a database table
Use NorthwindDB
DROP TABLE OrderDetails;

Create TABLE OrderDetails(
    orderID INT,
    ItemName VARCHAR(500),
    OrderDate Date,
    OrderTimr  TIME,
    Shipment_Status text,
    OrderAvailabilty BINARY,
    [Priority] int DEFAULT 2
);
Select * from OrderDetails;
Insert into OrderDetails (orderID,ItemName,OrderDate,OrderTimr,Shipment_Status,OrderAvailabilty) VALUES 
(124,'PoloTshirt','2020-01-31','11:25','Dispatched',1);

Insert into OrderDetails VALUES 
(125,'oloTshirt','2020-01-31','11:25','Dispatched',1,3);

Create TABLE OrderDetails2(
    orderID INT,
    ItemName VARCHAR(500),
    OrderDate Date,
    OrderTimr  TIME,
    Shipment_Status text,
    OrderAvailabilty BINARY,
    [Priority] int DEFAULT 2
);
Select * FROM OrderDetails

Insert into OrderDetails VALUES 
(125,'oloTshirt','2020-01-31','11:25','Dispatched',1,3),
(124,'PoloTshirt','2020-01-31','11:25','Dispatched',1,2),
(121,'PoloTshirt','2020-01-31','11:25','Dispatched',1,2);

INSERT into OrderDetails2 (orderID,ItemName,OrderDate,OrderTimr,Shipment_Status,OrderAvailabilty)
SELECT orderID,
ItemName,OrderDate,OrderTimr,Shipment_Status,OrderAvailabilty 
from OrderDetails;
------Modify ---
---Update-----
------------Single Update
UPDATE OrderDetails 
set Shipment_Status = 'Hold'
WHERE orderID = 125;


Select * FROM OrderDetails


UPDATE OrderDetails 
set Shipment_Status = 'On-Hold', ItemName = 'Bag'
WHERE orderID = 125;
--------Alter Table------
ALTER TABLE orderDetails
ADD SellerName VARCHAR(200)

CREATE TABLE Orders(orderId int NOT Null,
OrderName VARCHAR(500))
INSERT into
Alter TABLE orderDetails
Drop COLUMN SellerName;

Alter  TABLE OrderDetails 
ALTER COLUMN SellerName VARCHAR(500) -----Altering CColumn


Select * FROM OrderDetails_new

EXEC sp_rename 'OrderDetails.SellerName','SellerInfo','Column'

Alter table  OrderDetails --------add two column
Add CustomerName Varchar(200),
CustomerNumber text;


Alter table OrderDetails
ADD SellerName VARCHAR(200);

EXEC sp_rename 'OrderDetails2' , 'OrderDetails_new'
----primary key and foriegn key------


Create TABLE roles(
    role_id INT identity PRIMARY Key,
    role_name VARCHAR(50)
)

SELECT * from roles
Insert INTO roles VALUES('SUHAIL')

DROP TABLE roles

Create TABLE users(
    UserId INT identity PRIMARY Key,
    UserName VARCHAR(50),
    [PASSWORD] VARCHAR(255),
    Email VARCHAR(255)
)
Create TABLE roles(
    role_id INT identity,
    role_name VARCHAR(50),
    PRIMARY KEY(role_id)
)

CREATE TABLE pkname(id int,title varchar(50));

Alter table pkname
ADD PRIMARY key(id)


Alter table pkname
ALTER COLUMN id int NOT NULL;

-------Foreign Key----

Create table categories(
    cat_id INT IDENTITY PRIMARY KEY,
    Cat_Name VARCHAR(100) NOT NULL
)

 Create Table products(
      productId INT IDENTITY PRIMARY Key,
      ProductName VARCHAR(100) NOT NULL,
      cat_id INT,
      CONSTRAINT Fk_Cat FOREIGN KEY(cat_id)
      REFERENCES categories(cat_id)
 )

 Create Table products_copy(
      productId INT IDENTITY PRIMARY Key,
      ProductName VARCHAR(100) NOT NULL,
      cat_id INT FOREIGN KEY REFERENCES categories(cat_id)
 
 )


SELECT * FROM categories;
SELECT * FROM products;
------Key Enforcement-----------


INSERT into categories values ('Furniture'),
 ('Chairs')
INSERT into products(ProductName,cat_id) values ('Accecories',6),
 ('Box',2),('Bat',3);


INSERT into products(ProductName) values ('Accecories')

ALTER TABLE products
DROP ROW productId = 5;

ALTER table products_copy 
Drop CONSTRAINT FOREIGN key;

DROP table products_copy;
DROP TABLE categories

TRUNCATE TABLE products 
SELECT top 5 from categories
