SELECT
	whsshipmenttable.*
	,'   ' '------------'
	,'   ' '------------'
	,whscontainertable.*
	,'   ' '------------'
	,'   ' '------------'
	,whsloadline.*
	,'   ' '------------'
	,'   ' '------------'
	,custpackingsliptrans.*
	,'   ' '------------'
	,'   ' '------------'
	,custpackingslipjour.*
	,'   ' '------------'
	,'   ' '------------'
	,salestable.*
	,'   ' '------------'
	,'   ' '------------'
	,logisticspostaladdress.*

FROM
	whsshipmenttable

INNER JOIN whscontainertable 
	ON whsshipmenttable.shipmentid = whscontainertable.shipmentid
    AND whsshipmenttable.dataareaid = whscontainertable.dataareaid
    AND whscontainertable.containerstatus = 2

INNER JOIN whsloadline
	ON whscontainertable.shipmentid = whsloadline.shipmentid
    AND whscontainertable.dataareaid = whsloadline.dataareaid

INNER JOIN custpackingsliptrans
     ON whsloadline.inventtransid = custpackingsliptrans.inventtransid
     AND whsloadline.dataareaid = custpackingsliptrans.dataareaid

INNER JOIN custpackingslipjour
     ON custpackingsliptrans.packingslipid = custpackingslipjour.packingslipid
     AND custpackingsliptrans.dataareaid = custpackingslipjour.dataareaid

INNER JOIN salestable
     ON custpackingslipjour.salesid = salestable.salesid
     AND whsloadline.dataareaid = salestable.dataareaid

INNER JOIN logisticspostaladdress
     ON salestable.deliverypostaladdress = logisticspostaladdress.recid

WHERE
	whsshipmenttable.shipmentid = 'SHP-3940765'
AND
	custpackingsliptrans.itemid = 'AC35480'