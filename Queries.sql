--one line comments are ignored

--GROUP 1
/*1;1;23;
Select all records from table Driver order by desc birthdate year .*/
SELECT *
FROM Driver
ORDER BY YEAR(birthdate) DESC

/*1;2;10;
Select the name and nationality of all teams.*/
SELECT name, nationality
FROM Team 
ORDER BY nationality

/*1;3;1;
Select minimum time of a fastest lap.*/
SELECT min(fastestLap)
FROM RaceResult

/*1;4;1;
Select the higher number of laps of a circuit*/
SELECT Max(laps)
FROM Circuit

--GROUP 2
/*2;1;2;
Select circuits with more than 60 laps and the location is Mexico City, Mexico or Monte-Carlo, Monaco*/
SELECT name
FROM Circuit
WHERE laps > 60 AND (location='Monte-Carlo, Monaco' OR location = 'Mexico City, Mexico')

/*2;2;4;
Select all teams whose nationality is not Italian or British*/
SELECT name, nationality
FROM Team
WHERE nationality NOT IN('Italian', 'British')

/*2;3;3;
Select drivers whose name or surname contains 'al'*/
SELECT firstName, lastName, nationality, birthdate
FROM Driver
WHERE firstName LIKE '%al%' or lastName LIKE '%al%' 


/*2;4;3; 
Select name and age of the teams which are italian*/
SELECT name, DATEDIFF(year, foundation, '04.12.2022') as age
FROM Team
WHERE nationality='Italian'

--GROUP 3
/*3;1;3;Select drivers who have not participate in a race in 2021*/
SELECT driverID, firstName, lastName
FROM Driver
EXCEPT (SELECT d2.driverId, firstName, lastName FROM RaceResult join Race on race.raceId=RaceResult.raceId join Driver d2 on RaceResult.driverId=d2.driverId Where Race.season = 2021)

/*3;2;3;Select drivers who have not participate in a race in 2021*/
SELECT driverID, firstName, lastName
FROM Driver
WHERE NOT EXISTS (SELECT driverId FROM RaceResult join Race on race.raceId=RaceResult.raceId Where Race.season = 2021 and RaceResult.driverId=Driver.driverId)

/*3;3;3;Select drivers who have not participate in a race in 2021*/
SELECT driverID, firstName, lastName
FROM Driver
WHERE driverId != ALL (SELECT driverId FROM RaceResult join Race on race.raceId=RaceResult.raceId Where Race.season = 2021)

/*3;4;3;Select drivers who have not participate in a race in 2021*/
SELECT driverID, firstName, lastName
FROM Driver
WHERE driverId NOT IN (SELECT driverId FROM RaceResult join Race on race.raceId=RaceResult.raceId Where Race.season = 2021)

--GROUP 4
/*4;1;1;Select average number of laps from circuits*/
SELECT AVG(laps) 
FROM Circuit

/*4;2;20;Select numbers of dnfs of drivers in season 2022*/
SELECT Driver.firstName,Driver.lastName, sum(dnf)
from RaceResult rr1
join Driver on rr1.driverId = Driver.driverId
join Race on rr1.raceId = Race.raceId and Race.season=2022
group by Driver.driverId,Driver.firstName, Driver.lastName

/*4;3;1;Select the driver/drivers with more start position equals to 1(pole position)*/
SELECT driver.firstName,Driver.lastName, count(startPosition) as pole
from RaceResult rr1
join driver on rr1.driverId = driver.driverId
where startPosition=1
group by Driver.driverId,Driver.firstName, Driver.lastName
HAVING COUNT(startPosition) >= ALL(SELECT  count(startPosition) as pole
                                from RaceResult rr2
                                join driver on rr2.driverId = driver.driverId
                                where startPosition=1
                                group by Driver.driverId,Driver.firstName, Driver.lastName)

/*4;4;10;Select the team/teams with more fastest laps in season 2021*/

select t.name, count( t.name)
from (SELECT  team.name
        from RaceResult rr1
        join driver on rr1.driverId = driver.driverId
        join Driver_Team on Driver_Team.driverId=Driver.driverId and Driver_Team.season=2021
        join team on team.teamId = Driver_Team.teamId
        join race r1 on rr1.raceId = r1.raceId and r1.season=2021
        group by  team.name,rr1.raceId
        HAVING min(fastestLap) = (SELECT  min(fastestLap)
                                        from RaceResult rr2
                                        where rr2.raceId=rr1.raceId
                                        )
        ) t
group by t.name

--GROUP 5
/*5;1;26;Select circuits where a race has been realized*/
Select distinct Circuit.circuitId
FROM Circuit
join race on Circuit.circuitId=race.circuitId

