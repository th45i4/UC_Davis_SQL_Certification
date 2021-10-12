--For all of the questions in this quiz, we are using the Chinook database. All of the interactive code blocks have been setup to retrieve data only from this database.

--1: Run query: Retrieve all the data from the tracks table. Who is the composer for track 18?
Select *
From Tracks;

--2:Run Query: Retrieve all data from the artists table. Look at the list of artists, how many artists are you familiar with (there is no wrong answer here)?
Select *
From Artists;

--3: Run Query: Retrieve all data from the invoices table. What is the billing address for customer 31?
Select *
From Invoices;

--4: Run Query: Return the playlist id, and name from the playlists table. How many playlists are there? Which would you classify is your favorite from this list?
Select Playlistid,
Name
From Playlists;

--5: Run Query: Return the Customer Id, Invoice Date, and Billing City from the Invoices table. What city is associated with Customer ID number 42? What was the invoice date for the customer in Santiago?
Select CustomerId,
InvoiceDate,
BillingCity
From Invoices;

--6:Run Query: Return the First Name, Last Name, Email, and Phone, from the Customers table. What is the telephone number for Jennifer Peterson?
Select FirstName,
LastName,
Email,
Phone
From Customers;

--7:Run Query: Return the Track Id, Genre Id, Composer, Unit Price from the Tracks table. How much do these tracks cost?
Select TrackId,
GenreId,
Composer,
UnitPrice
From Tracks;

--8:Run Query: Select all the columns from the Playlist Track table and limit the results to 10 records. How might this information be used?
Select *
From Playlist_track
Limit 10;

--9:Run Query: Select all the columns from the Media Types table and limit the results to 50 records. What happened when you ran this query? Were you able to get all 50 records?
Select *
From Media_types
Limit 50;

--10:Run Query: Select all the columns from the Albums table and limit the results to 5 records. How many columns are in the albums table?
   --What is the name of the 9th album in this list?
Select *
From Albums
Limit 10;