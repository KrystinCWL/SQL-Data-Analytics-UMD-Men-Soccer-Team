USE BUDT702_Project_0502_10

-- SQL drop tables:
DROP TABLE IF EXISTS [Football.Record];
DROP TABLE IF EXISTS [Football.GameReport];
DROP TABLE IF EXISTS [Football.Game];
DROP TABLE IF EXISTS [Football.AnnualStatistic];
DROP TABLE IF EXISTS [Football.School];


USE BUDT702_Project_0502_10

--SQL create tables:

CREATE TABLE [Football.School] (
	schoolId CHAR(4) NOT NULL,
	schoolAbbreviation VARCHAR(10),
	schoolFullName VARCHAR(50),
	schoolState CHAR(2),
	CONSTRAINT pk_Football_School_schoolId PRIMARY KEY (schoolId) );

CREATE TABLE [Football.AnnualStatistic] (
	annualStatisticId CHAR(5) NOT NULL,
	schoolId CHAR(4) NOT NULL,
	annualStatisticYear CHAR(4),
	totalWins INT,
	totalLosses INT,
	totalDraws INT,
	totalGoals INT,
	totalFails INT,
	totalShots INT,
	totalSaves INT,
	totalAssists INT,
	totalCornerKicks INT,
	numberOfYellowCards INT,
	numberOfRedCards INT,
	CONSTRAINT pk_Football_AnnualStatistic_annualStatisticId PRIMARY KEY (annualStatisticId),
	CONSTRAINT fk_AnnualStatistic_schoolId FOREIGN KEY (schoolId)
		REFERENCES [Football.School] (schoolId)
		ON DELETE NO ACTION ON UPDATE CASCADE); 

CREATE TABLE [Football.Game] (
	gameId CHAR(4) NOT NULL,
	gameDate DATE,
	gameState CHAR(2),
	gameCity VARCHAR(20),
	gameAttend INT,
	CONSTRAINT pk_Football_Game_gameId PRIMARY KEY (gameId) ); 


CREATE TABLE [Football.GameReport] (
	gameReportId CHAR(5) NOT NULL,
	schoolId CHAR(4) NOT NULL,
	gameGoals INT,
	gameAssists INT,
	shotCount INT,
	shotRate DECIMAL(4, 3),
	saveCount INT,
	saveRate DECIMAL(4, 3),
	gameYellowCard INT,
	gameRedCard INT,
	CONSTRAINT pk_Football_GameReport_gameReportId PRIMARY KEY (gameReportId) ,
	CONSTRAINT fk_GameReport_schoolId FOREIGN KEY (schoolId)
		REFERENCES [Football.School] (schoolId)
		ON DELETE NO ACTION ON UPDATE CASCADE );

