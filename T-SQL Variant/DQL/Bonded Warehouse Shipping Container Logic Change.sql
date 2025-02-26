SELECT * FROM whsshipmenttable s
INNER JOIN whscontainertable c ON s.shipmentid = c.shipmentid AND c.containerstatus = '2'
--WHERE c.containerstatus = '2'