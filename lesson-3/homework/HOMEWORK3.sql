--HOMEWORK 3--

---Easy-Level---

--1. Define and explain the purpose of BULK INSERT in SQL Server.

--BULK INSERT in SQL Server is a command used to efficiently load large 
--volumes of data into a database table from a data file, typically a text 
--file like a CSV or a delimited file.
--Purpose: Efficient Data Loading, Reduce Overhead, 
-- 		   Support for Different Data Formats, Minimize Resource Usage

--2. List four file formats that can be imported into SQL Server.

--Four common file formats that can be imported into SQL Server are:
--a) CSV (Comma-Separated Values)
--b) TXT (Text File)
--c) XML (Extensible Markup Language)
--d) JSON (JavaScript Object Notation)

--3. Create a table Products with columns: ProductID (INT, PRIMARY KEY),
--	 ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
)

--4. Insert three records into the Products table using INSERT INTO.
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Laptop', 800),
(2, 'Smartphone', 600),
(3, 'Headphones', 100)

--5. Explain the difference between NULL and NOT NULL with examples.

--a) NULL represents an unknown or missing value.

CREATE TABLE Employees (EmployeeID INT, EmployeeName VARCHAR(50), DateOfBirth DATE NULL)

-- Insert a record with a NULL value in the DateOfBirth column
INSERT INTO Employees (EmployeeID, EmployeeName, DateOfBirth)
VALUES (1, 'John Doe', NULL)
--In this example:
--The DateOfBirth column is defined as NULL, meaning it can hold missing or unknown data.
--The second record inserts a NULL value for DateOfBirth because the information is unavailable.


--b) NOT NULL ensures that the column must always have a valid value.

CREATE TABLE Products2 (ProductID INT PRIMARY KEY, ProductName VARCHAR(50) NOT NULL, Price DECIMAL(10, 2) NOT NULL)

-- Insert a record with valid values for all columns
INSERT INTO Products2 (ProductID, ProductName, Price)
VALUES (1, 'Laptop', 799.99)

--In this example:
--The ProductName and Price columns are defined as NOT NULL, meaning every product must have a name and a price.
--If we attempt to insert a record with a missing value for either of these columns, SQL Server will throw an error.

--6. Add a UNIQUE constraint to the ProductName column in the Products table.

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName)

--7. Write a comment in a SQL query explaining its purpose.

--The comment describes the purpose of the UNIQUE constraint on the ProductName column: 
--ensuring that every product has a unique name, preventing duplicate product names in the table

--8. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,            -- CategoryID is the primary key
    CategoryName VARCHAR(50) UNIQUE        -- CategoryName must be unique
)

--9. Explain the purpose of the IDENTITY column in SQL Server.

--In SQL Server, the IDENTITY column is used to automatically generate unique values for a column,
--typically for primary key columns. This helps ensure that each row has a unique identifier
--without requiring the user to manually insert values for that column.
--The Purpose: Auto-incrementing Values, Simplifies Data Insertion, Ensures Uniqueness.

---Medium-Level---

--10. Use BULK INSERT to import data from a text file into the Products table.
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',  -- Specifies the delimiter between columns
    ROWTERMINATOR = '\n',   -- Specifies the delimiter between rows (new line)
    FIRSTROW = 1           -- Specifies that the first row contains data (no header row)
)

--11. Create a FOREIGN KEY in the Products table that references the Categories table.
ALTER TABLE Products
ADD CategoryID INT;  -- Add the CategoryID column to the Products table

-- Create a FOREIGN KEY constraint in the Products table
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
--The CategoryID column in the Products table will reference the CategoryID column in the Categories table

--12. Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.
--PRIMARY KEY: Guarantees uniqueness and disallows NULL values, and there can be only one PRIMARY KEY per table
--example: CREATE TABLE Employees (
--		   EmployeeID INT PRIMARY KEY,  -- EmployeeID is the primary key, must be unique and not null
--		   EmployeeName VARCHAR(50))

--UNIQUE KEY: Guarantees uniqueness but allows NULL values (with the exception that multiple NULL values 
--are allowed), and a table can have multiple UNIQUE constraints.
--example: CREATE TABLE Products (
--		   ProductID INT PRIMARY KEY,          -- ProductID is the primary key
--		   ProductName VARCHAR(50) UNIQUE)     -- ProductName must be unique

--13. Add a CHECK constraint to the Products table ensuring Price > 0.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0)

--14. Modify the Products table to add a column Stock (INT, NOT NULL).
ALTER TABLE Products
Alter column Stock INT NOT NULL 
-- SQL Server requires that we provide a default value or update existing records to ensure 
-- there are no NULL values in the new column for rows that already exist.
-- That's why we added a default value
select * from Products
--15. Use the ISNULL function to replace NULL values in a column with a default value.
UPDATE Products
SET Stock = ISNULL(Stock, 0)
UPDATE Products
SET ProductID = ISNULL(ProductID, 0)
UPDATE Products
SET ProductName = ISNULL(ProductName, 0)
UPDATE Products
SET Price = ISNULL(Price, 0)
UPDATE Products
SET CategoryID = ISNULL(CategoryID, 0)

--16. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.

--A FOREIGN KEY constraint is used to enforce a relationship between two tables in a relational database.
--It ensures referential integrity, meaning that the data in the child table must match valid entries
--in the parent table.
