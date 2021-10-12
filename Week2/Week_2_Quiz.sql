--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

--1:Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.
select Milliseconds
, TrackID
from tracks
where Milliseconds >=5000000

--2:Run Query: Find all the invoices whose total is between $5 and $15 dollars.
select total
, InvoiceID
from Invoices
where total Between 5 AND 15

--3:Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
select Firstname
, Lastname
, Company
, State
From Customers
Where State IN('RJ','DF','AB','BC','CA','WA','NY')

--4:Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
select
InvoiceID
,CustomerID
,total
,InvoiceDate
From Invoices
where CustomerID IN(56, 58)
AND total Between 1 AND 5

--5:Run Query: Find all the tracks whose name starts with 'All'.
select Name
from Tracks
where Name LIKE 'All%'

--6:Run Query: Find all the customer emails that start with "J" and are from gmail.com.
select
Email
From Customers
where Email LIKE('J%@gmail.com')

--7:Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
select
InvoiceID
, BillingCity
, total
From Invoices
where BillingCity IN('Brasília','Edmonton','Vancouver')
ORDER BY InvoiceID desc

--8:Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
select CustomerId , COUNT(InvoiceId)
from Invoices
group by CustomerId
order by COUNT(InvoiceId) DESC

--9:Run Query: Find the albums with 12 or more tracks.
select
AlbumID
, COUNT(TrackID) as TotalTracks
from Tracks
GROUP BY AlbumID
HAVING COUNT(TrackID) >=12