
SELECT TOP 10
	whsshipmenttable.shipmentid
	,whsloadline.inventtransid 'whsloadline.inventtransid'
	,custpackingsliptrans.inventtransid 'custpackingsliptrans.inventtransid'
	,custpackingslipjour.packingslipid 'custpackingslipjour.packingslipid'
	,custpackingsliptrans.packingslipid 'custpackingsliptrans.packingslipid'
	,custpackingsliptrans.dataareaid 'custpackingsliptrans.dataareaid'
	,custpackingslipjour.deliverydate 'custpackingslipjour.deliverydate'
	,'--------------------' '|||||'
	,*

FROM
	whsshipmenttable

INNER JOIN whscontainertable 
	ON whsshipmenttable.shipmentid = whscontainertable.shipmentid
    AND whsshipmenttable.dataareaid = whscontainertable.dataareaid
    AND whscontainertable.containerstatus = 2
	--AND whscontainertable.containernum = 1

INNER JOIN whsloadline
	ON whscontainertable.shipmentid = whsloadline.shipmentid
    AND whscontainertable.dataareaid = whsloadline.dataareaid

LEFT JOIN custpackingsliptrans
     ON whsloadline.inventtransid = custpackingsliptrans.inventtransid
     AND whsloadline.dataareaid = custpackingsliptrans.dataareaid

LEFT JOIN custpackingslipjour
     ON custpackingsliptrans.packingslipid = custpackingslipjour.packingslipid
     AND custpackingsliptrans.dataareaid = custpackingslipjour.dataareaid

--WHERE
	--whsshipmenttable.shipmentid = 'SHP-4005721'

