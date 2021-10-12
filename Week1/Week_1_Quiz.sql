--For all of the questions in this quiz, we are using the Chinook database. All of the interactive code blocks have been setup to retrieve data only from this database.
--1. Retrieve all the records from the Employees table.
select *
From Employees

--2. Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.

Select FirstName
,LastName
,Birthdate
,Address
,City
,State
From Employees

--3. Retrieve all the columns from the Tracks table, but only return 20 rows.

Select *
From Tracks
Limit 20