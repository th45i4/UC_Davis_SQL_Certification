--Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

--This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

--In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

--For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
--In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



--Part 1: Yelp Dataset Profiling and Understanding

--1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10,000
ii. Business table = 10,000
iii. Category table = 10,000
iv. Checkin table = 10,000
v. elite_years table = 10,000
vi. friend table = 10,000
vii. hours table = 10,000
viii. photo table = 10,000
ix. review table = 10,000
x. tip table = 10,000
xi. user table = 10,000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10,000
ii. Hours = 1,562
iii. Category = 2,643
iv. Attribute = 1,115
v. Review = 10,000
vi. Checkin = 493
vii. Photo = 10,000
viii. Tip = business_id = 3,979
ix. User = 10,000
x. Friend = 11
xi. Elite_years = 2,780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no
	
	
	SQL code used to arrive at answer:

	select “column”
	from user
	where “column” IS NULL;

	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:	1.0	max:	5.0	avg:	3.7082	
	
	ii. Table: Business, Column: Stars
	
		min:	1.0	max:	5.0	avg: 3.6549		
	
	iii. Table: Tip, Column: Likes
	
		min:	0	max:	2	avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	53	avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:	0	max:	2000	avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:

	select 
	city,
	SUM(review_count) as TotalReviews
	from business
	GROUP BY city
	ORDER BY TotalReviews desc


	
	Copy and Paste the Result Below:

+-----------------+--------------+
| city            | TotalReviews |
+-----------------+--------------+
| Las Vegas       |        82854 |
| Phoenix         |        34503 |
| Toronto         |        24113 |
| Scottsdale      |        20614 |
| Charlotte       |        12523 |
| Henderson       |        10871 |
| Tempe           |        10504 |
| Pittsburgh      |         9798 |
| Montréal        |         9448 |
| Chandler        |         8112 |
| Mesa            |         6875 |
| Gilbert         |         6380 |
| Cleveland       |         5593 |
| Madison         |         5265 |
| Glendale        |         4406 |
| Mississauga     |         3814 |
| Edinburgh       |         2792 |
| Peoria          |         2624 |
| North Las Vegas |         2438 |
| Markham         |         2352 |
| Champaign       |         2029 |
| Stuttgart       |         1849 |
| Surprise        |         1520 |
| Lakewood        |         1465 |
| Goodyear        |         1155 |
+-----------------+--------------+
(Output limit exceeded, 25 of 362 total rows shown)
	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

select 
stars
,count(stars) as StarCount
from business
where city == 'Avon'
group by stars



Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

+-------+-----------+
| stars | StarCount |
+-------+-----------+
|   1.5 |         1 |
|   2.5 |         2 |
|   3.5 |         3 |
|   4.0 |         2 |
|   4.5 |         1 |
|   5.0 |         1 |
+-------+-----------+


ii. Beachwood

SQL code used to arrive at answer:

select 
stars
,count(stars) as StarCount
from business
where city == 'Beachwood'
group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

+-------+-----------+
| stars | StarCount |
+-------+-----------+
|   2.0 |         1 |
|   2.5 |         1 |
|   3.0 |         2 |
|   3.5 |         2 |
|   4.0 |         1 |
|   4.5 |         2 |
|   5.0 |         5 |
+-------+-----------+
		


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

	select 
	name,
	id,
	review_count
	from user
	ORDER BY review_count desc

	
		
	Copy and Paste the Result Below:

+-----------+------------------------+--------------+
| name      | id                     | review_count |
+-----------+------------------------+--------------+
| Gerald    | -G7Zkl1wIWBBmD0KRy_sCw |         2000 |
| Sara      | -3s52C4zL_DHRK0ULG6qtg |         1629 |
| Yuri      | -8lbUNlXVSoXqaRRiHiSNg |         1339 |


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:

To an extent, yes. The top 25 users all have more than 100+ reviews, while the bottom 25 users all have less than 50 except for one outlier. It appears that in order to have a higher than average number of fans you must post a higher than average amount of reviews but having a lot of reviews does not guarantee more fans. The average review count is 25, and all the users with the most amount of fans have more than that.

