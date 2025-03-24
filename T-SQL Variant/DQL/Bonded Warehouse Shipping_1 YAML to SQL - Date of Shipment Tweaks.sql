
SELECT
	'SHIPMENT' 'Shipment Level No'
	,whscontainertable.shipmentid 'Shipment Reference'
	,whscontainertable.closecontainerutcdatetime 'Date of Shipment'

	,DATENAME(WEEKDAY,whscontainertable.closecontainerutcdatetime) DayOfWeekName
	,CASE WHEN DATENAME(WEEKDAY, whscontainertable.closecontainerutcdatetime) = 'Saturday' THEN DATEADD(DD, 2 , whscontainertable.closecontainerutcdatetime) 
		  WHEN DATENAME(WEEKDAY, whscontainertable.closecontainerutcdatetime) = 'Sunday' THEN DATEADD(DD, 1 , whscontainertable.closecontainerutcdatetime) 
		  WHEN DATENAME(WEEKDAY, whscontainertable.closecontainerutcdatetime) = 'Friday' AND DATEPART(hh, whscontainertable.closecontainerutcdatetime) BETWEEN 18 AND 24 THEN DATEADD(DD, 3 , whscontainertable.closecontainerutcdatetime) 
			  ELSE whscontainertable.closecontainerutcdatetime END test

	,CASE WHEN DATENAME(WEEKDAY, whscontainertable.closecontainerutcdatetime) = 'Saturday' THEN 'Date +2'
		  WHEN DATENAME(WEEKDAY, whscontainertable.closecontainerutcdatetime) = 'Sunday' THEN 'Date +1'
		  WHEN DATENAME(WEEKDAY, whscontainertable.closecontainerutcdatetime) = 'Friday' AND DATEPART(hh, whscontainertable.closecontainerutcdatetime) BETWEEN 18 AND 24 THEN 'Date +3'
			  ELSE '-' END test_scenario


	,'EXPORT' 'Project Key'
	,CASE WHEN salestable.salestype = 3 THEN '1' ELSE '2' END 'NOTC A'
	,CASE WHEN salestable.salestype = 3 THEN '1' ELSE '9' END 'NOTC B'
	,CASE WHEN transportidlookup.Shippingcarrierservice IS NULL THEN whsshipmenttable.hslbordertransportid
      ELSE transportidlookup.Bordertransportid END 'Border Transport ID'
	,CASE WHEN transportidlookup.Shippingcarrierservice IS NULL THEN whsshipmenttable.hslbordertransportnationality
      ELSE transportidlookup.Bordertransportnationality END  'Border Transport Nationality'
	,CASE WHEN transportidlookup.Shippingcarrierservice IS NULL THEN whsshipmenttable.hslinlandtransportid
      ELSE transportidlookup.Inlandtransportid END  'Inland Transport ID'
	,REPLACE(REPLACE(whsshipmenttable.hslmovementkey, ' ', ''),'-','_') 'Movement Key'
	,CASE WHEN custtable.custgroup IN ('Interco', '3rd Party','RTV') THEN 'B2B' ELSE 'B2C' END 'Transaction Type'
	,whsshipmenttable.shipmentid 'Key'
	,'-' '||'
	,transportidlookup.* 
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
--AND whscontainertable.closecontainerutcdatetime > GETDATE()-7

AND 
	salestable.dlvmode NOT IN 
	  ('DPD-2-3','DPD-DPD','DPD-Econ','DPD-Fre1','DPD-Fre2','DPD-Fre3','DPD-Fre4','DPD-Fre5'
	  ,'DPD-Fre6','DPD-Fre7','DPD-Fre8','DPD-Free','DPD-Laun','DPD-Next','DPD-Prio','DPD-ROI'
	  ,'DPD-Sta1','DPD-Sta2','DPD-Sta3','DPD-Sta4','DPD-Sta5','DPD-Sta6','DPD-Staf','DPD-Stan'
	  ,'DPD-UK L')

AND whscontainertable.shipmentid IN ('SHP-0313045','SHP-0315335','SHP-0749086','SHP-0317263','SHP-0711592','SHP-0184744','SHP-0444901','SHP-0242231','SHP-0788263')

ORDER BY DATEPART(WEEKDAY, whscontainertable.closecontainerutcdatetime) ASC