Create database netflix_project

CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);

SELECT * FROM [dbo].[netflix_titles_data]
drop table [dbo].[netflix]

SELECT TOP 10 * FROM [dbo].[netflix_titles_data]

--1 Query Total no of rows
select count(*) from [dbo].[netflix_titles_data]

--2 Query Movies vs TV shows
Select type, count(*) AS Total
from [dbo].[netflix_titles_data]
group by type

--3 Query Null Values Check
SELECT *
FROM [dbo].[netflix_titles_data]
WHERE director IS NULL
   OR country IS NULL
   OR cast IS NULL;

--4 Query Top Countries Producing Netflix Content
select Country, count(*) as Total 
from [dbo].[netflix_titles_data]
where Country is not null
group by Country 
order by Total Desc

--5 Query Content Released Each Year
Select release_year, count(*) as Total 
from [dbo].[netflix_titles_data]
group by release_year
order by release_year

--6 Query Most Popular Ratings
SELECT rating, COUNT(*) AS total
FROM [dbo].[netflix_titles_data]
where rating is not null
GROUP BY rating
ORDER BY total DESC;

--7 Query Top Genres on Netflix
SELECT listed_in, COUNT(*) AS total
FROM [dbo].[netflix_titles_data]
GROUP BY listed_in
ORDER BY total DESC;

--8 Query 1️⃣ Top 10 Directors on Netflix
SELECT top 10 director, COUNT(*) AS total_content
FROM [dbo].[netflix_titles_data]
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_content DESC;

--9 Query  Longest Movies on Netflix
SELECT TOP 10 title, duration
FROM [dbo].[netflix_titles_data]
WHERE type = 'Movie'
ORDER BY duration DESC;

--10 Query Content Added Per Year
SELECT YEAR(CONVERT(date, date_added)) AS year_added,
COUNT(*) AS total_content
FROM [dbo].[netflix_titles_data]
WHERE date_added IS NOT NULL
GROUP BY YEAR(CONVERT(date, date_added))
ORDER BY year_added;