---Test to see if data set was imported 
SELECT * 
FROM tournament  

---- list of all teams that have won from 1985 to 2016
SELECT Game_date, winning_seed, winner 
FROM tournament 
WHERE round = 'National Championship'

--- villanova is the lowest seed to win the torunament from 1985 
SELECT Game_date, winning_seed, winner 
FROM tournament 
WHERE round = 'National Championship'
ORDER BY winning_seed DESC;

---what team has won the most 
SELECT winner, COUNT(winner)
FROM tournament 
WHERE round = 'National Championship' 
GROUP BY winner 
order by COUNT(winner) DESC;


---Top 5 teams 
SELECT winner AS "School", COUNT(winner) AS "Chmapionships"
FROM tournament 
WHERE round = 'National Championship' 
GROUP BY winner 
order by COUNT(winner) DESC
LIMIT 5; 

--- Winningest teams 
SELECT winner AS "School", Count(winner) AS "Wins"
FROM tournament 
GROUP BY winner 
ORDER BY COUNT(winner) DESC;

--- top 10 winningest 
SELECT winner AS "School", Count(winner) AS "Wins"
FROM tournament 
GROUP BY winner 
ORDER BY COUNT(winner) DESC
LIMIT 10; 

---losingest team 
SELECT loser AS "School", Count(loser) AS "Loses"
FROM tournament 
GROUP BY loser 
ORDER BY COUNT(winner) DESC; 

--- Top 10 losingest team 
SELECT loser AS "School", Count(loser) AS "Loses"
FROM tournament 
GROUP BY loser 
ORDER BY COUNT(winner) DESC 
LIMIT 10; 

---- Largest Score diffrence during a national championship 
SELECT game_date, Winner, loser, (winning_score-losing_score) AS difference 
FROM tournament 
WHERE round = 'National Championship' 
ORDER BY (winning_score-losing_score) DESC;  

----Overtime games played   
SELECT COUNT(game_date)
FROM tournament 
WHERE overtime IS NOT NULL; 

---total games played to 2016
SELECT COUNT(game_date) AS "Total Games Played"
FROM tournament;  

----seeds and wins 
SELECT winning_seed, COUNT(winning_seed) AS "Wins"
FROM tournament 
GROUP BY winning_seed
ORDER BY winning_seed;

----test window fucntion
SELECT game_date, winning_seed, winner, winning_score,
      AVG(winning_score) OVER 
	  (ORDER BY  winning_seed) AS running_avg
  FROM Tournament 
  WHERE round = 'National Championship'  
  
--- test partition 
SELECT game_date, winning_seed, winner, winning_score,
      AVG(winning_score) OVER 
	  (PARTITION BY winning_score ORDER BY  winning_seed) AS running_avg
  FROM Tournament 
  WHERE round = 'National Championship'  
  
--- Total Points scored 
SELECT SUM(winning_score+losing_score) AS "Total Points Scored"
FROM tournament;


  
