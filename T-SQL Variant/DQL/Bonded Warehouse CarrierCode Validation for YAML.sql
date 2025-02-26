SELECT TOP 10 salestable.custaccount, whsshipmenttable.ordernum, salestable.salesid, whsshipmenttable.carrierservicecode, transportidlookup.Shippingcarrier FROM whsshipmenttable
INNER JOIN salestable ON whsshipmenttable.ordernum = salestable.salesid AND whsshipmenttable.dataareaid = salestable.dataareaid
LEFT JOIN transportidlookup ON whsshipmenttable.carrierservicecode = transportidlookup.Shippingcarrier
WHERE salestable.dlvmode not in ('DPD-2-3','DPD-DPD','DPD-Econ','DPD-Fre1','DPD-Fre2','DPD-Fre3','DPD-Fre4','DPD-Fre5','DPD-Fre6','DPD-Fre7','DPD-Fre8','DPD-Free','DPD-Laun','DPD-Next','DPD-Prio','DPD-ROI','DPD-Sta1','DPD-Sta2','DPD-Sta3','DPD-Sta4','DPD-Sta5','DPD-Sta6','DPD-Staf','DPD-Stan','DPD-UK L')


SELECT TOP 10 whsshipmenttable.carrierservicecode, transportidlookup.Shippingcarrier ,whsshipmenttable.* FROM whsshipmenttable
LEFT JOIN transportidlookup ON whsshipmenttable.carrierservicecode = transportidlookup.Shippingcarrier