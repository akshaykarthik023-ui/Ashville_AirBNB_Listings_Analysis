CREATE TABLE reviews(
	listing_id VARCHAR(255),
    dates date
);
SET GLOBAL local_infile = 1;  -- Enables local loading

LOAD DATA LOCAL INFILE 'C:/Users/acer/Downloads/reviews.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW WARNINGS;

SELECT COUNT(*)
FROM reviews;


									-- Data cleaning
-- DELETE rows where price is 0.
SET  SQL_SAFE_UPDATES = 0;
DELETE 
FROM listings
WHERE price = 0;
SET SQL_SAFE_UPDATES = 1;

									-- Outlier handling
-- finding the 99th percentile threshold
SELECT price
FROM listings
ORDER BY price ASC
LIMIT 1
OFFSET 2510;
-- 99the percentile value is 999.

-- Winsorizing the remaining 1% data to ensure data integrity
SET SQL_SAFE_UPDATES = 0;
UPDATE listings
SET price = 999
WHERE price > 999;
SET SQL_SAFE_UPDATES = 1;
