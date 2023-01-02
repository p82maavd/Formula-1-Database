CREATE DATABASE f1database;
use f1database;

CREATE TABLE Driver
    (
     driverId int NOT NULL PRIMARY KEY,
     firstName VARCHAR(30) NOT NULL ,
     lastName VARCHAR(50) NOT NULL ,
     nationality VARCHAR(20) NOT NULL ,
     birthdate DATE NOT NULL 
    );

CREATE TABLE Team
    (
     teamId int NOT NULL PRIMARY KEY,
     name VARCHAR(30) NOT NULL ,
     nationality VARCHAR(20) ,
     foundation DATE NOT NULL 
    );


CREATE TABLE Driver_Team
    (
     driverId int NOT NULL ,  
     teamId int NOT NULL ,
     season int NOT NULL , 
     FOREIGN KEY(driverId) REFERENCES Driver(driverId) ,
     FOREIGN KEY(teamId) REFERENCES Team(teamId),
     CONSTRAINT pk_tbl_Driver_Team  PRIMARY KEY (driverId, teamId, season)

    );
ALTER TABLE Driver_Team
ADD CONSTRAINT CHK_driver_team_season CHECK (season>=1950 AND season<=2022);

CREATE TABLE Circuit
    (
     circuitId int NOT NULL PRIMARY KEY ,
     name VARCHAR(40) NOT NULL ,
     location VARCHAR(30) ,
     laps int NOT NULL 
    );

ALTER TABLE Circuit
ADD CONSTRAINT CHK_laps CHECK (laps>=1 AND laps<=100);

CREATE TABLE Race
    (
     raceId int NOT NULL PRIMARY KEY,
     circuitId int NOT NULL,
     name VARCHAR(50) NOT NULL ,
     season int NOT NULL ,
     date DATE NOT NULL,
     FOREIGN KEY(circuitId) REFERENCES Circuit(circuitId)
     
    );

ALTER TABLE Race
ADD CONSTRAINT CHK_raceseason CHECK (season>=1950 AND season<=2022);

CREATE TABLE RaceResult
    (
     driverId int NOT NULL,
     raceId int NOT NULL,
     startPosition int NOT NULL ,
     position int NOT NULL ,
     time TIME ,
     dnf int NOT NULL ,
     fastestLap TIME ,
     FOREIGN KEY(driverId) REFERENCES Driver(driverId),
     FOREIGN KEY(raceId) REFERENCES Race(raceId),  
     CONSTRAINT pk_tbl_RaceResult PRIMARY KEY (driverId, raceId)

    );

ALTER TABLE RaceResult
ADD CONSTRAINT CHK_dnf CHECK (dnf=0 OR dnf=1);

ALTER TABLE RaceResult
ADD CONSTRAINT CHK_startposition CHECK (startPosition>=1 AND startPosition<=20);

ALTER TABLE RaceResult
ADD CONSTRAINT CHK_position CHECK (position>=1 AND position<=20);

ALTER TABLE RaceResult
ADD CONSTRAINT CHK_fastestLap CHECK (fastestLap>'00:00:00' );