+-----------+------------------------+------+--------------+
| name      | id                     | fans | review_count |
+-----------+------------------------+------+--------------+
| Amy       | -9I98YbNQnLdAmcYfb324Q |  503 |          609 |
| Mimi      | -8EnCioUmDygAbsYZmTeRQ |  497 |          968 |
| Harald    | --2vR0DIsmQ6WfcSzKWigw |  311 |         1153 |
| Gerald    | -G7Zkl1wIWBBmD0KRy_sCw |  253 |         2000 |
| Christine | -0IiMAZI2SsQ7VmyzJjokQ |  173 |          930 |
| Lisa      | -g3XIcCb2b-BD0QBCcq2Sw |  159 |          813 |
| Cat       | -9bbDysuiWeo2VShFJJtcw |  133 |          377 |
| William   | -FZBTkAZEXoP7CYvRV2ZwQ |  126 |         1215 |
| Fran      | -9da1xk7zgnnfO1uTVYGkA |  124 |          862 |
| Lissa     | -lh59ko3dxChBSZ9U7LfUw |  120 |          834 |
| Mark      | -B-QEUESGWHPE_889WJaeg |  115 |          861 |
| Tiffany   | -DmqnhW4Omr3YhmnigaqHg |  111 |          408 |
| bernice   | -cv9PPT7IHux7XUc9dOpkg |  105 |          255 |
| Roanna    | -DFCC64NXgqrxlO8aLU5rg |  104 |         1039 |
| Angela    | -IgKkE8JvYNWeGu8ze4P8Q |  101 |          694 |
| .Hon      | -K2Tcgh2EKX6e6HqqIrBIQ |  101 |         1246 |
| Ben       | -4viTt9UC44lWCFJwleMNQ |   96 |          307 |
| Linda     | -3i9bhfvrM3F1wsC9XIB8g |   89 |          584 |
| Christina | -kLVfaJytOJY2-QdQoCcNQ |   85 |          842 |
| Jessica   | -ePh4Prox7ZXnEBNGKyUEA |   84 |          220 |
| Greg      | -4BEUkLvHQntN6qPfKJP2w |   81 |          408 |
| Nieves    | -C-l8EHSLXtZZVfUAUhsPA |   80 |          178 |
| Sui       | -dw8f7FLaUmWR7bfJ_Yf0w |   78 |          754 |
| Yuri      | -8lbUNlXVSoXqaRRiHiSNg |   76 |         1339 |
| Nicole    | -0zEEaDFIjABtPQni0XlHA |   73 |          161 |
+-----------+------------------------+------+--------------+

+---------+------------------------+------+--------------+
| name    | id                     | fans | review_count |
+---------+------------------------+------+--------------+
| Joe     | ---94vtJ_5o_nikEs6hUjg |    0 |            2 |
| Jeb     | ---cu1hq55BP9DWVXXKHZg |    0 |           57 |
| Jed     | ---fhiwiwBYrvqhpXgcWDQ |    0 |            8 |
| Rae     | ---PLwSf5gKdIoVnyRHgBA |    0 |            2 |
| Ryan    | --0RtXvcOIE4XbErYca6Rw |    0 |            2 |
| Joe     | --0sXNBv6IizZXuV-nl0Aw |    0 |            1 |
| Scott   | --0WZ5gklOfbUIodJuKfaQ |    0 |            7 |
| John    | --104qdWvE99vaoIsj9ZJQ |    0 |            3 |
| Ron     | --1av6NdbEbMiuBr7Aup9A |    0 |            9 |
| Bryan   | --1mPJZdSY9KluaBYAGboQ |    0 |            5 |
| Patti   | --26jc8nCJBy4-7r3ZtmiQ |    0 |            2 |
| Gary    | --2bpE5vyR-2hAP7sZZ4lA |    0 |           23 |
| Kristin | --2HUmLkcNHZp0xw6AMBPg |    0 |           28 |
| Cynthia | --3B8LdT1NCD-bPkwS5-5g |    0 |            4 |
| Mrme    | --3oMd6gjXpAzhjLBrsVCQ |    0 |            2 |
| Austin  | --44NNdtngXMzsxyN7ju6Q |    0 |            2 |
| Mesut   | --4rAAfZnEIAKJE80aIiYg |    0 |           25 |
| Lissa   | --4ww39MLTS1SBRmCrSmww |    0 |            3 |
| Tara    | --56y1InAvNoQOD6YYrhVQ |    0 |            3 |
| Lyndsey | --5BsHjOVLIGoTwjol-V2w |    0 |            1 |
| Annie   | --5ihAtBE4kI5Gch9383qA |    0 |           11 |
| Daniece | --5ox2OhSAADcB_uAEOYFw |    0 |            2 |
| Alex    | --5XzJ2pRsVVJiJUfzZlgQ |    0 |            7 |
| Mary    | --6D_IuxyKTN53pHi904ag |    0 |            2 |
| Garen   | --6kLBBsm0GPM9vIB2YBDw |    0 |            3 |
+---------+------------------------+------+--------------+
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: Love. Love is included in 1780 reviews while hate is included in 232.

	
	SQL code used to arrive at answer:
