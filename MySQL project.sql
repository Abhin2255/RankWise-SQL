/* 1. STUDENTS TABLE 
Table: Students 
StudentID Name Age Gender Cours Marks City
e 
Interview Question 
Marks City 
Find the top 3 students from each course based on marks. 
Display: 
● StudentID 
● Name 
● Course 
● Marks 
● Rank 
Topics 
● CTE 
● PARTITION BY 
● RANK() 
WITH StudentRank AS 
( 
SELECT *, 
RANK() OVER(PARTITION BY Course ORDER BY Marks DESC) AS RankNo 
FROM Students 
) 
SELECT * 
FROM StudentRank 
WHERE RankNo <= 3; */

CREATE DATABASE project;
USE project;

CREATE TABLE Students11(
Student_id INT PRIMARY KEY,
NAME VARCHAR(50),
age INT,
gender VARCHAR(50),
course VARCHAR(50),
Mark INT,
city VARCHAR(50)
);

INSERT INTO Students11(Student_id,NAME,age,gender,course,Mark,City)VALUES
(01,'Abhin',21,'male','data Science',78,'Palakkad'),
(02,'messi',34,'male','Python',87,'Argentina'),
(03,'fathima pv',20,'female','MySQL',69,'Kozikode'),
(04,'shakira',26,'female','MySQL',88,'Colombian'),
(05,'sainora',19,'female','MySQL',89,'Malapuram');

SELECT * FROM Students11;

WITH StudentRank AS 
( 
SELECT *, 
RANK() OVER(PARTITION BY course ORDER BY Mark DESC) AS RankNo 
FROM Students11
) 
SELECT * 
FROM StudentRank 
WHERE RankNo <= 3;





