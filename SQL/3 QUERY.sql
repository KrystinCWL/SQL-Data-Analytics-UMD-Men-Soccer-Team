USE BUDT702_Project_0502_10

-- Q1. Who won the game in 2022?
SELECT s.schoolFullName, m.gameDate, r.gameResults
FROM [Football.School] s
JOIN [Football.GameReport] r ON s.schoolId = r.schoolId
JOIN [Football.Game] m ON r.gameId = m.gameId
WHERE YEAR(m.gameDate) = '2022' AND r.gameResults = 'W';

-- Q2. How many goals did UMD score in all game of 2023?
SELECT ar.totalGoals AS 'Total Goals'
FROM [Football.AnnualReport] ar
    JOIN [Football.School] s ON ar.schoolId = s.schoolId
WHERE s.schoolAbbreviation = 'UMD' AND ar.annualReportYear = '2023'

-- Q3. What is the details of the Top 3 attendance competition?
SELECT TOP 3 g.gameId, g.gameDate, g.gameCity, g.gameAttend,
       s1.schoolFullName AS Team1,
       s2.schoolFullName AS Team2
FROM [Football.Game] g
JOIN [Football.Play] p ON g.gameId = p.gameId
JOIN [Football.School] s1 ON p.schoolId1 = s1.schoolId
JOIN [Football.School] s2 ON p.schoolId2 = s2.schoolId
ORDER BY g.gameAttend DESC;

-- Q4. What was the shotRate for UMD in the game against Michigan?
SELECT r.gameReportId, r.shotRate
FROM [Football.GameReport] r
	JOIN [Football.Play] p ON r.gameId = p.gameId
	JOIN [Football.School] s ON r.schoolId = s.schoolId
WHERE s.schoolAbbreviation = 'UMD' AND p.schoolId1='S001' AND p.schoolId2 = 'S002'