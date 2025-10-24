USE BUDT702_Project_0502_10

-- SQL drop tables:

DROP TABLE IF EXISTS [Football.Play];
DROP TABLE IF EXISTS [Football.GameReport];
DROP TABLE IF EXISTS [Football.Game];
DROP TABLE IF EXISTS [Football.AnnualReport];
DROP TABLE IF EXISTS [Football.School];

--SQL create tables:

CREATE TABLE [Football.School] (
	schoolId CHAR(4) NOT NULL,
	schoolAbbreviation VARCHAR(10),
	schoolFullName VARCHAR(50),
	schoolState CHAR(2),
	CONSTRAINT pk_Football_School_schoolId PRIMARY KEY (schoolId) );

CREATE TABLE [Football.AnnualReport] (
	annualReportId CHAR(5) NOT NULL,
	schoolId CHAR(4) NOT NULL,
	annualReportYear CHAR(4),
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
	CONSTRAINT pk_Football_AnnualReport_reportId PRIMARY KEY (annualReportId),
	CONSTRAINT fk_AnnualReport_schoolId FOREIGN KEY (schoolId)
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
	gameId CHAR(4) NOT NULL,
	schoolId CHAR(4) NOT NULL,
	gameResults CHAR(1),
	gameGoals INT,
	gameAssists INT,
	shotCount INT,
	shotRate DECIMAL(4, 3),
	saveCount INT,
	saveRate DECIMAL(4, 3),
	gameYellowCard INT,
	gameRedCard INT,
	CONSTRAINT pk_Football_GameReport_gameId_gameReportId PRIMARY KEY (gameId, gameReportId),
	CONSTRAINT fk_GameReport_gameId FOREIGN KEY (gameId)
		REFERENCES [Football.Game] (gameId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_GameReport_schoolId FOREIGN KEY (schoolId)
		REFERENCES [Football.School] (schoolId)
		ON DELETE CASCADE ON UPDATE CASCADE );

CREATE TABLE [Football.Play] (
	schoolId1 CHAR(4) NOT NULL,
	schoolId2 CHAR(4) NOT NULL,
	gameId CHAR(4) NOT NULL,
	CONSTRAINT pk_Football_Play_schoolId_gameId PRIMARY KEY (schoolId1, schoolId2, gameId),
	CONSTRAINT fk_Play_schoolId1 FOREIGN KEY (schoolId1)
		REFERENCES [Football.School] (schoolId)
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Play_schoolId2 FOREIGN KEY (schoolId2)
		REFERENCES [Football.School] (schoolId)
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Play_gameId FOREIGN KEY (gameId)
		REFERENCES [Football.Game] (gameId)
		ON DELETE NO ACTION ON UPDATE CASCADE);