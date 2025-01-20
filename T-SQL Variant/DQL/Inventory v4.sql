WITH inventory_max_modified_date AS (
    SELECT DISTINCT 
		 itemid
		,endbrand
		,product
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
	  COALESCE(pv.endexternalitemid,
		CONCAT(
			COALESCE(ivs.itemid, ''),
			COALESCE(ivs.inventcolorid,''),
			COALESCE(ivs.inventsizeid,''))
			) ProductID
	,ivs.inventlocationid LocationID
	,SUM(ivs.physicalinvent) LocationUnits
	,pdt.endinsale PriceIndicator

FROM 
	inventsum ivs

LEFT JOIN inventory_max_modified_date ivt
	ON ivs.itemid = ivt.itemid
	AND ivt.RankID = 1

LEFT JOIN inventory_max_sale_flag pdt
	ON pdt.itemrelation = ivs.itemid 
	AND pdt.RankID = 1

LEFT JOIN ecoresdistinctproductvariant pv
	ON pv.productmaster = ivt.product 
	AND ivs.dataareaid = 'end.'


WHERE 
	ivs.dataareaid = 'end.'
--AND 
--	ivs.itemid = 'AC43037'

GROUP BY 
	  COALESCE(pv.endexternalitemid,
		CONCAT(
			COALESCE(ivs.itemid, ''),
			COALESCE(ivs.inventcolorid,''),
			COALESCE(ivs.inventsizeid,''))
			)
	,ivs.inventlocationid
	,pdt.endinsale
HAVING 
	SUM(ivs.physicalinvent) > 0
ORDER BY 
	ProductID ASC