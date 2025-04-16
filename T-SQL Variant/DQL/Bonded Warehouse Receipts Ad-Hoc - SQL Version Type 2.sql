SELECT
	 whsloadtable.loadid 'Receipt Reference'
	,whsloadtable.ordernum
	,hslcommercialinvoice.purchaseorder
	,hslcommercialinvoice.bookingreference
	,whsloadtable.hslcomminvbookingreference
	,hslcommercialinvoice.polinetotal
	,hslcommercialinvoice.locationname
	,hslcommercialinvoice.nationality
	,hslcommercialinvoice.preferencedocumentstatuscode
	,hslcommercialinvoice.preferencedocumenttype
	,hslcommercialinvoice.countryoforigin
	,hslcommercialinvoice.shippeddate 'Shipped Date'

	,whsloadtable.loadshipconfirmutcdatetime 'Receipt Date'
	,'PEIM' 'Receipt Type'
	,hslcommercialinvoice.portairportofarrival 'Port/Airport of Arrival'
	,hslcommercialinvoice.airportofdeparture 'Airport of Departure'
	,hslcommercialinvoice.nationality 'Nationality'
	,'' 'Inland Depot'
	,'' 'Container ID'
	,hslcommercialinvoice.modeoftransport 'Mode of Transport'
	,'3' 'Inland Mode of Transport'
	,hslcommercialinvoice.value 'Total Value'
	,hslcommercialinvoice.numberofpackages 'No. of Packages'
	,'' 'Volume (cubic metres)'
	,hslcommercialinvoice.grossweight 'Gross Weight'
	,'' 'Agent'
	,'' 'Carrier'
	,hslcommercialinvoice.freightcharges 'Freight'
	,hslcommercialinvoice.freightchargescurrency 'Freight currency'
	,hslcommercialinvoice.freightbasis 'Freqight basis'
	,'' 'Air Freight'
	,'' 'Air Freight Currency'
	,'' 'Air Freight basis'

	,'' 'Date of Arrival'
	,'' 'Voyage Reference'
	,'' 'Ships Name'
	,'' 'Post Importation Charges'
	,'' 'Post Importation currency'
	,'' 'Post Importation basis'
	,'' 'Container Number'
	,hslcommercialinvoice.arrivaltransportidtype 'Arrival Transport ID Type'
	,hslcommercialinvoice.arrivaltransportid 'Arrival Transport ID'
	,hslcommercialinvoice.mrn 'MRN'
	,'' 'Previous Document Ref'
	,'' 'Previous Document Type'
	,hslcommercialinvoice.bookingreference 'Key'
	,hslcommercialinvoice.bookingreference 'Level_Key'

FROM
	hslcommercialinvoice

LEFT JOIN whsloadtable ON
	hslcommercialinvoice.bookingreference = whsloadtable.hslcomminvbookingreference
	AND hslcommercialinvoice.dataareaid = whsloadtable.dataareaid

WHERE
	whsloadtable.hslcomminvbookingreference != ''
AND
	whsloadtable.dataareaid IN ('end.','END.')
AND
	whsloadtable.loadstatus != '0'
AND
	loadid = 'LD-3825365'
