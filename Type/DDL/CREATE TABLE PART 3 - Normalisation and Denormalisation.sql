INSERT INTO Normalised_Origin_People(Name)
	SELECT 
		[Name] 
	FROM 
		Origin
;

INSERT INTO Normalised_Origin_Address(People_ID, Address_1, Address_2)
	SELECT 
		 nop.People_ID
		,o.Address_1
		,o.Address_2
	FROM
		Normalised_Origin_People nop
	INNER JOIN
		Origin o
			ON nop.[Name] = o.[Name]