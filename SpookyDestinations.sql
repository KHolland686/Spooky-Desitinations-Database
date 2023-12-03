DROP DATABASE IF EXISTS SpookyTravel;

CREATE DATABASE SpookyTravel;

USE SpookyTravel;



CREATE TABLE IF NOT EXISTS Transportation (
TranspName varchar (20) not null,
PRIMARY KEY (TranspName)
);

CREATE TABLE IF NOT EXISTS Activities (
ActivityName varchar (50) not null,
PRIMARY KEY (ActivityName)
);

CREATE TABLE IF NOT EXISTS Costumes (
CostumeName varchar(20) not null,
PRIMARY KEY (CostumeName)
);

CREATE TABLE IF NOT EXISTS Locations (
LocationName varchar (20) not null,
Transport varchar (20),
DistanceMiles int,
BestCostume varchar (20) not null,
FOREIGN KEY (Transport) REFERENCES Transportation (TranspName) on update cascade on delete cascade,
FOREIGN KEY (BestCostume) REFERENCES Costumes (CostumeName) on update cascade on delete cascade,
PRIMARY KEY (LocationName)
);

CREATE TABLE IF NOT EXISTS FamilyMembers (
ID int not null auto_increment,
`Name` varchar(20) not null,
PreferredDestination varchar(20) not null,
FOREIGN KEY (PreferredDestination) REFERENCES Locations (LocationName) on update cascade on delete cascade,
PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS LocationActivities (
    LocationName VARCHAR(20),
    ActivityName VARCHAR(50),
    FOREIGN KEY (LocationName) REFERENCES Locations(LocationName) on update cascade on delete cascade,
    FOREIGN KEY (ActivityName) REFERENCES Activities(ActivityName) on update cascade on delete cascade,
    PRIMARY KEY (LocationName, ActivityName)
    );
    
    
INSERT INTO Transportation (TranspName) 
VALUES ("Plane"),
("Car"),
("Train"),
("Boat");

INSERT INTO Activities (ActivityName)
Values ("Camping"),
("Ghost Tour"),
("Paranormal Investigation"),
("Stargazing"),
("Fortune Telling"),
("Witch Trial Reenactment"),
("Workshops"),
("Witchcraft Museum"),
("Murder Mystery Dinner"),
("Escape Room"),
("Concert"),
("Boat Tour"),
("Fire Dance"),
("Raven feeding");

INSERT INTO Costumes (CostumeName)
VALUES ("Witch"),
("Skeleton"),
("Ghost"),
("Demon"),
('Headless');

INSERT INTO Locations (LocationName, Transport, DistanceMiles, BestCostume)
VALUES 
('Salem', 'Train', 167, 'Witch'),
('Fengdu Ghost City', 'Plane', 7572, 'Ghost'),
('Paris Catacombs', 'Plane', 3558, 'Skeleton'),
('Door to Hell', 'Plane', 6141, 'Demon'),
('Tower of London', 'Plane', 180, 'Headless'),
('Lizzie Borden House', 'Car', 300, 'Ghost');



INSERT INTO LocationActivities (LocationName, ActivityName)
VALUES ('Salem', 'Witch Trial Reenactment'),
       ('Salem', 'Witchcraft Museum'),
       ('Salem', 'Workshops'),
       ('Salem', 'Ghost Tour'),
       ('Fengdu Ghost City', 'Ghost Tour'),
       ('Fengdu Ghost City', 'Fortune Telling'),
       ('Fengdu Ghost City', 'Boat Tour'),
       ('Fengdu Ghost City', 'Workshops'),
       ('Paris Catacombs', 'Ghost Tour'),
       ('Paris Catacombs', 'Workshops'),
       ('Paris Catacombs', 'Escape Room'),
       ('Paris Catacombs', 'Concert'),
       ('Door to Hell', 'Camping'),
       ('Door to Hell', 'Stargazing'),
       ('Door to Hell', 'Fire Dance'),
       ('Tower of London', 'Ghost Tour'),
       ('Tower of London', 'Escape Room'),
       ('Tower of London', 'Raven Feeding'),
       ('Lizzie Borden House', 'Workshops'),
       ('Lizzie Borden House', 'Murder Mystery Dinner'),
       ('Lizzie Borden House', 'Ghost Tour');
       
INSERT INTO FamilyMembers (`Name`, PreferredDestination)
VALUES ('John', 'Paris Catacombs'),
('Kaia', 'Fengdu Ghost City'),
('Mary', 'Salem'),
('Tom', 'Tower of London'),
('Maia', 'Lizzie Borden House'),
('Larry', 'Door to Hell');

SELECT * FROM Activities;
SELECT * FROM Transportation;
SELECT * FROM Costumes;
SELECT * FROM Locations;
SELECT * FROM LocationActivities;
SELECT * FROM FamilyMembers;
       