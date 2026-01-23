# Ashville_AirBNB_Listings_Analysis

## Project Background

A Travel research firm that operates within the travel and hospitality technology sector specializing in leveraging large-scale public and proprietary datasets to derive actionable market insights.

The primary objective of this project undertaken by the travel research firm is to analyse the publicly available AirBnb data to provide critical insights for a travel startup client guiding their executive decision on whether to expand services in Ashville, NC.

Insights and recommendations are provided on the following key areas:

- Pricing insights: Evaluation of prices of listings(rooms) per night from 2011 to half of 2025 in Ashville,NC, focusing on Prices of listings, Avereage price of different Ashville neighbourhoods and Average  minimum night prices. 
- Demand analysis:Identification of High-Growth neighbourhoods and peak activity periods(Monthly/Annual) to determine market viability and optimal timing for service expansion.
- Host Analysis: Analysing Hosts and their pricing patterns, Number of listings per host and their activity based on reviews by guest to better understand the influence of hosts on the market.

First part of cleaning was done using Excel.

The SQL queries utilised load,clean and maintain data integrity can be found [here](load_clean.sql)

The SQL queries utilised for descriptive analysis can be found [here](descriptive_analysis.sql)

The SQL queries utilised to load raw data for enquiry can be found [here](load_rawdata.sql)

The SQL queries to answer business questions can be found [here](queries.sql)

## Data Structure

Ashville's AirBNB data as seen below consists of 3 tables, raw_listings, listings and reviews with a total rown count of 3,18,549.

![Datastructure](erd.png)

## Executive Summary

### Overview of Findings

After peaking in 2023 Ashville's guest activity saw a -14.55% decline in 2024.Halfway through 2025 the decline continues.This decline can be attributed to pre-pandemic normalcy.The peak guest activity happens during the month of september.There is some correlation between average prices of each neighbourhoods and guest activity there.Superhosts continues to shine.Hotel room's are the costliest of all the rooms listed.
The following sections will explore additional contributing factors and highlight key oppurtunity areas for improvement.

Examples are included throughout the report.The entire dashboard can be downloaded [here](vizzs/full_dashboard.png).

### Pricing Analysis:

  - The neighbourhoods with average prices lower than the whole city average accounts for 86.82% of guest activity.
  - Hotel rooms are the most expensive and shared rooms are the least expensive.Entire home/apt accounts for 90.98% of guest activity even with
    average price of 183.12,where hotel rooms accounts for only 0.103% of guest activity.
  - Most listings provide 1,2,3,30 minimum nights.And for the 99.014% of listings average prices decreases as number of minimum nights increases.
  - The price of rooms listed start from $18 to $6846.

  ![Price Analysis](vizzs/Dashboard_1.png)
