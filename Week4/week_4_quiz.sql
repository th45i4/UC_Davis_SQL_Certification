/*All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.*/

--1: Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
select 
customerID
, firstName
, lastName
, Address
, UPPER(City) || ', ' || UPPER(Country) as Location
from customers

--2: Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
select 
FirstName
, LastName
, substr(FirstName,1,4) || substr(LastName,1,2) as NewID
from employees

--3: Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
SELECT FirstName,
       LastName,
       HireDate,
       (STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate)) 
          - (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', HireDate)) 
          AS YearsWorked
FROM Employees
WHERE YearsWorked >= 15
ORDER BY LastName ASC

--4: Profiling the Customers table, answer the following question: Are there any columns with null values? Indicate any below. Select all that apply.
select COUNT(*)
from customers
where phone IS NULL

--5: Find the cities with the most customers and rank in descending order.
select count(customerID) as TotalCustomers
, city
from customers
group by city
order by TotalCustomers desc

--6: Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
select
c.firstname
, c.lastname 
, i.invoiceID
, i.invoiceID || c.firstname || c.lastname
from customers c INNER JOIN invoices i
on c.customerID = i.customerID
order by c.firstname, c.lastname, i.invoiceID