CREATE TABLE [Football.Record] (
	gameId CHAR(4) NOT NULL,
	gameReportIdUMD CHAR(5) NOT NULL,
	gameReportIdOpponent CHAR(5) NOT NULL,
	gameResultsUMD CHAR(1)
	CONSTRAINT pk_Football_Record_gameId_gameReportIdUMD_gameReportIdOpponent PRIMARY KEY (gameId, gameReportIdUMD, gameReportIdOpponent),
	CONSTRAINT fk_Record_gameId FOREIGN KEY (gameId)
		REFERENCES [Football.Game] (gameId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Record_gameReportIdUMD FOREIGN KEY (gameReportIdUMD)
		REFERENCES [Football.gameReport] (gameReportId)
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Record_gameReportIdOpponent FOREIGN KEY (gameReportIdOpponent)
		REFERENCES [Football.gameReport] (gameReportId)
		ON DELETE NO ACTION ON UPDATE NO ACTION);


USE BUDT702_Project_0502_10

--SQL insert data:

INSERT INTO [Football.School]VALUES
	('S001', 'UMD', 'University of Maryland', 'MD'),
	('S002', 'Umich', 'University of Michigan', 'MI');

INSERT INTO [Football.AnnualStatistic] VALUES
	('AS001', 'S001', '2024', 5, 1, 4, 17, 127, 115, 27, 18, 60, 16, 0),
	('AS002', 'S001', '2023', 4, 8, 3, 20, 179, 172, 42, 28, 89, 27, 1),
	('AS003', 'S001', '2022', 11, 4, 5, 39, 235, 238, 58, 45, 108, 36, 1),
	('AS004', 'S001', '2021', 12, 4, 2, 29, 181, 256, 50, 30, 89, 22, 1),
	('AS005', 'S001', '2020', 4, 5, 2, 13, 115, 129, 35, 9, 53, 18, 0),
	('AS006', 'S001', '2019', 11, 8, 2, 28, 216, 234, 75, 23, 136, 25, 1),
	('AS007', 'S002', '2024', 5, 0, 4, 15, 103, 86, 25, 21, 24, 29, 0),
	('AS008', 'S002', '2023', 5, 6, 7, 23, 193, 170, 62, 19, 90, 36, 2),
	('AS009', 'S002', '2022', 4, 10, 3, 19, 196, 222, 56, 17, 100, 32, 0),
	('AS010', 'S002', '2021', 8, 7, 3, 23, 230, 233, 59, 22, 107, 29, 1),
	('AS011', 'S002', '2020', 6, 4, 1, 17, 135, 124, 29, 18, 62, 19, 2),
	('AS012', 'S002', '2019', 11, 5, 6, 32, 264, 281, 48, 40, 140, 31, 0);

INSERT INTO [Football.Game] VALUES
	('G001', '2023-09-14', 'MD', 'College Park', 2637),
	('G002', '2022-09-16', 'MI', 'Ann Arbor', 2200),
	('G003', '2021-09-17', 'MD', 'College Park', 3302),
	('G004', '2021-03-11', 'MI', 'Legacy Center', 15),
	('G005', '2019-11-03', 'MD', 'College Park', 0);

INSERT INTO [Football.GameReport] VALUES
	('GR001', 'S001', 2, 3, 15, 0.133, 0, 0.000, 3, 1),
	('GR002', 'S001', 2, 1, 15, 0.133, 5, 0.833, 3, 0),
	('GR003', 'S001', 2, 2, 16, 0.125, 1, 0.500, 1, 0),
	('GR004', 'S001', 2, 2, 9,  0.222, 4, 0.800, 1, 0),
	('GR005', 'S001', 2, 3, 9,  0.222, 3, 0.429, 0, 0),
	('GR006', 'S002', 2, 3, 6,  0.333, 3, 0.600, 3, 0),
	('GR007', 'S002', 1, 0, 15, 0.067, 2, 0.500, 2, 0),
	('GR008', 'S002', 1, 1, 6,  0.167, 8, 0.800, 2, 0),
	('GR009', 'S002', 1, 1, 11, 0.091, 3, 0.600, 1, 1),
	('GR010', 'S002', 4, 2, 16, 0.250, 3, 0.600, 0, 0);


INSERT INTO [Football.Record] VALUES
	('G001','GR001', 'GR006', 'T'),
	('G002','GR002', 'GR007', 'W'),
	('G003','GR003', 'GR008', 'W'),
	('G004','GR004', 'GR009', 'W'),
	('G005','GR005', 'GR010', 'L');


USE BUDT702_Project_0502_10

--SQL query:

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


USE BUDT702_Project_0502_10

--SQL create view:

DROP VIEW IF EXISTS gameResultUMDUMich
GO
CREATE VIEW gameResultUMDUMich AS
    SELECT g.gameDate AS 'Date', g.gameCity AS 'City', s2.schoolFullName AS 'Opponent School', 
           r.gameResultsUMD AS 'UMD Result'
    FROM [Football.Record] r
    JOIN [Football.Game] g ON r.gameId = g.gameId
    JOIN [Football.GameReport] gr1 ON r.gameReportIdUMD = gr1.gameReportId
    JOIN [Football.GameReport] gr2 ON r.gameReportIdOpponent = gr2.gameReportId
    JOIN [Football.School] s1 ON gr1.schoolId = s1.schoolId
    JOIN [Football.School] s2 ON gr2.schoolId = s2.schoolId
    WHERE s1.schoolAbbreviation = 'UMD'
GO
SELECT *
FROM gameResultUMDUMich