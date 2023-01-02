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


INSERT INTO Driver Values(1,'Alexander','Albon','Thai','1996-03-23');
INSERT INTO Driver Values(2,'Fernando','Alonso','Spanish','1981-07-29');
INSERT INTO Driver Values(3,'Valtteri','Bottas','Finnish','1989-08-28');
INSERT INTO Driver Values(4,'Pierre','Gasly','French','1996-02-07');
INSERT INTO Driver Values(5,'Lewis','Hamilton','British','1985-01-07');
INSERT INTO Driver Values(6,'Nicholas','Latifi','Canadian','1995-06-29');
INSERT INTO Driver Values(7,'Charles','Leclerc','Monegasque','1997-10-16');
INSERT INTO Driver Values(8,'Kevin','Magnussen','Danish','1992-10-05');
INSERT INTO Driver Values(9,'Lando','Norris','British','1999-11-13');
INSERT INTO Driver Values(10,'Esteban','Ocon','French','1996-09-17');
INSERT INTO Driver Values(11,'Sergio','Pérez','Mexican','1990-01-26');
INSERT INTO Driver Values(12,'Daniel','Ricciardo','Australian','1989-07-01');
INSERT INTO Driver Values(13,'George','Russell','British','1998-02-15');
INSERT INTO Driver Values(14,'Carlos','Sainz','Spanish','1994-09-01');
INSERT INTO Driver Values(15,'Mick','Schumacher','German','1999-03-22');
INSERT INTO Driver Values(16,'Lance','Stroll','Canadian','1998-10-29');
INSERT INTO Driver Values(17,'Yuki','Tsunoda','Japanese','2000-05-11');
INSERT INTO Driver Values(18,'Max','Verstappen','Dutch','1997-09-30');
INSERT INTO Driver Values(19,'Sebastian','Vettel','German','1987-07-03');
INSERT INTO Driver Values(20,'Guanyu','Zhou','Chinese','1999-05-30');
INSERT INTO Driver Values(21,'Kimi','Raikkonen','Finnish','1979-10-17');
INSERT INTO Driver Values(22,'Antonio','Giovinazzi','Italian','1993-12-14');
INSERT INTO Driver Values(23,'Nikita','Mazepin','Russian','1999-03-02');

INSERT INTO Team Values(1,'Alfa Romeo','Italian','1950-03-23');
INSERT INTO Team Values(2,'AlphaTauri','Italian','2020-03-23');
INSERT INTO Team Values(3,'Alpine F1','French','2021-03-23');
INSERT INTO Team Values(4,'Aston Martin','British','1959-03-23');
INSERT INTO Team Values(5,'Ferrari','Italian','1950-03-23');
INSERT INTO Team Values(6,'Haas F1','American','2016-03-23');
INSERT INTO Team Values(7,'McLaren','British','1968-03-23');
INSERT INTO Team Values(8,'Mercedes','German','1954-03.23');
INSERT INTO Team Values(9,'Red Bull','Austrian','2005-03-23');
INSERT INTO Team Values(10,'Williams','British','1975-03-23');

INSERT INTO Driver_Team VALUES(3,1,2022);
INSERT INTO Driver_Team VALUES(20,1,2022);
INSERT INTO Driver_Team VALUES(17,2,2022);
INSERT INTO Driver_Team VALUES(4,2,2022);
INSERT INTO Driver_Team VALUES(2,3,2022);
INSERT INTO Driver_Team VALUES(10,3,2022);
INSERT INTO Driver_Team VALUES(16,4,2022);
INSERT INTO Driver_Team VALUES(19,4,2022);
INSERT INTO Driver_Team VALUES(14,5,2022);
INSERT INTO Driver_Team VALUES(7,5,2022);
INSERT INTO Driver_Team VALUES(8,6,2022);
INSERT INTO Driver_Team VALUES(15,6,2022);
INSERT INTO Driver_Team VALUES(9,7,2022);
INSERT INTO Driver_Team VALUES(12,7,2022);
INSERT INTO Driver_Team VALUES(5,8,2022);
INSERT INTO Driver_Team VALUES(13,8,2022);
INSERT INTO Driver_Team VALUES(11,9,2022);
INSERT INTO Driver_Team VALUES(18,9,2022);
INSERT INTO Driver_Team VALUES(1,10,2022);
INSERT INTO Driver_Team VALUES(6,10,2022);
INSERT INTO Driver_Team VALUES(21,1,2021);
INSERT INTO Driver_Team VALUES(22,1,2021);
INSERT INTO Driver_Team VALUES(17,2,2021);
INSERT INTO Driver_Team VALUES(4,2,2021);
INSERT INTO Driver_Team VALUES(2,3,2021);
INSERT INTO Driver_Team VALUES(10,3,2021);
INSERT INTO Driver_Team VALUES(16,4,2021);
INSERT INTO Driver_Team VALUES(19,4,2021);
INSERT INTO Driver_Team VALUES(14,5,2021);
INSERT INTO Driver_Team VALUES(7,5,2021);
INSERT INTO Driver_Team VALUES(23,6,2021);
INSERT INTO Driver_Team VALUES(15,6,2021);
INSERT INTO Driver_Team VALUES(9,7,2021);
INSERT INTO Driver_Team VALUES(12,7,2021);
INSERT INTO Driver_Team VALUES(5,8,2021);
INSERT INTO Driver_Team VALUES(3,8,2021);
INSERT INTO Driver_Team VALUES(11,9,2021);
INSERT INTO Driver_Team VALUES(18,9,2021);
INSERT INTO Driver_Team VALUES(13,10,2021);
INSERT INTO Driver_Team VALUES(6,10,2021);

INSERT INTO Circuit Values(1,'Bahrain International','Sakhir, Bahrain',57);
INSERT INTO Circuit Values(2,'Jeddah Street','Jeddah, Saudi Arabia',50);
INSERT INTO Circuit Values(3,'Albert Park Grand Prix','Melbourne, Australi',58);
INSERT INTO Circuit Values(4,'Autodromo Enzo e Dino Ferrari','Imola, Italy',63);
INSERT INTO Circuit Values(5,'Miami International Autodrome','Miami, USA',57);
INSERT INTO Circuit Values(6,'Circuit de Barcelona-Catalunya','Montmelo, Spain',66);
INSERT INTO Circuit Values(7,'Circuit de Monaco','Monte-Carlo, Monaco',78);
INSERT INTO Circuit Values(8,'Baku City Circuit','Bazu, Azerbaijan',57);
INSERT INTO Circuit Values(9,'Circuit Gilles Villeneuve','Montreal, Canada',70);
INSERT INTO Circuit Values(10,'Silverstone Circuit','Silverstone, UK',52);
INSERT INTO Circuit Values(11,'Red Bull Ring','Spielburg, Austria',71);
INSERT INTO Circuit Values(12,'Circuit Paul Ricard','Le Castellet, France',53);
INSERT INTO Circuit Values(13,'Hungaroring','Budapest, Hungary',70);
INSERT INTO Circuit Values(14,'Circuit de Spa-Francorchamps','Spa, Belgium',44);
INSERT INTO Circuit Values(15,'Circuit Park Zandvoort','Zandvoort, Netherlands',72);
INSERT INTO Circuit Values(16,'Autodromo Nazionale di Monza','Monza, Italy',53);
INSERT INTO Circuit Values(17,'Marina Bay Street','Marina Bay, Singapore',61);
INSERT INTO Circuit Values(18,'Suzuka Circuit','Suzuka, Japan',53);
INSERT INTO Circuit Values(19,'Circuit of the Americas','Austin, USA',56);
INSERT INTO Circuit Values(20,'Autodromo Hermanos Rodriguez','Mexico City, Mexico',71);
INSERT INTO Circuit Values(21,'Autodromo Jose Carlos Pace','Sao Paulo, Brazil',71);
INSERT INTO Circuit Values(22,'Yas Marina Circuit','Abu Dhabi, UAE',55);
INSERT INTO Circuit Values(23,'Autodromo Internacional do Algarve','Portimao, Portugal',54);
INSERT INTO Circuit Values(24,'Istambul Park','Istanbul, Turkey',58);
INSERT INTO Circuit Values(25,'Losail International Circuit','Al Daayen, Qatar',54);
INSERT INTO Circuit Values(26,'Sochi Autodrom','Sochi, Russia',62);

