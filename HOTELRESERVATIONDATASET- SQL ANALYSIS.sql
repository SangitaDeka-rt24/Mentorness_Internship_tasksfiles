# 1. What is the total number of reservations in the dataset?
#-----Total Number of Reservations-------

SELECT COUNT(*) AS total_reservations
FROM project.`hotel reservation dataset`
WHERE booking_status='Not_Canceled';

# 2. Which meal plan is the most popular among guests?
#----Most Popular Meal Plan-----

SELECT type_of_meal_plan, COUNT(*) AS plan_count
FROM project.`hotel reservation dataset`
GROUP BY type_of_meal_plan
ORDER BY plan_count DESC
LIMIT 1;

# 3. What is the average price per room for reservations involving children?
#-----Average Price per Room for Reservations Involving Children-------

SELECT  no_of_children, ROUND(AVG(avg_price_per_room))
FROM project.`hotel reservation dataset` 
GROUP BY no_of_children 
ORDER BY ROUND(AVG(avg_price_per_room)) DESC;

# 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
#-----Number of Reservations Made for a Specific Year-------

SELECT COUNT(*) AS reservations_count
FROM project.`hotel reservation dataset` 
WHERE arrival_date LIKE '%2018';

# 5. What is the most commonly booked room type?
#-----Most Commonly Booked Room Type-------

SELECT room_type_reserved, COUNT(*) AS bookings_count
FROM project.`hotel reservation dataset` 
GROUP BY room_type_reserved
ORDER BY bookings_count DESC
LIMIT 1;

# 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
#----Number of Reservations Falling on a Weekend--------

SELECT COUNT(*) AS weekend_reservations_count
FROM project.`hotel reservation dataset` 
WHERE no_of_weekend_nights > 0;

# 7. What is the highest and lowest lead time for reservations?
#----Highest and Lowest Lead Time for Reservations---------

SELECT 
	MAX(lead_time) AS highest_lead_time,
	MIN(lead_time) AS lowest_lead_time
FROM project.`hotel reservation dataset`;

# 8. What is the most common market segment type for reservations?
#-------Most Common Market Segment Type for Reservations--------

SELECT market_segment_type, COUNT(*) AS segment_count
FROM project.`hotel reservation dataset`
GROUP BY market_segment_type
ORDER BY segment_count DESC
LIMIT 1;

# 9. How many reservations have a booking status of "Confirmed"?
#-------Number of Reservations with Booking Status "Confirmed"-------

SELECT booking_status, COUNT(*) AS confirmed_reservations_count
FROM project.`hotel reservation dataset`
GROUP BY booking_status;

# 10. What is the total number of adults and children across all reservations?
#-------Total Number of Adults and Children Across All Reservations--------

SELECT 
    SUM(no_of_adults) AS total_adults,
    SUM(no_of_children) AS total_children
FROM 
    project.`hotel reservation dataset`;

# 11. What is the average number of weekend nights for reservations involving children?
#------Average Number of Weekend Nights for Reservations Involving Children------

SELECT ROUND(AVG(no_of_weekend_nights)) AS avg_weekend_nights_with_children
FROM project.`hotel reservation dataset`
WHERE no_of_children > 0;

# 12. How many reservations were made in each month of the year?
#------Number of Reservations Made in Each Month of the Year-------

SELECT MONTH(STR_TO_DATE(arrival_date, '%Y-%m-%d')) AS month,
	   COUNT(*) AS reservations_count
FROM project.`hotel reservation dataset`
GROUP BY MONTH(STR_TO_DATE(arrival_date, '%Y-%m-%d'))
ORDER BY MONTH(STR_TO_DATE(arrival_date, '%Y-%m-%d')) ASC;

# 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
#-------Average Number of Nights Spent by Guests for Each Room Type-------

SELECT room_type_reserved,
       ROUND(AVG(no_of_weekend_nights + no_of_week_nights)) AS avg_nights
FROM project.`hotel reservation dataset`
GROUP BY room_type_reserved
ORDER BY room_type_reserved ASC;

# 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
#-------Most Common Room Type for Reservations Involving Children and Average Price--------

SELECT count(no_of_children), room_type_reserved, ROUND(AVG(avg_price_per_room)) AS avg_price
FROM project.`hotel reservation dataset`
GROUP BY room_type_reserved
ORDER BY COUNT(*) DESC
LIMIT 1;

# 15. Find the market segment type that generates the highest average price per room.
#-------Market Segment Type Generating the Highest Average Price per Room--------

SELECT market_segment_type, ROUND(AVG(avg_price_per_room)) AS avg_price_per_room
FROM project.`hotel reservation dataset`
GROUP BY market_segment_type
ORDER BY ROUND(AVG(avg_price_per_room)) DESC
LIMIT 1;


#------------THE---END------------#




