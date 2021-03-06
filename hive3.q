DROP TABLE IF EXISTS batting;
CREATE EXTERNAL TABLE IF NOT EXISTS batting(id STRING, year INT, team STRING, league STRING, games INT, ab INT, runs INT, hits INT, 
    doubles INT, triples INT, homeruns INT, rbi INT, sb INT, cs INT, walks INT, strikeouts INT, ibb INT, hbp INT, sh INT, sf INT, gidp INT) 
    ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION '/user/maria_dev/hivetest/batting';

DROP VIEW IF EXISTS final;
CREATE VIEW IF NOT EXISTS final AS SELECT id, SUM(doubles + triples + homeruns) AS MaxEbh FROM batting 
    WHERE year > 1979 AND year < 1990 GROUP BY id ORDER BY MaxEbh DESC;

SELECT id FROM final LIMIT 1;