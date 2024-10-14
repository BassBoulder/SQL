CREATE TABLE Normalised_Origin_People
(
	 [People_ID] INT PRIMARY KEY NOT NULL IDENTITY(1,1)
	,[Name] Varchar(100)
)
;

CREATE TABLE Normalised_Origin_Address
(
	 [Address_ID] INT PRIMARY KEY IDENTITY(1,1)
	,[People_ID] INT FOREIGN KEY REFERENCES Normalised_Origin_People(People_ID)
	,[Address_1] Varchar(100)
	,[Address_2] Varchar(100)
)

DROP TABLE Normalised_Origin_Address, Normalised_Origin_People