SELECT DISTINCT  -- <<< this toggled-on & off will quickly tell you if it's a dup or not (it'll only show 1 row when toggled-on if so)

	'ENDCTG' 'Company Code'
	,'' 'Site Code'
	,whscontainertable.shipcarriertrackingnum 'Issue Reference'
	,custpackingslipjour.deliverydate 'Issue Date'
	,'DPDSHIP' 'Project Reference'
	,'' 'IPR Reference'
	,'' 'Stock Detail Key Type'
	,'' 'Stock Detail Key'
	,custpackingsliptrans.itemid 'Product/Part No. Ref'
	,custpackingsliptrans.qty Quantity
	,'' Price
	,'' Currency
	,salestable.salesname 'Customer'
	,*

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
   --custpackingslipjour.deliverydate ??? what should it be???
	logisticspostaladdress.countryregionid != 'GBR'
AND
    salestable.dlvmode NOT LIKE '%DPD%'
AND
	--salestable.salesname = 'Andrew DiVit'
	whscontainertable.shipcarriertrackingnum = '771421074231'
AND
	custpackingsliptrans.itemid = 'AB80656'

--GROUP BY
--	 whscontainertable.shipcarriertrackingnum
--	,custpackingslipjour.deliverydate
--	,custpackingsliptrans.itemid 
--	,salestable.salesname