									-- Descriptive Analysis
SELECT COUNT(id)
FROM listings; -- 2536 total rows.


SELECT AVG(price) AS median
FROM
	(
		SELECT price,
			   ROW_NUMBER() OVER (ORDER BY price ASC) AS row_num,
               COUNT(*) OVER () AS total_count
		FROM listings
)AS t
WHERE row_num IN (FLOOR((total_count + 1 ) / 2),CEIL(total_count + 1) / 2);  -- median is 128


SELECT AVG(price)
FROM listings;   -- Average 174.938

SELECT room_type, 
	   COUNT(id) AS total_listings
FROM listings
GROUP BY room_type;  -- Entire home: 2289, Private room: 227, Shared room: 8, Hotel_room: 12

SELECT neighbourhood, 
	   COUNT(id) AS listings
FROM listings
GROUP BY neighbourhood;  -- 28806 has the most number of listings: 702 while 28732 has only 68.
