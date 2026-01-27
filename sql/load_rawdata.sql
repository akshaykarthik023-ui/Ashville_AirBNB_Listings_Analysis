DROP TABLE IF EXISTS raw_listings;

CREATE TABLE raw_listings(
		id VARCHAR(255),
		name VARCHAR(255),
		host_id INT,
		host_name VARCHAR(255),
		neighbourhood INT,
		latitude DOUBLE,
		longitude DOUBLE,
		room_type VARCHAR(255),
		price INT,
		minimum_nights INT,
		number_of_reviews INT,
		last_review DATE,
		reviews_per_month INT,
		calculated_host_listings_count INT,
		availability_365 INT,
		number_of_reviews_ltm INT
);

SET GLOBAL local_infile = 1; -- Enables local loading

LOAD DATA LOCAL INFILE 'C:/Users/acer/Downloads/Book1.csv'
INTO TABLE raw_listings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SET SQL_SAFE_UPDATES = 0;
DELETE 
FROM raw_listings
WHERE price = 0;
SET SQL_SAFE_UPDATES = 1;

SELECT COUNT(*)
FROM raw_listings;

										-- Price insights
SELECT id,
		name,
        host_name,
        neighbourhood,
        room_type,
        price,
        minimum_nights
FROM raw_listings
ORDER BY price DESC
LIMIT 10;  	-- The five most expensive listings are Asheville River Cabins(6846),Charming 2B2B furn cabin home(2300),
			-- Update: Luxury Estate in Asheville(2043),Mountain location Five minutes to downtown(2000),
            -- Rosemary House(1960)
