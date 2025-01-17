SELECT 
	concat('SELECT TOP 1 * FROM ', t.name) AS Table_Name
FROM   
	sys.tables  t
INNER JOIN   
	sys.schemas s on s.schema_id = t.schema_id

WHERE 
	--Adhere Predict
	t.name NOT LIKE 'met%' AND t.name NOT LIKE 'mic%' AND t.name NOT LIKE 'pgn%' AND t.name NOT LIKE 'cez%'

	--Metafour
	t.name LIKE 'met%'

	--Microlise
	t.name LIKE 'mic%'

	--Paragon
	t.name LIKE 'pgn%'

	--Cezanne
	t.name LIKE 'cez%'