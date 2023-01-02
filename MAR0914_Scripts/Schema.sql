

CREATE TABLE Driver
    (
     driverId INTEGER NOT NULL PRIMARY KEY,
     firstName VARCHAR(30) NOT NULL ,
     lastName VARCHAR(50) NOT NULL ,
     nationality VARCHAR(20) NOT NULL ,
     birthdate DATE NOT NULL
    );

CREATE TABLE Team
    (
     teamId INTEGER NOT NULL PRIMARY KEY,
     name VARCHAR(30) NOT NULL ,
     nationality VARCHAR(20) ,
     foundation DATE NOT NULL
    );


CREATE TABLE Driver_Team
    (
     driverId INTEGER NOT NULL FOREIGN KEY REFERENCES Driver(driverId) ,
     teamId INTEGER NOT NULL FOREIGN KEY REFERENCES Team(teamId),
     season INTEGER NOT NULL 
     CONSTRAINT pk_tbl_Driver_Team  PRIMARY KEY (driverId, teamId, season)

    );
ALTER TABLE Driver_Team
ADD CONSTRAINT CHK_driver_team_season CHECK (season>=1950 AND season<=2022);

CREATE TABLE Circuit
    (
     circuitId INTEGER NOT NULL PRIMARY KEY ,
     name VARCHAR(40) NOT NULL ,
     location VARCHAR(30) ,
     laps INTEGER NOT NULL 
    );

ALTER TABLE Circuit
ADD CONSTRAINT CHK_laps CHECK (laps>=1 AND laps<=100);

CREATE TABLE Race
    (
     raceId INTEGER NOT NULL PRIMARY KEY,
     circuitId INTEGER NOT NULL FOREIGN KEY REFERENCES Circuit(circuitId),
     name VARCHAR(50) NOT NULL ,
     season INTEGER NOT NULL ,
     date DATE 
    );

ALTER TABLE Race
ADD CONSTRAINT CHK_raceseason CHECK (season>=1950 AND season<=2022);

CREATE TABLE RaceResult
    (
     driverId INTEGER NOT NULL FOREIGN KEY REFERENCES Driver(driverId),
     raceId INTEGER NOT NULL FOREIGN KEY REFERENCES Race(raceId),
     startPosition INTEGER NOT NULL ,
     position INTEGER NOT NULL ,
     time TIME ,
     dnf INTEGER NOT NULL ,
     fastestLap TIME 
     CONSTRAINT pk_tbl_RaceResult  PRIMARY KEY (driverId, raceId)

    );

ALTER TABLE RaceResult
ADD CONSTRAINT CHK_dnf CHECK (dnf=0 OR dnf=1);

ALTER TABLE RaceResult
ADD CONSTRAINT CHK_startposition CHECK (startPosition>=1 AND startPosition<=20);

ALTER TABLE RaceResult
ADD CONSTRAINT CHK_position CHECK (position>=1 AND position<=20);

ALTER TABLE RaceResult
ADD CONSTRAINT CHK_fastestLap CHECK (fastestLap>'00:00:00' );