/*All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.*/

--1: Using a subquery, find the names of all the tracks for the album "Californication".
select 
Name
from tracks
where AlbumID IN(
    select AlbumID
    from albums
    where title IN ('Californication'))

--2: Find the total number of invoices for each customer along with the customer's full name, city and email.
select Count(i.InvoiceID)
,c.FirstName
,c.LastName
,c.City
,c.email
from invoices i INNER JOIN customers c
on i.customerID = c.customerID
group by i.customerID

--3: Retrieve the track name, album, artistID, and trackID for all the albums.
select a.title
, a.artistID
, t.name
, t.trackID
from albums a INNER JOIN tracks t
on a.albumID = t.albumID

--4: Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
select lastname
, employeeID
, reportsto
from employees

--5: Find the name and ID of the artists who do not have albums. 
select 
ar.name
,ar.artistID
from artists ar LEFT JOIN albums a
on ar.artistID = a.artistID
where a.artistID IS NULL

--6: Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
select firstname
, lastname 
from employees
UNION
select firstname
, lastname 
from customers
order by lastname desc

--7:See if there are any customers who have a different city listed in their billing city versus their customer city.
select c.firstname
, c.customerID
, c.city
, i.BillingCity
from customers c INNER JOIN invoices i
on c.customerID = i.customerID
where c.city <> i.BillingCity