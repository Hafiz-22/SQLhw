--HOMEWORK 2--

---BASIC-LEVEL---

--1) Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)),
--	 and Salary (DECIMAL(10,2))
Create table Employees (EmpID int, Name varchar(50),
Salary DECIMAL(10, 2))

--2) Insert three records into the Employees table using different 
--	 INSERT INTO approaches (single-row insert and multiple-row insert).
Insert into Employees values (1, 'Azimjon', 5000)
Insert into Employees
select 2, 'Nursulton', 1700
union
select 3, 'Aziza', 1600

--3) Update the Salary of an employee where EmpID = 1
Update Employees
set Salary = 3000
where EmpID = 1

--4) Delete a record from the Employees table where EmpID = 2
delete from Employees
where EmpID = 2

select * from Employees
--5) Demonstrate the difference between DELETE, TRUNCATE, and DROP commands
--	 on a test table.

Create table TestTable (ID int, Name varchar(50))
insert into TestTable values (1, 'Asim'), (2,'Nozima'),(3,'Malika')
--DELETE (Removes a row/rows, but keeps the table structure)
Delete from TestTable where ID = 2
--TRUNCATE (Removes all rows, but keeps the table structure)
Truncate table TestTable
--DROP (Removes the table (both data and structure) from the database)
Drop table TestTable

--6) Modify the Name column in the Employees table to VARCHAR(100)
Alter table Employees
Alter column Name varchar(100)

--7) Add a new column Department (VARCHAR(50)) to the Employees table.
Alter table Employees
Add Department varchar(50)

--8) Change the data type of the Salary column to FLOAT
Alter table Employees
Alter column Salary FLOAT

--9) Create another table Departments with columns DepartmentID 
--	 (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
Create table Departments 
(DepartmentID INT PRIMARY KEY,DepartmentName VARCHAR(50))

--10) Remove all records from the Employees table 
--	  without deleting its structure.
Truncate table Employees

---INTERMEDIATE-LEVEL---
SELECT * FROM Employees
--11) Insert five records into the Departments table using 
--	  INSERT INTO SELECT from an existing table.
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT DISTINCT EmpID, Name 
FROM Employees
WHERE EmpID <= 5

--12) Update the Department of all employees where Salary > 5000 
--	  to 'Management'.
UPDATE Employees
set Department = 'Management'
where Salary > 5000

--13) Write a query that removes all employees
--	  but keeps the table structure intact.
Truncate table Employees

--14) Drop the Department column from the Employees table.
Alter table Employees
Drop column Department

--15) Rename the Employees table to StaffMembers using SQL commands.
EXEC sp_rename 'Employees', 'StaffMembers'

--16) Write a query to completely remove the Departments table
--	  from the database.
Drop table Departments

---ADVANCED-LEVEL---

--17) Create a table named Products with at least 5 columns, including: 
--	  ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), 
--	  Price (DECIMAL)
Create table Products (
    ProductID INT Primary Key, 
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Country VARCHAR(50))

--18) Add a CHECK constraint to ensure Price is always greater than 0.
Alter table Products
ADD CONSTRAINT if_positive CHECK (Price > 0)

--19) Modify the table to add a StockQuantity column
--	  with a DEFAULT value of 50
Alter table Products
ADD StockQuantity INT DEFAULT 50

--20) Rename Category to ProductCategory
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN'

--21) Insert 5 records into the Products table 
--	  using standard INSERT INTO queries.
INSERT INTO Products VALUES 
(1, 'Laptop', 'Electronics', 900, 'Uzbekistan', 50),
(2, 'Smartphone', 'Electronics', 500,'Turkey', 50),
(3, 'Desk Chair', 'Furniture', 150, 'Russia', 50),
(4, 'Office Desk', 'Furniture', 300, 'Uzbekistan', 50),
(5, 'Headphones', 'Electronics', 90, 'Russia', 50)
 select * from Products

--22) Use SELECT INTO to create a backup table
 --	   called Products_Backup containing all Products data.
SELECT * INTO Products_Backup
FROM Products;

--23) Rename the Products table to Inventory
EXEC sp_rename 'Products', 'Inventory'

--24) Alter the Inventory table to change the data type of Price
--	  from DECIMAL(10,2) to FLOAT
Alter table Inventory
Alter column Price FLOAT
--Msg 5074, Level 16, State 1, Line 135
--The object 'if_positive' is dependent on column 'Price'.
--Msg 4922, Level 16, State 9, Line 135
--ALTER TABLE ALTER COLUMN Price failed because one or more objects access this column.

--25) Add an IDENTITY column named ProductCode that starts from 1000
--	  and increments by 5
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5)

