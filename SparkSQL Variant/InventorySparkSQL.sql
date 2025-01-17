inventory = spark.sql("""

WITH inventory_max_modified_date AS (
    SELECT DISTINCT 
		 itemid
		,endbrand
		,modifiedon
		,DENSE_RANK() OVER (PARTITION BY itemid ORDER BY endbrand, modifiedon  DESC) RankID
	FROM 
		inventtable 
	WHERE 
		endbrand LIKE '%Adidas%'
)
,
 inventory_max_sale_flag AS (
    SELECT DISTINCT 
		 itemrelation
		,COALESCE(endinsale, 0) endinsale
		,currency
		,todate
		,DENSE_RANK() OVER (PARTITION BY itemrelation ORDER BY todate DESC) RankID
	FROM 
		pricedisctable 
	WHERE
		currency = 'GBP'
)

SELECT
	 DATE_SUB(DATE_TRUNC('DAY', NOW()), 1) as Date
	,CONCAT(
        COALESCE(ivs.itemid, ''),
		COALESCE(ivs.inventcolorid,''),
		COALESCE(ivs.inventsizeid,'')
        ) ProductID
	,ivs.inventlocationid LocationID
	,SUM(ivs.physicalinvent) LocationUnits
	,COALESCE(pdt.endinsale, 0) PriceIndicator

FROM 
	DE_LH_100_SPS_Integration.inventsum ivs

LEFT JOIN inventory_max_modified_date ivt
	ON ivs.itemid = ivt.itemid
    AND ivt.RankID = 1

LEFT JOIN inventory_max_sale_flag pdt
	ON pdt.itemrelation = ivs.itemid 
    AND pdt.RankID = 1

WHERE 
	ivs.dataareaid = 'end.'
AND
    ivs.modifieddatetime BETWEEN DATE_SUB(DATE_TRUNC('DAY', NOW()), 8) AND DATE_SUB(DATE_TRUNC('DAY', NOW()), 1)

GROUP BY 
	 CONCAT(
        COALESCE(ivs.itemid, ''),
		COALESCE(ivs.inventcolorid,''),
		COALESCE(ivs.inventsizeid,'')
        )
	,inventlocationid
	,COALESCE(pdt.endinsale, 0)
HAVING 
	SUM(ivs.physicalinvent) > 0
"""
)