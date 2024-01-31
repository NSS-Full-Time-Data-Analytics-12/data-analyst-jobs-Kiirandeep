--Q1)How many rows are in the data_analyst_jobs table? Ans -1793
SELECT COUNT(title)
FROM data_analyst_jobs;

--Q2)Write a query to look at just the first 10 rows. 
--What company is associated with the job posting on the 10th row? ANS - "ExxonMobil"
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--Q3) How many postings are in Tennessee? 

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN';

--How many are there in either Tennessee or Kentucky?

SELECT COUNT(location) 
FROM data_analyst_jobs
WHERE location = 'TN' OR  location ='KY';

--Q4) How many postings in Tennessee have a star rating above 4?

SELECT COUNT(star_rating)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

--Q5)How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Q6)Show the average star rating for companies in each state.
--The output should show the state as `state` and the average rating for the state as `avg_rating`. 
--Which state shows the highest average rating?

SELECT location AS state, ROUND(AVG(star_rating),2)AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;


--Q7)Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT DISTINCT title
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

--Q8)How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--Q9 9.	Find the name of each company and its average star rating 
--for all companies that have more than 5000 reviews across all locations. 
--How many companies are there with more that 5000 reviews across all locations?

SELECT  company, ROUND(AVG(star_rating),2)
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company;

SELECT COUNT(DISTINCT company)AS company_count_review_count_above_5K
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL;

-- Q10 Add the code to order the query in #9 from highest to lowest average star rating. 
--Which company with more than 5000 reviews across all locations in the dataset has the 
--highest star rating? What is that rating?

SELECT  company, ROUND(AVG(star_rating),2)
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY ROUND(AVG(star_rating),2) DESC;


SELECT  company, ROUND(AVG(star_rating),2)
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY AVG(star_rating) DESC
LIMIT 5;

-- Q11 Find all the job titles that contain the word ‘Analyst’. 
--How many different job titles are there?
SELECT title
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%' ;

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%' ;

--Q12)How many different job titles do not contain either the word ‘Analyst’ or the word 
--‘Analytics’? What word do these positions have in common? ANS -'Tableau'

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

-- **BONUS**You want to understand which jobs requiring SQL are hard to fill.
--Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- Disregard any postings where the domain is NULL. 
-- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top.
-- Which three industries are in the top 4 on this list? 
--How many jobs have been listed for more than 3 weeks for each of the top 4?

--A)
SELECT COUNT(domain) --skill, days_since_posting
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND skill NOT ILIKE '%NoSQL%' AND days_since_posting > 21 AND domain IS NOT NULL;


SELECT domain, COUNT(domain) AS hard_to_fill
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND skill NOT ILIKE '%NoSQL%' AND days_since_posting > 21 AND domain IS NOT NULL
GROUP BY domain
ORDER BY hard_to_fill DESC;

SELECT domain, COUNT(domain) AS hard_to_fill
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND skill NOT ILIKE '%NoSQL%' AND days_since_posting > 21 AND domain IS NOT NULL
GROUP BY domain
ORDER BY hard_to_fill DESC
LIMIT 4;






--ADDITIONAL: which is the most common domain for with the jobs listed

SELECT domain,COUNT(domain)
FROM data_analyst_jobs
GROUP BY domain 
ORDER BY COUNT(domain)DESC;

--ADDITIONAL: What is tHE most common skill.

SELECT skill,COUNT(skill)
FROM data_analyst_jobs
GROUP BY skill 
ORDER BY COUNT(skill)DESC;

