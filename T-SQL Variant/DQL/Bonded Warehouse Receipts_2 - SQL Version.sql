
SELECT
	 '2' AS 'Record Type'
	,'ENDCTG' AS 'Company Code'
	,'PEIM' AS 'Receipt Type'
	,whsloadtable.loadid AS 'Receipt Ref'
	,whsloadtable.loadshipconfirmutcdatetime AS 'Receipt Date'
	,concat_ws('-', purchtable.orderaccount, hslcommercialinvoice.commercialinvoiceid) AS 'Invoice Key'
	,purchtable.orderaccount AS 'Supplier Reference'
	,dirpartytable.name AS 'Supplier name'
	,sum(hslcommercialinvoice.value) AS 'Invoice Value'
	,hslcommercialinvoice.currency AS 'Invoice Currency'
	,hslcommercialinvoice.termsduty AS 'Trade Terms'
	,hslcommercialinvoice.insurancecharges AS 'Insurance Charges'
	,hslcommercialinvoice.insurancechargescurrency AS 'Insurance Charges currency'
	,hslcommercialinvoice.locationname AS 'Location Name'
	,CASE WHEN purchtable.purchasetype = 3 THEN '1' WHEN purchtable.purchasetype
      = 4 THEN '2' ELSE '1' END AS 'NOTC(a)'
	,'1' AS 'NOTC(b)'
	,concat_ws('||',hslcommercialinvoice.bookingreference , hslcommercialinvoice.commercialinvoiceid) AS 'Key'
	,hslcommercialinvoice.commercialinvoiceid AS 'Level_Key'
	,hslcommercialinvoice.bookingreference AS 'Parent_Key'

FROM 
	hslcommercialinvoice

LEFT JOIN whsloadtable
	ON hslcommercialinvoice.bookingreference = whsloadtable.hslcomminvbookingreference
	AND hslcommercialinvoice.dataareaid = whsloadtable.dataareaid

LEFT JOIN purchtable
	ON hslcommercialinvoice.purchaseorder = purchtable.purchid
	AND hslcommercialinvoice.dataareaid = purchtable.dataareaid

LEFT JOIN vendtable
	ON purchtable.orderaccount = vendtable.accountnum
	AND purchtable.dataareaid = vendtable.dataareaid

LEFT JOIN dirpartytable
	ON vendtable.party = dirpartytable.recid
	AND vendtable.dataareaid = dirpartytable.dataareaid

WHERE
	whsloadtable.hslcomminvbookingreference != ''
AND
	whsloadtable.dataareaid IN ('end.', 'END.')
AND
	whsloadtable.loadstatus != 0

GROUP BY
	 whsloadtable.loadid
	,whsloadtable.loadshipconfirmutcdatetime
	,concat_ws('-', purchtable.orderaccount, hslcommercialinvoice.commercialinvoiceid)
	,purchtable.orderaccount
	,dirpartytable.name
	,hslcommercialinvoice.currency
	,hslcommercialinvoice.termsduty
	,hslcommercialinvoice.insurancecharges
	,hslcommercialinvoice.insurancechargescurrency
	,hslcommercialinvoice.locationname
	,CASE WHEN purchtable.purchasetype = 3 THEN '1' WHEN purchtable.purchasetype
      = 4 THEN '2' ELSE '1' END
	,concat_ws('||',hslcommercialinvoice.bookingreference , hslcommercialinvoice.commercialinvoiceid)
	,hslcommercialinvoice.commercialinvoiceid
	,hslcommercialinvoice.bookingreference
