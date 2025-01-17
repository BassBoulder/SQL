
SELECT TOP 10
	 a.ID
	,a.Therapy
	,a.Status
	,'||' '||'
	,c.DateOfInteraction
	,c.TimeOfInteractionTime
	,c.SalesOrderNo
	,c.Type
FROM
	dbo.activity a
LEFT JOIN
	dbo.comments c
		ON a.ID = c.ID