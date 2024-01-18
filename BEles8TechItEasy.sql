DROP TABLE IF EXISTS WallBrackets CASCADE;
DROP TABLE IF EXISTS CiModules CASCADE;
DROP TABLE IF EXISTS RemoteControls CASCADE;
DROP TABLE IF EXISTS Televisions CASCADE;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users
(
	username VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR(100) NOT NULL
);

CREATE TABLE RemoteControls
(
	remoteControlID SERIAL PRIMARY KEY,
	remoteControlName VARCHAR(100),
	remoteControlBrand VARCHAR(50),
	price DOUBLE PRECISION,
	currentStock INT,
	compatibleWith VARCHAR(100),
	batteryType VARCHAR(50)
);

CREATE TABLE CiModules
(
	ciModuleID SERIAL PRIMARY KEY,
	ciModuleName VARCHAR(100),
	price DOUBLE PRECISION,
	currentStock INT,
	sold INT
);

CREATE TABLE WallBrackets
(
	wallBracketID SERIAL PRIMARY KEY,
	wallBracketName VARCHAR(100),
	price DOUBLE PRECISION,
	currentStock INT,
	sold INT
);

CREATE TABLE Televisions
(
	televisionID SERIAL PRIMARY KEY,
	televisionName VARCHAR(100),
	televisionBrand VARCHAR(50),
	price DOUBLE PRECISION,
	currentStock INT,
	sold INT,
	televisionType VARCHAR(50),
	available DOUBLE PRECISION,
	refreshRate DOUBLE PRECISION,
	screenType VARCHAR(50),
	remoteControlID INT,
	wallBracketID INT,
	ciModuleID INT,
	FOREIGN KEY (remoteControlID) REFERENCES RemoteControls (remoteControlID),
	FOREIGN KEY (wallBracketID) REFERENCES WallBrackets (wallBracketID),
	FOREIGN KEY (ciModuleID) REFERENCES CiModules (ciModuleID)
);

INSERT INTO Televisions (televisionName, televisionBrand, price, currentStock, sold, televisionType, available, refreshRate, screentype) 
VALUES ('65808','Philips', 3000, 200, 100, 'OLED', 199, 100, 'OLED'), ('Frame','Samsung', 4000, 150, 150, 'QLED', 149, 100, 'LED-LCD');
SELECT * FROM Televisions;

INSERT INTO Remotecontrols (remoteControlName, remoteControlBrand, price, currentStock, compatibleWith, batteryType) 
VALUES ('Philips', 'Universal remote control', 17.95, 100, 'Philips', 'AAA-batterijen');
UPDATE Televisions SET remoteControlID = 1 WHERE televisionID = 1;

INSERT INTO Remotecontrols (remoteControlName, remoteControlBrand, price, currentStock, compatibleWith, batteryType) 
VALUES ('Samsung', 'Universal remote control', 14.95, 90, 'Samsung', 'Accu');
UPDATE Televisions SET remoteControlID = 2 WHERE televisionID = 2;
SELECT * FROM Remotecontrols;

INSERT INTO CiModules (ciModuleName, price, currentStock, sold) VALUES ('Universal Ci-Module', 53.95, 50, 75);
SELECT * FROM CiModules;

INSERT INTO WallBrackets (wallBracketName, price, currentStock, sold) VALUES ('Philips small', 59.95, 60, 15);
SELECT * FROM WallBrackets;

INSERT INTO Users (userName, password) VALUES ('Efendi078', 'hoiNovi');
SELECT * FROM Users;