INSERT INTO Race Values(1,1,'Bahrain Grand Prix',2021,'2021-03-28');
INSERT INTO Race Values(2,4,'Emilia Romagna Grand Prix',2021,'2021-04-18');
INSERT INTO Race Values(3,23,'Portuguese Grand Prix',2021,'2021-05-02');
INSERT INTO Race Values(4,6,'Spanish Grand Prix',2021,'2021-05-09');
INSERT INTO Race Values(5,7,'Monaco Grand Prix',2021,'2021-05-23');
INSERT INTO Race Values(6,8,'Azerbaijan Grand Prix',2021,'2021-06-06');
INSERT INTO Race Values(7,12,'French Grand Prix',2021,'2021-06-20');
INSERT INTO Race Values(8,11,'Styrian Grand Prix',2021,'2021-06-27');
INSERT INTO Race Values(9,11,'Austrian Grand Prix',2021,'2021-07-04');
INSERT INTO Race Values(10,10,'British Grand Prix',2021,'2021-07-18');
INSERT INTO Race Values(11,13,'Hungarian Grand Prix',2021,'2021-08-01');
INSERT INTO Race Values(12,14,'Belgian Grand Prix',2021,'2021-08-29');
INSERT INTO Race Values(13,15,'Dutch Grand Prix',2021,'2021-09-05');
INSERT INTO Race Values(14,16,'Italian Grand Prix',2021,'2021-09-12');
INSERT INTO Race Values(15,26,'Russian Grand Prix',2021,'2021-09-26');
INSERT INTO Race Values(16,24,'Turkish Grand Prix',2021,'2021-10-10');
INSERT INTO Race Values(17,19,'United States Grand Prix',2021,'2021-10-24');
INSERT INTO Race Values(18,20,'Mexico City Grand Prix',2021,'2021-11-07');
INSERT INTO Race Values(19,21,'Brazilian Grand Prix',2021,'2021-11-14');
INSERT INTO Race Values(20,25,'Qatar Grand Prix',2021,'2021-11-21');
INSERT INTO Race Values(21,2,'Saudi Arabian Grand Prix',2021,'2021-12-05');
INSERT INTO Race Values(22,22,'Abu Dhabi Grand Prix',2021,'2021-12-12');
INSERT INTO Race Values(23,1,'Bahrain Grand Prix',2022,'2022-03-20');
INSERT INTO Race Values(24,2,'Saudi Arabian Grand Prix',2022,'2022-03-27');
INSERT INTO Race Values(25,3,'Australian Grand Prix',2022,'2022-04-10');
INSERT INTO Race Values(26,4,'Emilia Romagna Grand Prix',2022,'2022-04-24');
INSERT INTO Race Values(27,5,'Miami Grand Prix',2022,'2022-05-08');
INSERT INTO Race Values(28,6,'Spanish Grand Prix',2022,'2022-05-22');
INSERT INTO Race Values(29,7,'Monaco Grand Prix',2022,'2022-05-29');
INSERT INTO Race Values(30,8,'Azerbaijan Grand Prix',2022,'2022-06-12');
INSERT INTO Race Values(31,9,'Canadian Grand Prix',2022,'2022-06-19');
INSERT INTO Race Values(32,10,'British Grand Prix',2022,'2022-07-03');
INSERT INTO Race Values(33,11,'Austrian Grand Prix',2022,'2022-07-10');
INSERT INTO Race Values(34,12,'French Grand Prix',2022,'2022-07-24');
INSERT INTO Race Values(35,13,'Hungarian Grand Prix',2022,'2022-07-31');
INSERT INTO Race Values(36,14,'Belgian Grand Prix',2022,'2022-08-28');
INSERT INTO Race Values(37,15,'Dutch Grand Prix',2022,'2022-09-04');
INSERT INTO Race Values(38,16,'Italian Grand Prix',2022,'2022-09-11');
INSERT INTO Race Values(39,17,'Singapore Grand Prix',2022,'2022-10-02');
INSERT INTO Race Values(40,18,'Japanase Grand Prix',2022,'2022-10-09');
INSERT INTO Race Values(41,19,'UNited States Grand Prix',2022,'2022-10-23');
INSERT INTO Race Values(42,20,'Mexico City Grand Prix',2022,'2022-10-30');
INSERT INTO Race Values(43,21,'Brazilian Grand Prix',2022,'2022-11-13');
INSERT INTO Race Values(44,22,'Abu Dhabi Grand Prix',2022,'2022-11-20');