select 
count(*)
from review
where text like '%love%'

select 
count(*)
from review
where text like '%hate%'


	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:

	select 
	name,
	id,
	fans
	from user
	ORDER BY fans desc

	
	
	Copy and Paste the Result Below:

+-----------+------------------------+------+
| name      | id                     | fans |
+-----------+------------------------+------+
| Amy       | -9I98YbNQnLdAmcYfb324Q |  503 |
| Mimi      | -8EnCioUmDygAbsYZmTeRQ |  497 |
| Harald    | --2vR0DIsmQ6WfcSzKWigw |  311 |
| Gerald    | -G7Zkl1wIWBBmD0KRy_sCw |  253 |
| Christine | -0IiMAZI2SsQ7VmyzJjokQ |  173 |
| Lisa      | -g3XIcCb2b-BD0QBCcq2Sw |  159 |
| Cat       | -9bbDysuiWeo2VShFJJtcw |  133 |
| William   | -FZBTkAZEXoP7CYvRV2ZwQ |  126 |
| Fran      | -9da1xk7zgnnfO1uTVYGkA |  124 |
| Lissa     | -lh59ko3dxChBSZ9U7LfUw |  120 |
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

Yes, the lower rated restaurants tend to be open to midnight or later. The restaurants with higher ratings close earlier, all before midnight.

ii. Do the two groups you chose to analyze have a different number of reviews?

Yes, the higher rated restaurants have more reviews.
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

Yes, the restaurants with higher ratings were located in Summerlin and Chinatown.

SQL code used for analysis:

select 
b.name
,b.city
,b.stars
,c.category
,b.review_count
,b.neighborhood
,h.hours
from business b 
INNER JOIN category c on b.id = c.business_id
INNER JOIN hours h on b.id = h.business_id
where b.city = 'Las Vegas' AND c.category = 'Restaurants'




		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:

There are more businesses open than closed. There are 8480 open restaurants and 1520 closed restaurants.
         
ii. Difference 2:
         
There are more reviews for restaurants that are open than closed. There are 269,300 reviews of open restaurants and 35,261 reviews of restaurants that are closed.
         
SQL code used for analysis:

select 
is_open
,SUM(review_count)
,COUNT(stars)
,count(name)
from business
GROUP BY is_open

	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

I want to find which city has the most 5 star rated restaurants.
         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
                           
I will need a column of a count of every business in a city where the stars is equal to 5. I will then need to order this new column in descending order to see which city has the most 5 star rated restaurants.
                  
iii. Output of your finished dataset:

Las Vegas has the most 5 star rated restaurants with a count of 294.

+------------+---------------+
| city       | FiveStarRated |
+------------+---------------+
| Las Vegas  |           294 |
| Phoenix    |           195 |
| Scottsdale |           137 |
| Toronto    |            94 |
| Mesa       |            68 |
| Charlotte  |            67 |
| Tempe      |            58 |
| Gilbert    |            55 |
| Henderson  |            55 |
| Pittsburgh |            55 |
| Chandler   |            43 |
| Glendale   |            34 |
| Peoria     |            28 |
| Cleveland  |            24 |
| Madison    |            22 |
| Edinburgh  |            21 |
| Montréal   |            20 |
| Stuttgart  |            16 |
| Surprise   |            15 |
| Champaign  |            11 |
| Avondale   |             7 |
| Cornelius  |             7 |
| Fort Mill  |             7 |
| Goodyear   |             7 |
| MESA       |             7 |
+------------+---------------+
(Output limit exceeded, 25 of 147 total rows shown)
         
         
iv. Provide the SQL code you used to create your final dataset:

select 
city
,count(stars) as FiveStarRated
from business 
where stars = 5
GROUP BY City
ORDER BY FiveStarRated desc





