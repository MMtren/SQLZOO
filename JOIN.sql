--1.show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid ,player FROM goal 
  WHERE teamid = 'GER';

--2.Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2 FROM game
  WHERE id = 1012;

--3.show the player, teamid, stadium and mdate for every German goal.
SELECT player,teamid, stadium, mdate  FROM game JOIN goal ON (id=matchid)
  WHERE teamid='Ger';

--4.Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player FROM game JOIN goal ON (id=matchid)
  WHERE player like 'Mario%';

--5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid,coach, gtime FROM goal JOIN eteam ON teamid=id
  WHERE gtime<=10;
--6.List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname FROM game JOIN eteam ON (team1=eteam.id)
  WHERE coach = 'Fernando Santos';

--7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player FROM goal JOIN game ON id=matchid
  WHERE stadium = 'National Stadium, Warsaw';

--8.Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player FROM game JOIN goal ON matchid = id 
    WHERE (team1='Ger' OR team2='Ger') AND (teamid != 'GER');

--9.Show teamname and the total number of goals scored.
SELECT teamname, COUNT(teamid) FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname;

--10.Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(teamid) FROM goal JOIN game on id = matchid
  GROUP BY stadium

--11.For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid,mdate, COUNT(teamid) FROM game JOIN goal ON matchid = id 
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid

--12.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(teamid) FROM game JOIN goal ON id=matchid
WHERE teamid='GER'
GROUP BY matchid

--13.List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
SELECT mdate, team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2   
        FROM game LEFT JOIN goal ON (id = matchid)
        GROUP BY mdate,team1,team2
        ORDER BY mdate, matchid, team1, team2;





