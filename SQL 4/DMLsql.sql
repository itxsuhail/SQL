--DML ( Data Manipulation Language)
-- Acessing and manipulating the data 

--SELECT WILL always give the output as a table 



select FirstName,LastName
from Customer


select CompanyName,City
from Supplier

select *
from Supplier

select * from customer

select * from OrderItem

select * from Product

select * from [Order]

select * from [Supplier]



--ORDER Is a key word /clause in SQL ,
--- by providing the text in [SQUARE BRACKETS ] 
---we are specifying that it is a object (in this scenario its a table)


---Whatever columns i want i can specify it in the select clause giving commas and we will get it from the respective table 
-- * = All the columns



--ALIAS 

-- it is an alternative name to your object ( table , column etc ) . 
--WHich is valid only for that query

-- Sometimes we have same column names , we can use alias to differntiate them 
-- Usefull when we are refrencing it later on in the query 

--WILL NOT MODIFY COLUMN NAME IN ORIGINAL TABLE



select FirstName, LastName,Phone as [Contact Number]
from Customer


select FirstName, LastName,Phone as [Contact Number]
from Customer [c]

select FirstName, LastName,Phone [Contact Number]
from Customer [c]


----
--- BEFORE any column name if we mention distinct , we will only get unique values 


select distinct FirstName from Customer



---WHERE 
--- WE can filter the data using the where clause

--- SQL FUNCTIONS( Very very similar) and Operators are the same as Excel 
-- AND , OR , NOT Clause 
-- != is another way to represent not equals operator 




select * 
from Customer 
where country = 'germany'

----------------

select * from Customer
where city  = 'Berlin'


-----

select * from Customer
where Country = 'Germany' or Country = 'UK'


select * from Customer
where Country = 'Germany' or Country = 'UK' or Country = 'France' or Country = 'USA'

--IN OPERATOR 

select * from Customer
where Country in ('Germany','UK','France','USA')

--Not 


select * from Customer
where Country not in ('Germany','UK','France','USA')

--

select * from Customer
where Country != 'UK'

---Get all the orders between 1500 to 1800 

select * from [order]
where TotalAmount > 1500 and TotalAmount <1800

--BETWEEN


select * from [order]
where TotalAmount between 1500 and 1800

--LIKE ( It will for a pattern ) 

---I want all the customers that first name starts with Ma


select * from Customer
where FirstName like 'Ma%'

---I want all the customers that first name starts with M, and have exactly 3 letters after M

select * from Customer
where FirstName like 'M___'

-----I want all the customers that first name starts with M, the third letter is R  

select * from Customer
where FirstName like 'M_r%'


--- I want all the customers that first name starts with either M or P 

select * from Customer
where FirstName like 'M%' or FirstName like 'P%'

---

select * from Customer
where FirstName like '[MP]%'

---GIve me the details of all the customers whose name doesnt start from M or P

select * from Customer
where not FirstName like '[MP]%'

----
select * from Customer
where FirstName like '[^MP]%'

---DELETE
-- It will delete rows from your table 
--- We can specify the WHERE clause 




select * into copy_of_cust from Customer 

select * from copy_of_cust

delete from copy_of_cust
where Country = 'Brazil'

select * from copy_of_cust


