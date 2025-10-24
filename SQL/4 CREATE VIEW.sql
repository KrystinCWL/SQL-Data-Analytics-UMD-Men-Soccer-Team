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