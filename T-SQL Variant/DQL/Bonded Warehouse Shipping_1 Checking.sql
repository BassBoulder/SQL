

SELECT s.shipmentid, carrierservicecode, Shippingcarrierservice, Bordertransportid, Inlandtransportid
,
CASE WHEN transportidlookup.Shippingcarrierservice IS NULL THEN s.hslbordertransportid
      ELSE transportidlookup.Bordertransportid END 'Border Transport ID'
,
CASE WHEN transportidlookup.Shippingcarrierservice IS NULL THEN s.hslbordertransportnationality
      ELSE transportidlookup.Bordertransportnationality END 'Border Transport Nationality'
,
CASE WHEN transportidlookup.Shippingcarrierservice IS NULL THEN s.hslinlandtransportid
      ELSE transportidlookup.Inlandtransportid END 'Inland Transport ID'

FROM whsshipmenttable s
INNER JOIN whscontainertable c ON s.shipmentid = c.shipmentid AND c.containerstatus = '2'
LEFT JOIN transportidlookup ON s.carrierservicecode = transportidlookup.Shippingcarrierservice

INNER JOIN 
	salestable ON s.ordernum = salestable.salesid AND s.dataareaid = salestable.dataareaid
INNER JOIN 
	custtable ON salestable.custaccount = custtable.accountnum
LEFT JOIN 
	logisticspostaladdress ON salestable.deliverypostaladdress = logisticspostaladdress.recid
LEFT JOIN 
	logisticsaddresscountryregion ON logisticspostaladdress.countryregionid = logisticsaddresscountryregion.countryregionid

WHERE
	c.dataareaid IN ('end.', 'END.')
AND 
	logisticspostaladdress.validfrom <= GETDATE()
AND 
	logisticspostaladdress.validto > GETDATE()
AND 
	c.containerstatus = 2
AND 
	s.shipmentstatus = 5
AND 
	logisticspostaladdress.countryregionid != 'GBR'
AND 
	salestable.dlvmode NOT IN 
	  ('DPD-2-3','DPD-DPD','DPD-Econ','DPD-Fre1','DPD-Fre2','DPD-Fre3','DPD-Fre4','DPD-Fre5'
	  ,'DPD-Fre6','DPD-Fre7','DPD-Fre8','DPD-Free','DPD-Laun','DPD-Next','DPD-Prio','DPD-ROI'
	  ,'DPD-Sta1','DPD-Sta2','DPD-Sta3','DPD-Sta4','DPD-Sta5','DPD-Sta6','DPD-Staf','DPD-Stan'
	  ,'DPD-UK L')