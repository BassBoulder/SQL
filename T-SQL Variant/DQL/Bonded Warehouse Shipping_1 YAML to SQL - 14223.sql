
SELECT
	'SHIPMENT' 'Shipment Level No'
	,whsshipmenttable.shipmentid 'Shipment Reference'
	,whsshipmenttable.shipconfirmutcdatetime 'Date of Shipment'
	,'EXPORT' 'Project Key'
	,CASE WHEN salestable.salestype = 3 THEN '1' ELSE '2' END 'NOTC A'
	,CASE WHEN salestable.salestype = 3 THEN '1' ELSE '9' END 'NOTC B'
	,transportidlookup.BorderTransportID 'Border Transport ID'
	,transportidlookup.BorderTransportNationality 'Border Transport Nationality'
	,transportidlookup.InlandTransportID 'Inland Transport ID'
	,REPLACE(REPLACE(whsshipmenttable.hslmovementkey, ' ', ''),'-','_') 'Movement Key'
	,CASE WHEN custtable.custgroup IN ('Interco', '3rd Party','RTV') THEN 'B2B' ELSE 'B2C' END 'Transaction Type'
	,whsshipmenttable.shipmentid 'Key'

    ,'>>>' 'WHERE CLAUSE'
    ,whscontainertable.dataareaid
    ,logisticspostaladdress.validfrom 
    ,logisticspostaladdress.validto
    ,whscontainertable.containerstatus
    ,whsshipmenttable.shipmentstatus
    ,logisticspostaladdress.countryregionid
    ,salestable.dlvmode

FROM 
	whscontainertable
INNER JOIN 
	whsshipmenttable ON whscontainertable.shipmentid = whsshipmenttable.shipmentid AND whscontainertable.dataareaid = whsshipmenttable.dataareaid
INNER JOIN 
	salestable ON whsshipmenttable.ordernum = salestable.salesid AND whsshipmenttable.dataareaid = salestable.dataareaid
INNER JOIN 
	custtable ON salestable.custaccount = custtable.accountnum
LEFT JOIN 
	logisticspostaladdress ON salestable.deliverypostaladdress = logisticspostaladdress.recid
LEFT JOIN 
	logisticsaddresscountryregion ON logisticspostaladdress.countryregionid = logisticsaddresscountryregion.countryregionid
LEFT JOIN 
	transportidlookup ON whsshipmenttable.carrierservicecode = transportidlookup.Shippingcarrierservice

WHERE
	whscontainertable.dataareaid IN ('end.', 'END.')
AND logisticspostaladdress.validfrom <= GETDATE()
AND logisticspostaladdress.validto > GETDATE()
AND whscontainertable.containerstatus = 2
AND logisticspostaladdress.countryregionid != 'GBR'
/*
AND 
	salestable.dlvmode NOT IN 
	  ('DPD-2-3','DPD-DPD','DPD-Econ','DPD-Fre1','DPD-Fre2','DPD-Fre3','DPD-Fre4','DPD-Fre5'
	  ,'DPD-Fre6','DPD-Fre7','DPD-Fre8','DPD-Free','DPD-Laun','DPD-Next','DPD-Prio','DPD-ROI'
	  ,'DPD-Sta1','DPD-Sta2','DPD-Sta3','DPD-Sta4','DPD-Sta5','DPD-Sta6','DPD-Staf','DPD-Stan'
	  ,'DPD-UK L')
*/
AND whsshipmenttable.shipmentid IN ('SHP-4005861','SHP-4005862')