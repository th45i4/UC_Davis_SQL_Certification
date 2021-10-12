/*All of the questions in this
quiz pull from the open source Chinook Database. Please refer to the ER Diagram below and familiarize yourself with the table and
column names to write accurate queries and get the appropriate
answers.*/

--1:How many albums does the artist Led Zeppelin have? 
select title
from albums
where artistID in( 
    select artistID
    from artists 
    where name IN('Led Zeppelin'));

--2: Create a list of album titles and the unit prices for the artist "Audioslave".
select
a.Title
,t.UnitPrice
from albums a
INNER JOIN tracks t on a.albumID = t.albumID
INNER JOIN Artists ar on ar.ArtistID = a.ArtistID
where ar.Name = 'Audioslave'

--3: Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?  
select
c.FirstName
,c.LastName
from Customers c 
LEFT JOIN invoices i
ON c.customerID = i.customerID
where i.customerID IS NULL

--4: Find the total price for each album.
select Sum (t.UnitPrice)
,t.Name
,a.Title
from tracks t
INNER JOIN albums a
ON t.AlbumID = a.albumID
where a.Title IN('Big Ones')

--5: How many records are created when you apply a Cartesian join to the invoice and invoice items table?
select i.InvoiceID
from invoices i CROSS JOIN invoice_items it
