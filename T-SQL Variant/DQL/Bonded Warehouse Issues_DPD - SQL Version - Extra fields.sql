
SELECT DISTINCT
	 'ENDCTG' 'Company Code'
	,'' 'Site Code'
	,MIN(whscontainertable.shipcarriertrackingnum) 'Issue Reference'
	,FORMAT(whscontainertable.closecontainerutcdatetime, 'yyyy-MM-dd') 'Issue Date'
	,'DPDSHIP' 'Project Reference'
	,'' 'IPR Reference'
	,'' 'Stock Detail Key Type'
	,'' 'Stock Detail Key'
	,whscontainerline.itemid 'Product/Part No. Ref'
	,SUM(whscontainerline.qty) 'Quantity'
	,'' 'Price'
	,'' 'Currency'
	,salestable.salesname 'Customer'
FROM
	whsshipmenttable

INNER JOIN whscontainertable 
	ON whsshipmenttable.shipmentid = whscontainertable.shipmentid
    AND whsshipmenttable.dataareaid = whscontainertable.dataareaid

INNER JOIN whscontainerline
	ON whscontainertable.shipmentid = whscontainerline.shipmentid
    AND whscontainertable.dataareaid = whsshipmenttable.dataareaid

INNER JOIN salestable
     ON whsshipmenttable.ordernum = salestable.salesid
    AND whsshipmenttable.dataareaid = salestable.dataareaid

INNER JOIN logisticspostaladdress
     ON salestable.deliverypostaladdress = logisticspostaladdress.recid
	
WHERE
(
	salestable.dlvmode LIKE '%DPD%'
OR
	salestable.dlvmode LIKE '%dpd%'
)
AND
	logisticspostaladdress.countryregionid != 'GBR'
AND
	whscontainertable.closecontainerutcdatetime > GETDATE()-7
AND 
	whscontainertable.containerstatus = '2'
AND 
	logisticspostaladdress.validfrom <= GETDATE()
AND 
	logisticspostaladdress.validto > GETDATE()

GROUP BY
	 whscontainertable.shipcarriertrackingnum
	,whscontainertable.closecontainerutcdatetime
	,whscontainerline.itemid
	,salestable.salesname