--HOMEWORK 1--

--EASY
--1)
--  i) Data is raw facts or information that can be processed to generate 
--	   insights or knowledge.
-- ii) A database is an organized system for storing and managing data
--iii) A relational database stores data in tables that are linked by 
--	relationships using keys, making it easy to organize and retrieve data
-- iv) A table is a collection of data organized in rows and columns.

--2) 
--	 5 key features of SQL Server: Data Security, High Availability, 
--	 Scalability, Data Integrity, Advanced Analytics

--3) 
--	 SQL Server can be configured to use either Windows Authentication mode,
--	 SQL Server Authentication mode, or both (Mixed Mode Authentication).

-----------------------

--MEIDUM
--4) Create a new database in SSMS named SchoolDB
Create database SchoolDB

--5) Write and execute a query to create a table called Students
--	 with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), 
--	 Age (INT)
Create table Students (StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT)

--6) Describe the differences between SQL Server, SSMS, and SQL.
-- a) SQL Server is the database management system that stores
--	  and manages your data.

-- b) SSMS is the tool that helps you interact with and manage 
--	  SQL Server using a graphical interface.

-- c) SQL is the language you use to query and manipulate data in SQL Server.

-------------------

--HARD

--7) Research and explain the different SQL commands: 
--	 DQL, DML, DDL, DCL, TCL with examples.

--	 a) DQL (Data Query Language) is used for querying 
--	 and retrieving data from the database.
-- ex.: Select * from Students

--	 b) DML (Data Manipulation Language) is used to manipulate data in the database.
--		This includes inserting, updating, or deleting data within tables.
-- ex.: Insert into Students (StudentID, Name, Age) values (1, 'Jamshid', 18)
-- ex.: Update Students Set Age = 20 Where StudentID = 1
-- ex.: Delete from Students Where StudentID = 1

--	 c) DDL (Data Definition Language)  is used to define and manage database
--		structures, such as creating, altering, and deleting tables and databases
-- ex.: Alter table Students Add Gender Varchar(10)
-- ex.: Drop table Students
-- ex.: Truncate table Students

--	 d) DCL (Data Control Language) is used to control access to data 
--	in the database. It allows you to grant or revoke permissions to users.
-- ex.: Grant select, Insert on Students To User1
-- ex.: Revoke select, Insert on Students From User1

--	 e) TCL (Transaction Control Language) is used to ensure that 
--	 the operations are completed successfully or rolled back if needed.
-- ex.: begin tran drop table Students rollback tran

--8) Write a query to insert three records into the Students table
Insert into Students
values 
(4, 'Alex', 18),
(5, 'Sam', 24),
(6, 'Nicola', 16)

--9) Create a backup of your SchoolDB database and restore it. 
--	 (write its steps to submit)

-- a) Back Up the Database:
--	  Right-click on SchoolDB > Tasks > Back Up.
--	  Choose the backup destination.
--	  Click OK to complete the backup.

--ALTERNATIVE WAY
--BACKUP DATABASE SchoolDB
--TO DISK = 'C:\Backups\SchoolDB.bak'

-- b) Restore the Database:
--	  Right-click on Databases > Restore Database.
--	  Choose the backup file and restore the database.

--ALTERNATIVE WAY
--RESTORE DATABASE SchoolDB
--FROM DISK = 'C:\Backups\SchoolDB.bak'
--WITH REPLACE