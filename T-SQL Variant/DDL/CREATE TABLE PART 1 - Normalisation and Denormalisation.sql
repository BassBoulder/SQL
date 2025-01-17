CREATE TABLE Origin
( 
	 [Name] Varchar(100)
	,[Address_1] Varchar(100)
	,[Address_2] Varchar(100)
)
;

INSERT INTO Origin (Name, [Address_1], [Address_2]) VALUES
	('Nick', 'Cherry Tree', 'Hull'),
	('Dave', 'Apple Tree', 'Leeds'),
	('Bob', 'Monkey Tree', 'York'),
	('Barry', 'Cherry Tree', 'Hull'),
	('Claire', 'Apple Tree', 'Leeds'),
	('Milton', 'Monkey Tree', 'York')

--DROP TABLE dbo.Origin