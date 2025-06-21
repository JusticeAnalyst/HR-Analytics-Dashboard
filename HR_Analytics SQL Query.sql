select *
From HR_Analytics

--7 Analyticals and Insighful Questions for the HR Dataset using SQL along with the corresponding Queries:

--1. What is the overall attrition rate in the company?

SELECT
	ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*),2) AS AttritionRate
	FROM HR_Analytics

--2. What department has the highest attribution rate?

SELECT 
Department,
COUNT(*) AS TotalEmployees,
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*),2) AS AttritionRate
FROM HR_Analytics
GROUP BY Department
ORDER BY AttritionRate DESC

--3. What is the average monthly income by job role?

SELECT 
JobRole, 
AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM HR_Analytics
Group by JobRole
ORDER BY AvgMonthlyIncome

--4. How does attrition vary by age group?

SELECT 
AgeGroup, 
COUNT(*) AS TotalEmployees,
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*),2) AS AttritionRate
FROM HR_Analytics
GROUP BY AgeGroup
ORDER BY AttritionRate DESC

--5. What is the relationsship between job satisfaction and attrition?

SELECT 
JobSatisfaction, 
COUNT(*) AS TotalEmployees,
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*),2) AS AttritionRate
FROM HR_Analytics
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction

--6. Which employees work overtime most frequently (by department/job role)?

SELECT 
Department, JobRole,
COUNT(*) AS TotalEmployees,
COUNT(CASE WHEN OverTime = 'Yes' THEN 1 END) AS OvertimeCount,
ROUND(COUNT(CASE WHEN OverTime = 'Yes' THEN 1 END)*100.0/COUNT(*),2) AS OvertimePercentage
FROM HR_Analytics
GROUP BY Department, JobRole
ORDER BY OvertimePercentage DESC

--7. How does business travel frequency related to attrition?

SELECT 
Businesstravel,
COUNT(*) AS TotalEmployees,
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*),2) AS AttritionRate
FROM HR_Analytics
GROUP BY BusinessTravel
ORDER BY AttritionRate DESC









