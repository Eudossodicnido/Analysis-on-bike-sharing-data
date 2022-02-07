----------------------------------------------------
---DATA CLEANING
----------------------------------------------------

---CREATING TEMP TABLE (UNCLEANED) FOR THE YEAR 2020
CREATE TABLE #2020_not_cleaned
(
ride_id NVARCHAR (50) NULL,
rideable_type NVARCHAR (50) NULL,
started_at DATETIME NULL,
ended_at DATETIME NULL,
start_station_name NVARCHAR (50) NULL,
start_station_id NVARCHAR (50) NULL,
end_station_name NVARCHAR (50) NULL,
end_station_id NVARCHAR (50) NULL,
start_lat FLOAT NULL,
start_lng FLOAT NULL,
end_lat FLOAT NULL,
end_lng FLOAT NULL,
member_casual NVARCHAR (50) NULL
);

--COMBINING AND INSERTING THE DIFFERENT TABLES INTO THE TEMP TABLE
INSERT INTO #2020_not_cleaned
		SELECT * 
		FROM [2020_Q1]
        UNION ALL
        SELECT * 
		FROM [2020_04]
        UNION ALL
        SELECT * 
		FROM [2020_05]
        UNION ALL
        SELECT * 
		FROM [2020_06]
        UNION ALL
        SELECT * 
		FROM [2020_07]
        UNION ALL
        SELECT * 
		FROM [2020_08]
        UNION ALL
        SELECT * 
		FROM [2020_09]
        UNION ALL
        SELECT * 
		FROM [2020_10]
        UNION ALL
        SELECT * 
		FROM [2020_11]
        UNION ALL
        SELECT * 
		FROM [2020_12];

-----CHECKING TOTAL ROWS
SELECT  *
FROM     
#2020_not_cleaned
ORDER BY started_at DESC
OFFSET  5 ROWS 
FETCH NEXT 5 ROWS ONLY;

---REMOVING NULL AND BLANKS
WITH #2020_cleaned AS 
(
SELECT *
FROM 
#2020_not_cleaned
WHERE 
start_station_name IS NOT NULL AND
start_station_id IS NOT NULL AND
end_station_name IS NOT NULL AND
end_station_id IS NOT NULL AND
start_lat IS NOT NULL AND
start_lng IS NOT NULL AND
end_lat IS NOT NULL AND
end_lng IS NOT NULL),

---CALCULATING RIDE LENGTH AND DAY OF THE WEEK
#2020_with_rides_and_dates AS 
(
SELECT * ,
DATEDIFF(MINUTE, started_at, ended_at) AS ride_length,
DATEPART (weekday,started_at) AS day_of_week2,
DATEPART (month,started_at) AS month  
FROM 
#2020_cleaned ),

---CONVERTING DAY OF THE WEEK
#2020_with_dates_of_the_week AS
(SELECT * ,
CASE
WHEN day_of_week2 = 1 THEN 'Monday'
WHEN day_of_week2 = 2 THEN 'Tuesday'
WHEN day_of_week2 = 3 THEN 'Wednesday'
WHEN day_of_week2 = 4 THEN 'Thursday'
WHEN day_of_week2 = 5 THEN 'Friday'
WHEN day_of_week2 = 6 THEN 'Saturday'
ELSE 'Sunday'
END AS day_of_week
FROM 
#2020_with_rides_and_dates 
),

---REMOVING TEST RIDES AND INCONSISTENT RIDE LENGTH VALUES

#2020_final AS 
(SELECT *
FROM 
#2020_with_dates_of_the_week
WHERE
ride_length > 1
AND start_station_name NOT LIKE ('%TEST%')
AND end_station_name NOT LIKE ('%TEST%')
)

---CHECKING THAT EVERYTHING IS OK
SELECT *
FROM 
#2020_final
ORDER BY started_at; 

----------------------------------------------
----ANALYSIS
----------------------------------------------

---CHECKING RATIO BETWEEN CASUAL AND MEMBER
select 
member_casual,
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM [2020_final])
FROM
[2020_final]
GROUP BY member_casual;

---CHECKING NUMBER OF RIDES BY MONTH AND BY DAY CASUAL VS MEMBER
SELECT
[month],
day_of_week2,
day_of_week,
member_casual,
AVG(ride_length) AS avg_ride
FROM
[2020_final]
WHERE 
ride_length < 1440
GROUP BY   [month],day_of_week2, day_of_week, member_casual
ORDER BY [month], day_of_week2;

---CHECKING MOST POPULAR ROUTES BY MONTH AND DAY (CASUAL)
SELECT 
start_station_name,
end_station_name,
[month],
member_casual,
COUNT(*) as [count]
FROM 
[2020_final]
WHERE member_casual='casual' AND ride_length < 1440
GROUP BY [month], start_station_name,  end_station_name, member_casual
ORDER BY [month], [count] DESC

---CHECKING MOST POPULAR ROUTES BY MONTH AND DAY (MEMBER)
SELECT 
start_station_name,
end_station_name,
[month],
member_casual,
COUNT(*) as [count]
FROM 
[2020_final]
WHERE member_casual='member' AND ride_length < 1440
GROUP BY [month], start_station_name,  end_station_name, member_casual
ORDER BY [month], [count] DESC





