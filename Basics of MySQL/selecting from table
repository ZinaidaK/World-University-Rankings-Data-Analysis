USE bi_marathon_zinaida;

-- selecting only 30 public universities 

SELECT * FROM dim_university
WHERE type = 'Public'
LIMIT 30;

-- selecting only United State country from location table

SELECT * FROM dim_location
WHERE country = 'United States'
LIMIT 10;

SELECT * 
FROM dim_university AS du
INNER JOIN fact_table AS ft
ON du.PK_University = ft.FK_University
INNER JOIN dim_location AS dl
ON dl.PK_Location = ft.FK_Location  
WHERE country = 'United States' AND city LIKE 'New%';

-- selecing the universuty where research output is medium
SELECT DISTINCT university_name
FROM dim_research AS dr
INNER JOIN fact_table AS ft
ON ft.FK_Research = dr.PK_research
INNER JOIN dim_university AS du
ON ft.FK_university = du.PK_University
WHERE research_output = 'Medium';

-- inserting new value to the dim_location table 
INSERT INTO dim_location
VALUES (1500, 'Europe', 'Ukraine', 'Odesa');

-- checking if the values were added
SELECT * FROM dim_location
WHERE city = 'Odesa';

-- removing the previously added values
DELETE FROM dim_location
WHERE city = 'Odesa';

-- finding only the values with "tr' letters
SELECT DISTINCT university_name 
FROM dim_university
WHERE university_name LIKE 'tr%';

-- filtering dim_university table to show only IDs from 4 to 50
SELECT * FROM dim_university
WHERE PK_University BETWEEN 4 AND 50;

-- inserting NULL values to the dim_location table 
INSERT INTO dim_location
VALUE (1500, 'Europe', NULL, 'Paris');

-- deleting the NULL values 

DELETE FROM dim_location
WHERE country IS NULL; 

-- giving a temporary name to the column "international_students"

SELECT international_students AS "IS Number"
 FROM fact_table ;
 
 
SELECT PK_Fact_University,
SUM(faculty_count)
FROM fact_table
GROUP BY PK_Fact_University;



 