/*5;2;26;Select circuits where a race has been realized*/
Select Circuit.circuitId
FROM Circuit
where Circuit.circuitId in (select circuitId from Race)

/*5;3;26;Select number of races in each circuit*/

select circuit.name, race.circuitId
from Race
left join circuit on circuit.circuitId=race.circuitId
group by race.circuitId, circuit.name

/*5;4;3; Select teams which nationality is British, and average age of their drivers*/
SELECT team.name, AVG(datediff(year,driver.birthdate,'02.12.2022')) as 'Age average'
FROM Driver
LEFT JOIN Driver_Team ON Driver_Team.driverId = Driver.driverId
LEFT JOIN Team ON Driver_Team.teamId = Team.teamId 
WHERE team.nationality='British'
GROUP BY team.name



--GROUP 6
/*6;1;10;Select sum of points in each race for the season 2021 of each team order descendent plus the points of fastest lap of each race*/

select  Team.name, sum(points)+(select count( t.teamId) as cont
                                            from Driver d2
                                            join Driver_Team dt2 on d2.driverId = dt2.driverId and dt2.season=2022
                                            join Team t2 on t2.teamId = dt2.teamId
                                            
                                            left join (SELECT t3.teamId
                                                    from RaceResult rr1
                                                    join Driver d3 on rr1.driverId = d3.driverId
                                                    join Driver_Team dt3 on d3.driverId = dt3.driverId and dt3.season=2022
                                                    join Team t3 on t3.teamId = dt3.teamId
                                                    join Race r1 on rr1.raceId = r1.raceId and r1.season=2022
                                                    group by  t3.teamId,rr1.raceId
                                                    HAVING min(fastestLap) = (SELECT  min(fastestLap)
                                                                                    from RaceResult rr2
                                                                                    where rr2.raceId=rr1.raceId
                                                                                    )
                                                    ) t on t2.teamId=t.teamId
                                             where t2.teamId=Team.teamId
                                            group by t2.teamId) as totalPoints
from (select driverId, raceId, startPosition, position, time, dnf, fastestLap,
    CASE
        WHEN position = 1 THEN 25
        WHEN position = 2 THEN 18
        WHEN position = 3 THEN 15
        WHEN position = 4 THEN 10
        WHEN position = 5 THEN 8
        WHEN position = 6 THEN 6
        WHEN position = 7 THEN 5
        WHEN position = 8 THEN 3
        WHEN position = 9 THEN 2
        WHEN position = 10 THEN 1
        ELSE 0
    END AS points
    from RaceResult) RaceResultPoints 
join Driver on RaceResultPoints.driverId = Driver.driverId
join Driver_Team on Driver.driverId = Driver_Team.driverId and Driver_Team.season =2022
join Team on Team.teamId = Driver_Team.teamId
join Race on RaceResultPoints.raceId = Race.raceId and Race.season=2022
group by Team.teamId, Team.name
order by totalPoints DESC

/*6;2;20;
Select sum of points in each race for the season 2021 of each driver order descendent plus the points of fastest lap of each race*/

select RaceResultPoints.driverId,  firstName, lastName, sum(points)+(select count( t.driverId) as cont
                                            from Driver d2
                                            left join (SELECT  rr1.driverId
                                                    from RaceResult rr1
                                                    
                                                    join Race r1 on rr1.raceId = r1.raceId and r1.season=2021
                                                    group by  rr1.driverId,rr1.raceId
                                                    HAVING min(fastestLap) = (SELECT  min(fastestLap)
                                                                                    from RaceResult rr2
                                                                                    where rr2.raceId=rr1.raceId
                                                                                    )
                                                    ) t on d2.driverId=t.driverId
                                             where d2.driverId=RaceResultPoints.driverId
                                            group by d2.driverId) as 'totalPoints'
from (select driverId, raceId, startPosition, position, time, dnf, fastestLap,
    CASE
        WHEN position = 1 THEN 25
        WHEN position = 2 THEN 18
        WHEN position = 3 THEN 15
        WHEN position = 4 THEN 10
        WHEN position = 5 THEN 8
        WHEN position = 6 THEN 6
        WHEN position = 7 THEN 5
        WHEN position = 8 THEN 3
        WHEN position = 9 THEN 2
        WHEN position = 10 THEN 1
        ELSE 0
    END AS points
    from RaceResult) RaceResultPoints 
join Driver d1 on RaceResultPoints.driverId = d1.driverId
join Race on RaceResultPoints.raceId = Race.raceId and Race.season=2021
group by RaceResultPoints.driverId, firstName, lastName
order by totalPoints DESC