INSERT INTO RaceResult Values(16, 1, 1, 19, '1:28:00', 0, '1:35');
INSERT INTO RaceResult Values(5, 1, 2, 3, '1:28:02', 0, '1:20');
INSERT INTO RaceResult Values(21, 1, 3, 10, '1:28:02', 0, '1:24');
INSERT INTO RaceResult Values(3, 1, 4, 2, '1:28:02', 0, '1:28');
INSERT INTO RaceResult Values(12, 1, 5, 12, '1:28:02', 0, '1:21');
INSERT INTO RaceResult Values(14, 1, 6, 15, '1:28:04', 0, '1:38');
INSERT INTO RaceResult Values(15, 1, 7, 7, '1:28:05', 0, '1:29');
INSERT INTO RaceResult Values(18, 1, 8, 13, '1:28:05', 0, '1:24');
INSERT INTO RaceResult Values(4, 1, 9, 1, '1:28:06', 0, '1:33');
INSERT INTO RaceResult Values(19, 1, 10, 16, '1:28:08', 0, '1:26');
INSERT INTO RaceResult Values(7, 1, 11, 9, '1:28:08', 0, '1:22');
INSERT INTO RaceResult Values(17, 1, 12, 4, '1:28:09', 0, '1:21');
INSERT INTO RaceResult Values(9, 1, 13, 14, '1:28:11', 0, '1:35');
INSERT INTO RaceResult Values(11, 1, 14, 18, '1:28:13', 0, '1:27');
INSERT INTO RaceResult Values(2, 1, 15, 17, '1:28:15', 0, '1:30');
INSERT INTO RaceResult Values(6, 1, 16, 5, '1:28:15', 0, '1:39');
INSERT INTO RaceResult Values(13, 1, 17, 11, '1:28:15', 0, '1:28');
INSERT INTO RaceResult Values(22, 1, 18, 6, '1:28:15', 0, '1:38');
INSERT INTO RaceResult Values(10, 1, 19, 8, '1:28:16', 0, '1:22');
INSERT INTO RaceResult Values(23, 1, 20, 20, '1:28:16', 0, '1:27');
INSERT INTO RaceResult Values(6, 2, 1, 10, '1:31:00', 0, '1:28');
INSERT INTO RaceResult Values(19, 2, 2, 19, '1:31:02', 0, '1:35');
INSERT INTO RaceResult Values(5, 2, 3, 6, '1:31:03', 0, '1:31');
INSERT INTO RaceResult Values(4, 2, 4, 1, '1:31:05', 0, '1:39');
INSERT INTO RaceResult Values(14, 2, 5, 8, '1:31:06', 0, '1:28');
INSERT INTO RaceResult Values(2, 2, 6, 5, '1:31:07', 0, '1:37');
INSERT INTO RaceResult Values(18, 2, 7, 17, '1:31:09', 0, '1:24');
INSERT INTO RaceResult Values(3, 2, 8, 7, '1:31:09', 0, '1:23');
INSERT INTO RaceResult Values(16, 2, 9, 4, '1:31:10', 0, '1:37');
INSERT INTO RaceResult Values(13, 2, 10, 14, '1:31:11', 0, '1:28');
INSERT INTO RaceResult Values(15, 2, 11, 13, '1:31:13', 0, '1:22');
INSERT INTO RaceResult Values(10, 2, 12, 9, '1:31:14', 0, '1:33');
INSERT INTO RaceResult Values(21, 2, 13, 16, '1:31:15', 0, '1:24');
INSERT INTO RaceResult Values(22, 2, 14, 12, '1:31:15', 0, '1:38');
INSERT INTO RaceResult Values(12, 2, 15, 18, '1:31:15', 0, '1:30');
INSERT INTO RaceResult Values(11, 2, 16, 2, '1:31:15', 0, '1:32');
INSERT INTO RaceResult Values(17, 2, 17, 15, '1:31:17', 0, '1:37');
INSERT INTO RaceResult Values(9, 2, 18, 11, '1:31:19', 0, '1:33');
INSERT INTO RaceResult Values(7, 2, 19, 3, '1:31:20', 0, '1:32');
INSERT INTO RaceResult Values(23, 2, 20, 20, '1:31:20', 0, '1:22');
INSERT INTO RaceResult Values(16, 3, 1, 4, '1:20:00', 0, '1:28');
INSERT INTO RaceResult Values(13, 3, 2, 12, '1:20:01', 0, '1:29');
INSERT INTO RaceResult Values(2, 3, 3, 18, '1:20:01', 0, '1:21');
INSERT INTO RaceResult Values(9, 3, 4, 7, '1:20:02', 0, '1:30');
INSERT INTO RaceResult Values(12, 3, 5, 17, '1:20:02', 0, '1:31');
INSERT INTO RaceResult Values(21, 3, 6, 1, '1:20:02', 0, '1:23');
INSERT INTO RaceResult Values(11, 3, 7, 8, '1:20:03', 0, '1:28');
INSERT INTO RaceResult Values(7, 3, 8, 2, '1:20:04', 0, '1:38');
INSERT INTO RaceResult Values(18, 3, 9, 10, '1:20:05', 0, '1:26');
INSERT INTO RaceResult Values(19, 3, 10, 11, '1:20:06', 0, '1:30');
INSERT INTO RaceResult Values(22, 3, 11, 9, '1:20:06', 0, '1:27');
INSERT INTO RaceResult Values(6, 3, 12, 6, '1:20:06', 0, '1:21');
INSERT INTO RaceResult Values(17, 3, 13, 15, '1:20:08', 0, '1:24');
INSERT INTO RaceResult Values(3, 3, 14, 14, '1:20:08', 0, '1:36');
INSERT INTO RaceResult Values(4, 3, 15, 5, '1:20:08', 0, '1:25');
INSERT INTO RaceResult Values(10, 3, 16, 19, '1:20:10', 0, '1:20');
INSERT INTO RaceResult Values(15, 3, 17, 16, '1:20:10', 0, '1:38');
INSERT INTO RaceResult Values(5, 3, 18, 3, '1:20:11', 0, '1:38');
INSERT INTO RaceResult Values(14, 3, 19, 13, '1:20:11', 0, '1:36');
INSERT INTO RaceResult Values(23, 3, 20, 20, '1:20:11', 1, '1:30');
INSERT INTO RaceResult Values(2, 4, 1, 2, '1:29:00', 0, '1:25');
INSERT INTO RaceResult Values(17, 4, 2, 6, '1:29:02', 0, '1:36');
INSERT INTO RaceResult Values(15, 4, 3, 13, '1:29:03', 0, '1:34');
INSERT INTO RaceResult Values(13, 4, 4, 12, '1:29:05', 0, '1:29');
INSERT INTO RaceResult Values(18, 4, 5, 10, '1:29:06', 0, '1:25');
INSERT INTO RaceResult Values(9, 4, 6, 19, '1:29:06', 0, '1:32');
INSERT INTO RaceResult Values(21, 4, 7, 11, '1:29:08', 0, '1:24');
INSERT INTO RaceResult Values(14, 4, 8, 15, '1:29:09', 0, '1:32');
INSERT INTO RaceResult Values(6, 4, 9, 1, '1:29:11', 0, '1:20');
INSERT INTO RaceResult Values(12, 4, 10, 8, '1:29:12', 0, '1:28');
INSERT INTO RaceResult Values(11, 4, 11, 4, '1:29:13', 0, '1:28');
INSERT INTO RaceResult Values(5, 4, 12, 14, '1:29:13', 0, '1:35');
INSERT INTO RaceResult Values(4, 4, 13, 9, '1:29:14', 0, '1:32');
INSERT INTO RaceResult Values(19, 4, 14, 16, '1:29:15', 0, '1:34');
INSERT INTO RaceResult Values(10, 4, 15, 18, '1:29:17', 0, '1:22');
INSERT INTO RaceResult Values(3, 4, 16, 3, '1:29:17', 0, '1:28');
INSERT INTO RaceResult Values(16, 4, 17, 5, '1:29:17', 0, '1:30');
INSERT INTO RaceResult Values(7, 4, 18, 17, '1:29:18', 0, '1:22');
INSERT INTO RaceResult Values(22, 4, 19, 7, '1:29:20', 0, '1:28');
INSERT INTO RaceResult Values(23, 4, 20, 20, '1:29:22', 1, '1:24');
INSERT INTO RaceResult Values(12, 5, 1, 2, '1:33:00', 0, '1:30');
INSERT INTO RaceResult Values(17, 5, 2, 6, '1:33:00', 0, '1:34');
INSERT INTO RaceResult Values(6, 5, 3, 18, '1:33:01', 0, '1:33');
INSERT INTO RaceResult Values(21, 5, 4, 4, '1:33:03', 0, '1:38');
INSERT INTO RaceResult Values(3, 5, 5, 8, '1:33:03', 0, '1:33');
INSERT INTO RaceResult Values(7, 5, 6, 5, '1:33:05', 0, '1:34');
INSERT INTO RaceResult Values(15, 5, 7, 19, '1:33:06', 0, '1:20');
INSERT INTO RaceResult Values(4, 5, 8, 3, '1:33:07', 0, '1:32');
INSERT INTO RaceResult Values(19, 5, 9, 17, '1:33:08', 0, '1:28');
INSERT INTO RaceResult Values(11, 5, 10, 9, '1:33:08', 0, '1:25');
INSERT INTO RaceResult Values(9, 5, 11, 10, '1:33:09', 0, '1:29');
INSERT INTO RaceResult Values(16, 5, 12, 13, '1:33:11', 0, '1:35');
INSERT INTO RaceResult Values(5, 5, 13, 12, '1:33:12', 0, '1:20');
INSERT INTO RaceResult Values(2, 5, 14, 14, '1:33:13', 0, '1:37');
INSERT INTO RaceResult Values(13, 5, 15, 15, '1:33:13', 0, '1:39');
INSERT INTO RaceResult Values(14, 5, 16, 16, '1:33:14', 0, '1:30');
INSERT INTO RaceResult Values(10, 5, 17, 11, '1:33:16', 0, '1:26');
INSERT INTO RaceResult Values(22, 5, 18, 7, '1:33:18', 0, '1:33');
INSERT INTO RaceResult Values(18, 5, 19, 1, '1:33:19', 0, '1:39');
INSERT INTO RaceResult Values(23, 5, 20, 20, '1:33:19', 0, '1:23');
INSERT INTO RaceResult Values(16, 6, 1, 19, '1:33:00', 0, '1:20');
INSERT INTO RaceResult Values(6, 6, 2, 8, '1:33:00', 0, '1:33');
INSERT INTO RaceResult Values(18, 6, 3, 3, '1:33:01', 0, '1:20');
INSERT INTO RaceResult Values(12, 6, 4, 6, '1:33:01', 0, '1:22');
INSERT INTO RaceResult Values(17, 6, 5, 11, '1:33:01', 0, '1:21');
INSERT INTO RaceResult Values(5, 6, 6, 16, '1:33:03', 0, '1:30');
INSERT INTO RaceResult Values(15, 6, 7, 1, '1:33:05', 0, '1:37');
INSERT INTO RaceResult Values(21, 6, 8, 14, '1:33:06', 0, '1:33');
INSERT INTO RaceResult Values(22, 6, 9, 2, '1:33:08', 0, '1:22');
INSERT INTO RaceResult Values(2, 6, 10, 12, '1:33:09', 0, '1:30');
INSERT INTO RaceResult Values(13, 6, 11, 9, '1:33:10', 0, '1:34');
INSERT INTO RaceResult Values(11, 6, 12, 7, '1:33:10', 0, '1:36');
INSERT INTO RaceResult Values(3, 6, 13, 18, '1:33:10', 0, '1:25');
INSERT INTO RaceResult Values(19, 6, 14, 4, '1:33:10', 0, '1:33');
INSERT INTO RaceResult Values(10, 6, 15, 13, '1:33:11', 0, '1:36');
INSERT INTO RaceResult Values(4, 6, 16, 5, '1:33:13', 0, '1:22');
INSERT INTO RaceResult Values(14, 6, 17, 15, '1:33:15', 0, '1:30');
INSERT INTO RaceResult Values(9, 6, 18, 17, '1:33:16', 0, '1:38');
INSERT INTO RaceResult Values(7, 6, 19, 10, '1:33:18', 0, '1:20');
INSERT INTO RaceResult Values(23, 6, 20, 20, '1:33:19', 0, '1:30');
INSERT INTO RaceResult Values(13, 7, 1, 6, '1:32:00', 0, '1:30');
INSERT INTO RaceResult Values(21, 7, 2, 5, '1:32:01', 0, '1:22');
INSERT INTO RaceResult Values(6, 7, 3, 19, '1:32:02', 0, '1:35');
INSERT INTO RaceResult Values(9, 7, 4, 11, '1:32:04', 0, '1:29');
INSERT INTO RaceResult Values(12, 7, 5, 12, '1:32:04', 0, '1:25');
INSERT INTO RaceResult Values(16, 7, 6, 7, '1:32:06', 0, '1:22');
INSERT INTO RaceResult Values(2, 7, 7, 1, '1:32:06', 0, '1:35');
INSERT INTO RaceResult Values(11, 7, 8, 14, '1:32:08', 0, '1:35');
INSERT INTO RaceResult Values(7, 7, 9, 10, '1:32:10', 0, '1:27');
INSERT INTO RaceResult Values(14, 7, 10, 15, '1:32:10', 0, '1:28');
INSERT INTO RaceResult Values(4, 7, 11, 17, '1:32:11', 0, '1:31');
INSERT INTO RaceResult Values(22, 7, 12, 16, '1:32:11', 0, '1:24');
INSERT INTO RaceResult Values(18, 7, 13, 2, '1:32:12', 0, '1:39');
INSERT INTO RaceResult Values(5, 7, 14, 18, '1:32:12', 0, '1:28');
INSERT INTO RaceResult Values(19, 7, 15, 4, '1:32:13', 0, '1:22');
INSERT INTO RaceResult Values(15, 7, 16, 13, '1:32:13', 0, '1:32');
INSERT INTO RaceResult Values(10, 7, 17, 3, '1:32:13', 0, '1:35');
INSERT INTO RaceResult Values(3, 7, 18, 8, '1:32:15', 0, '1:38');
INSERT INTO RaceResult Values(17, 7, 19, 9, '1:32:15', 0, '1:28');
INSERT INTO RaceResult Values(23, 7, 20, 20, '1:32:16', 0, '1:36');
INSERT INTO RaceResult Values(4, 8, 1, 17, '1:25:00', 0, '1:26');
INSERT INTO RaceResult Values(16, 8, 2, 2, '1:25:01', 0, '1:24');
INSERT INTO RaceResult Values(11, 8, 3, 7, '1:25:03', 0, '1:26');
INSERT INTO RaceResult Values(19, 8, 4, 4, '1:25:04', 0, '1:37');
INSERT INTO RaceResult Values(17, 8, 5, 5, '1:25:04', 0, '1:27');
INSERT INTO RaceResult Values(22, 8, 6, 14, '1:25:05', 0, '1:32');
INSERT INTO RaceResult Values(3, 8, 7, 10, '1:25:05', 0, '1:30');
INSERT INTO RaceResult Values(13, 8, 8, 9, '1:25:07', 0, '1:34');
INSERT INTO RaceResult Values(10, 8, 9, 18, '1:25:08', 0, '1:33');
INSERT INTO RaceResult Values(7, 8, 10, 11, '1:25:09', 0, '1:38');
INSERT INTO RaceResult Values(6, 8, 11, 16, '1:25:11', 0, '1:35');
INSERT INTO RaceResult Values(14, 8, 12, 6, '1:25:12', 0, '1:20');
INSERT INTO RaceResult Values(5, 8, 13, 15, '1:25:13', 0, '1:31');
INSERT INTO RaceResult Values(21, 8, 14, 19, '1:25:15', 0, '1:24');
INSERT INTO RaceResult Values(9, 8, 15, 13, '1:25:17', 0, '1:21');
INSERT INTO RaceResult Values(12, 8, 16, 12, '1:25:18', 0, '1:30');
INSERT INTO RaceResult Values(2, 8, 17, 3, '1:25:20', 0, '1:36');
INSERT INTO RaceResult Values(18, 8, 18, 1, '1:25:22', 0, '1:39');
INSERT INTO RaceResult Values(15, 8, 19, 8, '1:25:23', 0, '1:20');
INSERT INTO RaceResult Values(23, 8, 20, 20, '1:25:25', 0, '1:32');
INSERT INTO RaceResult Values(9, 9, 1, 8, '1:39:00', 0, '1:36');
INSERT INTO RaceResult Values(22, 9, 2, 4, '1:39:02', 0, '1:39');
INSERT INTO RaceResult Values(15, 9, 3, 16, '1:39:03', 0, '1:25');
INSERT INTO RaceResult Values(7, 9, 4, 15, '1:39:05', 0, '1:33');
INSERT INTO RaceResult Values(6, 9, 5, 5, '1:39:05', 0, '1:22');
INSERT INTO RaceResult Values(19, 9, 6, 6, '1:39:07', 0, '1:33');
INSERT INTO RaceResult Values(5, 9, 7, 19, '1:39:09', 0, '1:21');
INSERT INTO RaceResult Values(10, 9, 8, 2, '1:39:09', 0, '1:38');
INSERT INTO RaceResult Values(2, 9, 9, 1, '1:39:10', 0, '1:38');
INSERT INTO RaceResult Values(17, 9, 10, 13, '1:39:10', 0, '1:35');
INSERT INTO RaceResult Values(3, 9, 11, 17, '1:39:11', 0, '1:37');
INSERT INTO RaceResult Values(12, 9, 12, 3, '1:39:12', 0, '1:35');
INSERT INTO RaceResult Values(14, 9, 13, 14, '1:39:14', 0, '1:38');
INSERT INTO RaceResult Values(4, 9, 14, 10, '1:39:14', 0, '1:35');
INSERT INTO RaceResult Values(13, 9, 15, 11, '1:39:16', 0, '1:31');
INSERT INTO RaceResult Values(11, 9, 16, 18, '1:39:17', 0, '1:24');
INSERT INTO RaceResult Values(21, 9, 17, 9, '1:39:17', 0, '1:20');
INSERT INTO RaceResult Values(16, 9, 18, 7, '1:39:18', 0, '1:24');
INSERT INTO RaceResult Values(18, 9, 19, 12, '1:39:19', 0, '1:21');
INSERT INTO RaceResult Values(23, 9, 20, 20, '1:39:21', 0, '1:21');
INSERT INTO RaceResult Values(17, 10, 1, 19, '1:27:00', 0, '1:38');
INSERT INTO RaceResult Values(2, 10, 2, 11, '1:27:02', 0, '1:28');
INSERT INTO RaceResult Values(15, 10, 3, 15, '1:27:03', 0, '1:39');
INSERT INTO RaceResult Values(4, 10, 4, 14, '1:27:04', 0, '1:35');
INSERT INTO RaceResult Values(5, 10, 5, 17, '1:27:06', 0, '1:36');
INSERT INTO RaceResult Values(7, 10, 6, 8, '1:27:07', 0, '1:23');
INSERT INTO RaceResult Values(3, 10, 7, 9, '1:27:07', 0, '1:24');
INSERT INTO RaceResult Values(21, 10, 8, 1, '1:27:09', 0, '1:31');
INSERT INTO RaceResult Values(9, 10, 9, 7, '1:27:09', 0, '1:39');
INSERT INTO RaceResult Values(14, 10, 10, 3, '1:27:09', 0, '1:38');
INSERT INTO RaceResult Values(16, 10, 11, 13, '1:27:11', 0, '1:27');
INSERT INTO RaceResult Values(6, 10, 12, 16, '1:27:13', 0, '1:36');
INSERT INTO RaceResult Values(22, 10, 13, 18, '1:27:13', 0, '1:39');
INSERT INTO RaceResult Values(10, 10, 14, 12, '1:27:15', 0, '1:35');
INSERT INTO RaceResult Values(11, 10, 15, 5, '1:27:16', 0, '1:31');
INSERT INTO RaceResult Values(13, 10, 16, 10, '1:27:16', 0, '1:31');
INSERT INTO RaceResult Values(12, 10, 17, 2, '1:27:17', 0, '1:22');
INSERT INTO RaceResult Values(19, 10, 18, 4, '1:27:17', 0, '1:39');
INSERT INTO RaceResult Values(18, 10, 19, 6, '1:27:17', 0, '1:24');
INSERT INTO RaceResult Values(23, 10, 20, 20, '1:27:19', 0, '1:22');
INSERT INTO RaceResult Values(3, 11, 1, 16, '1:21:00', 0, '1:37');
INSERT INTO RaceResult Values(9, 11, 2, 9, '1:21:02', 0, '1:31');
INSERT INTO RaceResult Values(18, 11, 3, 1, '1:21:03', 0, '1:32');
INSERT INTO RaceResult Values(2, 11, 4, 8, '1:21:03', 0, '1:34');
INSERT INTO RaceResult Values(7, 11, 5, 7, '1:21:04', 0, '1:23');
INSERT INTO RaceResult Values(16, 11, 6, 10, '1:21:04', 0, '1:25');
INSERT INTO RaceResult Values(12, 11, 7, 4, '1:21:04', 0, '1:24');
INSERT INTO RaceResult Values(19, 11, 8, 3, '1:21:04', 0, '1:35');
INSERT INTO RaceResult Values(6, 11, 9, 13, '1:21:06', 0, '1:25');
INSERT INTO RaceResult Values(17, 11, 10, 12, '1:21:06', 0, '1:23');
INSERT INTO RaceResult Values(11, 11, 11, 14, '1:21:08', 0, '1:29');
INSERT INTO RaceResult Values(22, 11, 12, 17, '1:21:09', 0, '1:37');
INSERT INTO RaceResult Values(4, 11, 13, 18, '1:21:09', 0, '1:28');
INSERT INTO RaceResult Values(10, 11, 14, 5, '1:21:10', 0, '1:25');
INSERT INTO RaceResult Values(14, 11, 15, 19, '1:21:11', 0, '1:21');
INSERT INTO RaceResult Values(15, 11, 16, 2, '1:21:11', 0, '1:38');
INSERT INTO RaceResult Values(21, 11, 17, 15, '1:21:13', 0, '1:34');
INSERT INTO RaceResult Values(5, 11, 18, 6, '1:21:13', 0, '1:30');
INSERT INTO RaceResult Values(13, 11, 19, 11, '1:21:15', 0, '1:38');
INSERT INTO RaceResult Values(23, 11, 20, 20, '1:21:17', 0, '1:38');
INSERT INTO RaceResult Values(9, 12, 1, 7, '1:37:00', 0, '1:22');
INSERT INTO RaceResult Values(14, 12, 2, 16, '1:37:00', 0, '1:36');
INSERT INTO RaceResult Values(18, 12, 3, 14, '1:37:01', 0, '1:27');
INSERT INTO RaceResult Values(11, 12, 4, 13, '1:37:01', 0, '1:34');
INSERT INTO RaceResult Values(17, 12, 5, 12, '1:37:02', 0, '1:29');
INSERT INTO RaceResult Values(6, 12, 6, 1, '1:37:03', 0, '1:38');
INSERT INTO RaceResult Values(21, 12, 7, 2, '1:37:04', 0, '1:29');
INSERT INTO RaceResult Values(5, 12, 8, 19, '1:37:05', 0, '1:23');
INSERT INTO RaceResult Values(12, 12, 9, 5, '1:37:07', 0, '1:30');
INSERT INTO RaceResult Values(13, 12, 10, 17, '1:37:09', 0, '1:31');
INSERT INTO RaceResult Values(10, 12, 11, 10, '1:37:09', 0, '1:25');
INSERT INTO RaceResult Values(3, 12, 12, 11, '1:37:09', 0, '1:20');
INSERT INTO RaceResult Values(16, 12, 13, 8, '1:37:10', 0, '1:20');
INSERT INTO RaceResult Values(7, 12, 14, 18, '1:37:10', 0, '1:39');
INSERT INTO RaceResult Values(15, 12, 15, 4, '1:37:10', 0, '1:20');
INSERT INTO RaceResult Values(2, 12, 16, 9, '1:37:11', 0, '1:23');
INSERT INTO RaceResult Values(19, 12, 17, 6, '1:37:13', 0, '1:29');
INSERT INTO RaceResult Values(4, 12, 18, 3, '1:37:13', 1, '1:31');
INSERT INTO RaceResult Values(22, 12, 19, 15, '1:37:14', 1, '1:29');
INSERT INTO RaceResult Values(23, 12, 20, 20, '1:37:16', 1, '1:28');
INSERT INTO RaceResult Values(17, 13, 1, 14, '1:37:00', 0, '1:24');
INSERT INTO RaceResult Values(19, 13, 2, 19, '1:37:02', 0, '1:21');
INSERT INTO RaceResult Values(5, 13, 3, 11, '1:37:03', 0, '1:21');
INSERT INTO RaceResult Values(14, 13, 4, 16, '1:37:03', 0, '1:37');
INSERT INTO RaceResult Values(7, 13, 5, 5, '1:37:03', 0, '1:30');
INSERT INTO RaceResult Values(11, 13, 6, 1, '1:37:03', 0, '1:22');
INSERT INTO RaceResult Values(3, 13, 7, 12, '1:37:05', 0, '1:32');
INSERT INTO RaceResult Values(16, 13, 8, 4, '1:37:06', 0, '1:26');
INSERT INTO RaceResult Values(6, 13, 9, 18, '1:37:07', 0, '1:20');
INSERT INTO RaceResult Values(12, 13, 10, 2, '1:37:07', 0, '1:30');
INSERT INTO RaceResult Values(18, 13, 11, 10, '1:37:08', 0, '1:25');
INSERT INTO RaceResult Values(10, 13, 12, 9, '1:37:08', 0, '1:34');
INSERT INTO RaceResult Values(2, 13, 13, 15, '1:37:10', 0, '1:22');
INSERT INTO RaceResult Values(21, 13, 14, 6, '1:37:11', 0, '1:26');
INSERT INTO RaceResult Values(9, 13, 15, 8, '1:37:13', 0, '1:36');
INSERT INTO RaceResult Values(13, 13, 16, 3, '1:37:15', 0, '1:34');
INSERT INTO RaceResult Values(22, 13, 17, 7, '1:37:15', 0, '1:23');
INSERT INTO RaceResult Values(15, 13, 18, 17, '1:37:17', 0, '1:34');
INSERT INTO RaceResult Values(4, 13, 19, 13, '1:37:18', 0, '1:20');
INSERT INTO RaceResult Values(23, 13, 20, 20, '1:37:20', 0, '1:21');
INSERT INTO RaceResult Values(14, 14, 1, 15, '1:20:00', 0, '1:39');
INSERT INTO RaceResult Values(12, 14, 2, 17, '1:20:00', 0, '1:26');
INSERT INTO RaceResult Values(17, 14, 3, 7, '1:20:01', 0, '1:28');
INSERT INTO RaceResult Values(19, 14, 4, 2, '1:20:03', 0, '1:30');
INSERT INTO RaceResult Values(7, 14, 5, 16, '1:20:04', 0, '1:34');
INSERT INTO RaceResult Values(6, 14, 6, 3, '1:20:04', 0, '1:29');
INSERT INTO RaceResult Values(13, 14, 7, 11, '1:20:06', 0, '1:24');
INSERT INTO RaceResult Values(16, 14, 8, 18, '1:20:08', 0, '1:27');
INSERT INTO RaceResult Values(18, 14, 9, 19, '1:20:10', 0, '1:34');
INSERT INTO RaceResult Values(21, 14, 10, 8, '1:20:11', 0, '1:20');
INSERT INTO RaceResult Values(15, 14, 11, 9, '1:20:12', 0, '1:36');
INSERT INTO RaceResult Values(22, 14, 12, 13, '1:20:13', 0, '1:29');
INSERT INTO RaceResult Values(3, 14, 13, 5, '1:20:15', 0, '1:35');
INSERT INTO RaceResult Values(9, 14, 14, 1, '1:20:15', 0, '1:29');
INSERT INTO RaceResult Values(10, 14, 15, 14, '1:20:15', 0, '1:21');
INSERT INTO RaceResult Values(4, 14, 16, 6, '1:20:16', 0, '1:39');
INSERT INTO RaceResult Values(11, 14, 17, 12, '1:20:16', 0, '1:32');
INSERT INTO RaceResult Values(2, 14, 18, 10, '1:20:18', 0, '1:36');
INSERT INTO RaceResult Values(5, 14, 19, 4, '1:20:19', 0, '1:27');
INSERT INTO RaceResult Values(23, 14, 20, 20, '1:20:21', 0, '1:24');
INSERT INTO RaceResult Values(13, 15, 1, 13, '1:26:00', 0, '1:21');
INSERT INTO RaceResult Values(4, 15, 2, 18, '1:26:01', 0, '1:34');
INSERT INTO RaceResult Values(11, 15, 3, 4, '1:26:02', 0, '1:20');
INSERT INTO RaceResult Values(19, 15, 4, 15, '1:26:04', 0, '1:35');
INSERT INTO RaceResult Values(15, 15, 5, 19, '1:26:04', 0, '1:34');
INSERT INTO RaceResult Values(3, 15, 6, 17, '1:26:06', 0, '1:29');
INSERT INTO RaceResult Values(12, 15, 7, 8, '1:26:06', 0, '1:22');
INSERT INTO RaceResult Values(17, 15, 8, 3, '1:26:07', 0, '1:24');
INSERT INTO RaceResult Values(14, 15, 9, 11, '1:26:09', 0, '1:21');
INSERT INTO RaceResult Values(18, 15, 10, 10, '1:26:10', 0, '1:28');
INSERT INTO RaceResult Values(9, 15, 11, 5, '1:26:10', 0, '1:30');
INSERT INTO RaceResult Values(2, 15, 12, 12, '1:26:12', 0, '1:28');
INSERT INTO RaceResult Values(5, 15, 13, 6, '1:26:14', 0, '1:22');
INSERT INTO RaceResult Values(21, 15, 14, 2, '1:26:16', 0, '1:21');
INSERT INTO RaceResult Values(22, 15, 15, 14, '1:26:16', 0, '1:39');
INSERT INTO RaceResult Values(7, 15, 16, 9, '1:26:17', 0, '1:38');
INSERT INTO RaceResult Values(6, 15, 17, 16, '1:26:17', 0, '1:33');
INSERT INTO RaceResult Values(10, 15, 18, 1, '1:26:19', 0, '1:26');
INSERT INTO RaceResult Values(16, 15, 19, 7, '1:26:21', 1, '1:35');
INSERT INTO RaceResult Values(23, 15, 20, 20, '1:26:22', 1, '1:31');
INSERT INTO RaceResult Values(9, 16, 1, 11, '1:33:00', 0, '1:21');
INSERT INTO RaceResult Values(18, 16, 2, 12, '1:33:02', 0, '1:26');
INSERT INTO RaceResult Values(12, 16, 3, 8, '1:33:04', 0, '1:28');
INSERT INTO RaceResult Values(15, 16, 4, 18, '1:33:04', 0, '1:21');
INSERT INTO RaceResult Values(22, 16, 5, 17, '1:33:04', 0, '1:24');
INSERT INTO RaceResult Values(16, 16, 6, 15, '1:33:04', 0, '1:20');
INSERT INTO RaceResult Values(10, 16, 7, 9, '1:33:05', 0, '1:20');
INSERT INTO RaceResult Values(21, 16, 8, 13, '1:33:06', 0, '1:24');
INSERT INTO RaceResult Values(13, 16, 9, 16, '1:33:08', 0, '1:29');
INSERT INTO RaceResult Values(19, 16, 10, 7, '1:33:08', 0, '1:35');
INSERT INTO RaceResult Values(3, 16, 11, 6, '1:33:09', 0, '1:21');
INSERT INTO RaceResult Values(7, 16, 12, 19, '1:33:10', 0, '1:22');
INSERT INTO RaceResult Values(14, 16, 13, 3, '1:33:11', 0, '1:34');
INSERT INTO RaceResult Values(6, 16, 14, 10, '1:33:11', 0, '1:32');
INSERT INTO RaceResult Values(17, 16, 15, 4, '1:33:12', 0, '1:24');
INSERT INTO RaceResult Values(4, 16, 16, 5, '1:33:13', 0, '1:32');
INSERT INTO RaceResult Values(2, 16, 17, 1, '1:33:13', 0, '1:27');
INSERT INTO RaceResult Values(11, 16, 18, 2, '1:33:15', 1, '1:30');
INSERT INTO RaceResult Values(5, 16, 19, 14, '1:33:17', 1, '1:28');
INSERT INTO RaceResult Values(23, 16, 20, 20, '1:33:19', 1, '1:21');
INSERT INTO RaceResult Values(22, 17, 1, 15, '1:23:00', 0, '1:31');
INSERT INTO RaceResult Values(15, 17, 2, 7, '1:23:02', 0, '1:37');
INSERT INTO RaceResult Values(18, 17, 3, 11, '1:23:03', 0, '1:27');
INSERT INTO RaceResult Values(16, 17, 4, 16, '1:23:05', 0, '1:30');
INSERT INTO RaceResult Values(7, 17, 5, 4, '1:23:07', 0, '1:25');
INSERT INTO RaceResult Values(3, 17, 6, 2, '1:23:07', 0, '1:28');
INSERT INTO RaceResult Values(12, 17, 7, 17, '1:23:08', 0, '1:23');
INSERT INTO RaceResult Values(4, 17, 8, 13, '1:23:08', 0, '1:33');
INSERT INTO RaceResult Values(6, 17, 9, 5, '1:23:09', 0, '1:20');
INSERT INTO RaceResult Values(5, 17, 10, 18, '1:23:09', 0, '1:27');
INSERT INTO RaceResult Values(10, 17, 11, 19, '1:23:09', 0, '1:23');
INSERT INTO RaceResult Values(2, 17, 12, 6, '1:23:09', 0, '1:37');
INSERT INTO RaceResult Values(14, 17, 13, 12, '1:23:09', 0, '1:35');
INSERT INTO RaceResult Values(21, 17, 14, 1, '1:23:09', 0, '1:32');
INSERT INTO RaceResult Values(9, 17, 15, 8, '1:23:09', 0, '1:28');
INSERT INTO RaceResult Values(13, 17, 16, 10, '1:23:10', 0, '1:25');
INSERT INTO RaceResult Values(19, 17, 17, 3, '1:23:11', 0, '1:35');
INSERT INTO RaceResult Values(17, 17, 18, 9, '1:23:13', 0, '1:23');
INSERT INTO RaceResult Values(11, 17, 19, 14, '1:23:13', 0, '1:34');
INSERT INTO RaceResult Values(23, 17, 20, 20, '1:23:13', 0, '1:33');
INSERT INTO RaceResult Values(14, 18, 1, 10, '1:36:00', 0, '1:35');
INSERT INTO RaceResult Values(12, 18, 2, 3, '1:36:02', 0, '1:38');
INSERT INTO RaceResult Values(3, 18, 3, 14, '1:36:02', 0, '1:32');
INSERT INTO RaceResult Values(2, 18, 4, 9, '1:36:03', 0, '1:39');
INSERT INTO RaceResult Values(5, 18, 5, 4, '1:36:05', 0, '1:33');
INSERT INTO RaceResult Values(13, 18, 6, 5, '1:36:07', 0, '1:29');
INSERT INTO RaceResult Values(16, 18, 7, 8, '1:36:09', 0, '1:20');
INSERT INTO RaceResult Values(4, 18, 8, 7, '1:36:09', 0, '1:21');
INSERT INTO RaceResult Values(18, 18, 9, 17, '1:36:11', 0, '1:29');
INSERT INTO RaceResult Values(22, 18, 10, 11, '1:36:13', 0, '1:21');
INSERT INTO RaceResult Values(15, 18, 11, 2, '1:36:14', 0, '1:25');
INSERT INTO RaceResult Values(9, 18, 12, 16, '1:36:14', 0, '1:30');
INSERT INTO RaceResult Values(11, 18, 13, 6, '1:36:15', 0, '1:30');
INSERT INTO RaceResult Values(21, 18, 14, 12, '1:36:16', 0, '1:26');
INSERT INTO RaceResult Values(7, 18, 15, 1, '1:36:16', 0, '1:26');
INSERT INTO RaceResult Values(10, 18, 16, 18, '1:36:18', 0, '1:20');
INSERT INTO RaceResult Values(17, 18, 17, 19, '1:36:20', 0, '1:28');
INSERT INTO RaceResult Values(19, 18, 18, 15, '1:36:21', 0, '1:29');
INSERT INTO RaceResult Values(6, 18, 19, 13, '1:36:21', 0, '1:33');
INSERT INTO RaceResult Values(23, 18, 20, 20, '1:36:23', 0, '1:35');
INSERT INTO RaceResult Values(22, 19, 1, 15, '1:36:00', 0, '1:25');
INSERT INTO RaceResult Values(21, 19, 2, 12, '1:36:00', 0, '1:34');
INSERT INTO RaceResult Values(18, 19, 3, 14, '1:36:01', 0, '1:30');
INSERT INTO RaceResult Values(17, 19, 4, 19, '1:36:02', 0, '1:26');
INSERT INTO RaceResult Values(19, 19, 5, 7, '1:36:02', 0, '1:23');
INSERT INTO RaceResult Values(12, 19, 6, 5, '1:36:02', 0, '1:29');
INSERT INTO RaceResult Values(3, 19, 7, 8, '1:36:04', 0, '1:20');
INSERT INTO RaceResult Values(14, 19, 8, 3, '1:36:04', 0, '1:32');
INSERT INTO RaceResult Values(15, 19, 9, 2, '1:36:05', 0, '1:38');
INSERT INTO RaceResult Values(2, 19, 10, 13, '1:36:05', 0, '1:35');
INSERT INTO RaceResult Values(13, 19, 11, 9, '1:36:05', 0, '1:29');
INSERT INTO RaceResult Values(4, 19, 12, 10, '1:36:05', 0, '1:27');
INSERT INTO RaceResult Values(5, 19, 13, 4, '1:36:06', 0, '1:34');
INSERT INTO RaceResult Values(11, 19, 14, 1, '1:36:08', 0, '1:29');
INSERT INTO RaceResult Values(9, 19, 15, 16, '1:36:08', 0, '1:28');
INSERT INTO RaceResult Values(6, 19, 16, 17, '1:36:10', 0, '1:23');
INSERT INTO RaceResult Values(7, 19, 17, 18, '1:36:10', 0, '1:38');
INSERT INTO RaceResult Values(10, 19, 18, 11, '1:36:11', 0, '1:32');
INSERT INTO RaceResult Values(16, 19, 19, 6, '1:36:11', 0, '1:25');
INSERT INTO RaceResult Values(23, 19, 20, 20, '1:36:12', 0, '1:22');
INSERT INTO RaceResult Values(5, 20, 1, 13, '1:31:00', 0, '1:36');
INSERT INTO RaceResult Values(7, 20, 2, 16, '1:31:00', 0, '1:33');
INSERT INTO RaceResult Values(17, 20, 3, 7, '1:31:01', 0, '1:34');
INSERT INTO RaceResult Values(11, 20, 4, 6, '1:31:01', 0, '1:27');
INSERT INTO RaceResult Values(16, 20, 5, 14, '1:31:03', 0, '1:22');
INSERT INTO RaceResult Values(3, 20, 6, 2, '1:31:03', 0, '1:31');
INSERT INTO RaceResult Values(18, 20, 7, 8, '1:31:05', 0, '1:33');
INSERT INTO RaceResult Values(10, 20, 8, 15, '1:31:07', 0, '1:20');
INSERT INTO RaceResult Values(9, 20, 9, 1, '1:31:08', 0, '1:25');
INSERT INTO RaceResult Values(22, 20, 10, 5, '1:31:10', 0, '1:21');
INSERT INTO RaceResult Values(21, 20, 11, 12, '1:31:10', 0, '1:30');
INSERT INTO RaceResult Values(14, 20, 12, 11, '1:31:11', 0, '1:25');
INSERT INTO RaceResult Values(6, 20, 13, 18, '1:31:12', 0, '1:25');
INSERT INTO RaceResult Values(12, 20, 14, 3, '1:31:12', 0, '1:28');
INSERT INTO RaceResult Values(15, 20, 15, 19, '1:31:14', 0, '1:23');
INSERT INTO RaceResult Values(13, 20, 16, 9, '1:31:15', 0, '1:32');
INSERT INTO RaceResult Values(4, 20, 17, 10, '1:31:15', 0, '1:30');
INSERT INTO RaceResult Values(19, 20, 18, 4, '1:31:17', 0, '1:33');
INSERT INTO RaceResult Values(2, 20, 19, 17, '1:31:18', 1, '1:26');
INSERT INTO RaceResult Values(23, 20, 20, 20, '1:31:20', 1, '1:37');
INSERT INTO RaceResult Values(11, 21, 1, 10, '1:32:00', 0, '1:36');
INSERT INTO RaceResult Values(16, 21, 2, 19, '1:32:00', 0, '1:30');
INSERT INTO RaceResult Values(19, 21, 3, 7, '1:32:02', 0, '1:27');
INSERT INTO RaceResult Values(21, 21, 4, 4, '1:32:04', 0, '1:24');
INSERT INTO RaceResult Values(10, 21, 5, 17, '1:32:06', 0, '1:33');
INSERT INTO RaceResult Values(14, 21, 6, 13, '1:32:06', 0, '1:39');
INSERT INTO RaceResult Values(22, 21, 7, 8, '1:32:07', 0, '1:37');
INSERT INTO RaceResult Values(3, 21, 8, 15, '1:32:09', 0, '1:24');
INSERT INTO RaceResult Values(15, 21, 9, 6, '1:32:10', 0, '1:20');
INSERT INTO RaceResult Values(5, 21, 10, 2, '1:32:10', 0, '1:29');
INSERT INTO RaceResult Values(17, 21, 11, 18, '1:32:10', 0, '1:36');
INSERT INTO RaceResult Values(13, 21, 12, 16, '1:32:12', 0, '1:38');
INSERT INTO RaceResult Values(2, 21, 13, 11, '1:32:13', 0, '1:27');
INSERT INTO RaceResult Values(6, 21, 14, 14, '1:32:13', 0, '1:35');
INSERT INTO RaceResult Values(4, 21, 15, 1, '1:32:13', 0, '1:24');
INSERT INTO RaceResult Values(9, 21, 16, 12, '1:32:14', 0, '1:38');
INSERT INTO RaceResult Values(12, 21, 17, 5, '1:32:16', 0, '1:25');
INSERT INTO RaceResult Values(7, 21, 18, 3, '1:32:18', 0, '1:24');
INSERT INTO RaceResult Values(18, 21, 19, 9, '1:32:19', 0, '1:28');
INSERT INTO RaceResult Values(23, 21, 20, 20, '1:32:21', 0, '1:22');
INSERT INTO RaceResult Values(16, 22, 1, 9, '1:26:00', 0, '1:32');
INSERT INTO RaceResult Values(10, 22, 2, 19, '1:26:00', 0, '1:28');
INSERT INTO RaceResult Values(12, 22, 3, 10, '1:26:02', 0, '1:38');
INSERT INTO RaceResult Values(19, 22, 4, 13, '1:26:02', 0, '1:35');
INSERT INTO RaceResult Values(2, 22, 5, 3, '1:26:02', 0, '1:36');
INSERT INTO RaceResult Values(9, 22, 6, 18, '1:26:04', 0, '1:33');
INSERT INTO RaceResult Values(11, 22, 7, 12, '1:26:04', 0, '1:25');
INSERT INTO RaceResult Values(21, 22, 8, 5, '1:26:05', 0, '1:25');
INSERT INTO RaceResult Values(15, 22, 9, 11, '1:26:05', 0, '1:23');
INSERT INTO RaceResult Values(22, 22, 10, 6, '1:26:05', 0, '1:29');
INSERT INTO RaceResult Values(6, 22, 11, 17, '1:26:05', 0, '1:27');
INSERT INTO RaceResult Values(17, 22, 12, 16, '1:26:06', 0, '1:28');
INSERT INTO RaceResult Values(5, 22, 13, 7, '1:26:08', 0, '1:20');
INSERT INTO RaceResult Values(7, 22, 14, 14, '1:26:08', 0, '1:29');
INSERT INTO RaceResult Values(3, 22, 15, 1, '1:26:10', 0, '1:27');
INSERT INTO RaceResult Values(4, 22, 16, 15, '1:26:11', 0, '1:27');
INSERT INTO RaceResult Values(14, 22, 17, 8, '1:26:12', 0, '1:20');
INSERT INTO RaceResult Values(18, 22, 18, 4, '1:26:12', 0, '1:37');
INSERT INTO RaceResult Values(13, 22, 19, 2, '1:26:14', 0, '1:20');
INSERT INTO RaceResult Values(23, 22, 20, 20, '1:26:16', 0, '1:36');
