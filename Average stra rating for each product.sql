Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month.
The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places.
Sort the output first by month and then by product ID.

Reviews Table:
---------------
Column Name	: Type
review_id	: integer
user_id	: integer
submit_date	: datetime
product_id	:integer
stars	integer :(1-5)

reviews Example Input:
----------------------
review_id	user_id	submit_date	product_id	stars
6171	123	06/08/2022 00:00:00	50001	4
7802	265	06/10/2022 00:00:00	69852	4
5293	362	06/18/2022 00:00:00	50001	3
6352	192	07/26/2022 00:00:00	69852	3
4517	981	07/05/2022 00:00:00	69852	2

Example Output:
-----------------
mth	| product	avg_stars
6	  | 50001	3.50
6	  | 69852	4.00
7	  | 69852	2.50

Postgre SQl:
select  EXTRACT(MONTH FROM submit_date) as mth,
product_id,
ROUND(AVG(stars),2) as avg_stars
from reviews
group by product_id,mth
order by mth, product_id;

## MYSQL:
SELECT  
  MONTH(submit_date) AS mth,
  product_id,
  ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY product_id, mth
ORDER BY mth, product_id;
