CREATE TABLE Normalised_Origin_People
(
	 [People_ID] INT PRIMARY KEY
	,[Name] Varchar(100)
)
;

CREATE TABLE Normalised_Origin_Address
(
	 [Address_ID] INT PRIMARY KEY
	,[People_ID] INT FOREIGN KEY REFERENCES Normalised_Origin_People(People_ID)
	,[Address_1] Varchar(100)
	,[Address_2] Varchar(100)
)