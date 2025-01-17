SELECT
	ivt.itemid
	,CONCAT(COALESCE(ivs.itemid, ''),
		COALESCE(ivs.inventcolorid,''),
		COALESCE(ivs.inventsizeid,'')) ProductID
	,ivs.inventlocationid LocationID
	,SUM(ivs.physicalinvent) LocationUnits
	,ISNULL(pdt.endinsale, 0) PriceIndicator

FROM 
	inventsum ivs

LEFT JOIN inventtable ivt
	ON ivs.itemid = ivt.itemid
	and ivt.modifiedon = (SELECT MAX(modifiedon) FROM inventtable ivt2 WHERE ivt.itemid = ivt2.itemid) /* Used to narrow-down to most recent row */

LEFT JOIN pricedisctable pdt
	ON pdt.itemrelation = ivs.itemid 
	AND todate = (SELECT MAX(todate) FROM pricedisctable pdt2 WHERE pdt.itemrelation = pdt2.itemrelation) /* Used to narrow-down to most recent row */
	AND currency = 'GBP' /* Used to narrow-down to single row, cost isn't part of this query, just the endinsale flag*/

WHERE 
	ivs.dataareaid = 'end.'
AND
	ivt.endbrand LIKE '%Adidas%'
AND 
	ivs.itemid = 'AA20982'
GROUP BY 
	  ivt.itemid
	 ,CONCAT(COALESCE(ivs.itemid, ''),
		COALESCE(ivs.inventcolorid,''),
		COALESCE(ivs.inventsizeid,''))
	,inventlocationid
	,pdt.endinsale
HAVING 
	SUM(ivs.physicalinvent) > 0
ORDER BY 
	ProductID ASC