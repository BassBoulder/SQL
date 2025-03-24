
SELECT
     whsshipmenttable.shipmentid
	,whscontainertable.containerid
	,'ENDCTG' 'Company Code'
	,'' 'Site Code'
	,MIN(whscontainertable.shipcarriertrackingnum) 'Issue Reference'
	,MIN(whscontainertable.closecontainerutcdatetime) 'Issue Date'
	,'DPDSHIP' 'Project Reference'
	,'' 'IPR Reference'
	,'' 'Stock Detail Key Type'
	,'' 'Stock Detail Key'
	,whscontainerline.itemid 'Product/Part No. Ref'
	,SUM(whscontainerline.qty) 'Quantity'
	,'' 'Price'
	,'' 'Currency'
	,salestable.salesname 'Customer'
	,'' '||'
	,salestable.dlvmode --extrafield
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
	--salestable.dlvmode IN ('DPD-2-3','DPD-DPD','DPD-Econ','DPD-Fre1','DPD-Fre2','DPD-Fre3','DPD-Fre4','DPD-Fre5','DPD-Fre6','DPD-Fre7','DPD-Fre8','DPD-Free','DPD-Laun','DPD-Next','DPD-Prio','DPD-ROI','DPD-Sta1','DPD-Sta2','DPD-Sta3','DPD-Sta4','DPD-Sta5','DPD-Sta6','DPD-Staf','DPD-Stan','DPD-UK L')
--AND
	whscontainertable.shipcarriertrackingnum = '772722638068'

GROUP BY
     whsshipmenttable.shipmentid
	,whscontainertable.containerid
	,whscontainertable.shipcarriertrackingnum
	,whscontainertable.closecontainerutcdatetime
	,whscontainerline.itemid
	,salestable.salesname
	,salestable.dlvmode 

ORDER BY
	 whscontainertable.closecontainerutcdatetime DESC
	,whsshipmenttable.shipmentid DESC
	,whscontainertable.containerid DESC