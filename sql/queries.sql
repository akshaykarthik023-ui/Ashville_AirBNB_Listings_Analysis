									-- Pricing insights
                                    
SELECT neighbourhood,
		AVG(price) AS average
FROM listings
GROUP BY neighbourhood
ORDER BY average;   -- 28806 has the least average of 163.41 and 28732 has the highest average of 203.10
	   
SELECT minimum_nights,
		COUNT(minimum_nights),
        AVG(price)
FROM listings
GROUP BY minimum_nights;	-- Most listings provide 2(1079),1(864),3(247),30(194) minimum_nights.
                            -- For the majority minimum nights(94.01%)listed: Average price decreases as minimum nights increases.
                            
												-- Review and Demand Analysis
                                                
SELECT * 
FROM listings l
LEFT JOIN reviews r ON l.id = r.listing_id;

SELECT COALESCE(date_format(joined_table.dates,'%Y-%m'),0) AS year_mon,
		COUNT(*) AS review_count
FROM (
	SELECT *
    FROM listings l
    LEFT JOIN reviews r ON l.id = r.listing_id
)AS joined_table
GROUP BY year_mon;



SELECT COALESCE(date_format(joined_table.dates,'%Y'),0) AS years,
		ROUND(COUNT(*)/12,2) AS avg_review_count
FROM (
	SELECT *
    FROM listings l
    LEFT JOIN reviews r ON l.id = r.listing_id
)AS joined_table
GROUP BY years;  -- 2022 saw the peak of room accomodation(3582.33 reviews per month)

SELECT neighbourhood,
		COUNT(*) AS review_count
FROM (
		SELECT *
        FROM listings l 
        LEFT JOIN reviews r ON l.id = r.listing_id
)AS joined_table
GROUP BY neighbourhood
ORDER BY review_count DESC;  -- neighbourhood 28806 had the most reviews(67139),28801(66740) comes in second,28804(39785) comes in third.
							 -- 28732 had the least number of reviews(4333) and 28715(5714).

SELECT neighbourhood,
		COALESCE(date_format(joined_table.dates,'%Y')) AS years,
		COUNT(joined_table.dates) AS review_count
FROM (
		SELECT *
        FROM listings l 
        LEFT JOIN reviews r ON l.id = r.listing_id
)AS joined_table
GROUP BY neighbourhood,years
ORDER BY neighbourhood DESC;  -- neighbouhood 28806 peaked in activity during 2021 and 2022 with over 10,000 reviews each year.However volume has declined significantly
							  -- dropping to 7027 in 2024.Halfway through 2025 data (2335 reviews) suggests this downward trend is continuing.
                              
-- Sometimes less reviews means prices have gone up, lets check it

SELECT neighbourhood,
		YEAR(r.dates) AS years,
		ROUND(AVG(price),2) AS avg_price,
        COUNT(r.dates) AS review_count
FROM listings l
INNER JOIN reviews r ON l.id = r.listing_id
GROUP BY neighbourhood,years
ORDER BY  neighbourhood DESC;  -- The average prices during 2021,2022,2023,2024 for the neighbourhood 28806 does not differ much, fluctuating slightly between 110 and 116.
							   -- also the reduction in average prices in 2025(106) along with review volume decline point out to some other reasons.
                               -- There is a trend that says majority of neighbourhoods experienced peak guest activity during the years from 2019 to 2023 then 2024 saw a decline
                               -- in guest activity and decrease in average prices.

SELECT neighbourhood,
       date_format(r.dates,'%Y-%m') AS year_months,
       COUNT(r.dates) AS review_counts,
       ROW_NUMBER() OVER(PARTITION BY neighbourhood ORDER BY COUNT(r.dates) DESC) AS ranks
FROM listings l
INNER JOIN reviews r ON l.id = r.listing_id
GROUP BY neighbourhood,year_months
ORDER BY review_counts DESC;   -- Month september during years 2021,2022,2023 for neighbourhoods 28806 and 28801 saw the peak guest activity.

											-- Host Analysis
SELECT host_name,
		calculated_host_listings_count
FROM listings
ORDER BY calculated_host_listings_count DESC;  -- Towns(Host name) has the most listings as a host: 108, then Yonder(Host name) has 50 listings. 


SELECT host_name,
		calculated_host_listings_count,
        CASE WHEN calculated_host_listings_count >= 15 THEN 'SuperHost'
        ELSE 'NON-SuperHost'
        END host_category
FROM listings
ORDER BY calculated_host_listings_count DESC; -- Hosts that have more than 15 listings are considered Superhost

SELECT host_name,
		calculated_host_listings_count,
        CASE 
			WHEN calculated_host_listings_count > 30 THEN 'UltraSuperHost'
			WHEN calculated_host_listings_count > 15 THEN 'SuperHost' 
            ELSE 'Non-SuperHost'
        END host_category,
        AVG(price) AS avg_price
FROM listings
GROUP BY host_name,calculated_host_listings_count
ORDER BY calculated_host_listings_count DESC;  -- Hosts which are UltraSuperHosts(greater than 30 listings) charge less than most of the SuperHosts.
											   -- Then the Non-SuperHosts which are the majority host category includes the top most expensive listings.
