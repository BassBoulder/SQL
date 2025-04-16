
SELECT
	 '3' AS 'Record Type'
	,'ENDCTG' AS 'Company Code'
	,'' AS 'Site Code'
	,whsloadtable.loadid AS 'Receipt Ref'
	,'PEIM' AS 'Receipt Type'
	,whsloadtable.loadshipconfirmutcdatetime AS 'Receipt Date'
	,concat_ws('-', purchtable.orderaccount, hslcommercialinvoice.commercialinvoiceid) 'Invoice Key'
	,hslcommercialinvoice.itemnumber AS 'Product Code'

	,concat_ws(
		'', ecoresproducttranslation.name , inventtable.endfabriccomposition,
		 CASE 
			WHEN inventtable.endmenswear = 1 and inventtable.endwomenswear = 1 THEN 'U'  
			WHEN inventtable.endmenswear = 1 THEN 'M'  WHEN inventtable.endwomenswear = 1 THEN 'F' 
		 ELSE '' 
		 END
	 ) AS 'Product Description'

	,hslcommercialinvoice.commoditycode AS 'Product tariff/commodity code'
	,vatgrouplookup.LangdonCode AS 'Product Vat rate identifier'
	,'' AS 'Product Unit Weight'
	,'BOND' AS 'Project Reference'
	,'' AS 'IPR Reference'
	,'' AS 'OPR Project Reference'
	,purchtable.purchid AS 'Order Reference'
	,hslcommercialinvoice.countryoforigin AS 'Country Of Origin'
	,hslcommercialinvoice.dispatchcountry AS 'Country of Consignment'
	,hslcommercialinvoice.invoicedqty AS 'Invoiced Quantity'
	,ecorescategoryintrastat.additionalunits AS 'Quantity Code'
	,hslcommercialinvoice.polinetotal AS'Item value'
	,hslcommercialinvoice.invoicedqty 'Recieved Quantity'
	,'' AS 'Licence Reference'
	,hslcommercialinvoice.preferencedocumenttype AS 'Preference Document type'
	,hslcommercialinvoice.preferencedocumentreference AS 'Preference document reference'
	,'' AS 'Item Net Weight'
	,'' AS 'Container Number'
	,'' AS 'Package Count'
	,'' AS 'Package Kind'
	,'' AS 'Package Marks & Numbers'
	,'' AS 'Seller Code'
	,hslcommercialinvoice.preferencecountry AS 'Preference'
    ,hslcommercialinvoice.preferencegroup AS 'Preference Group'
	,'' AS 'NOTC(a)'
	,'' AS 'NOTC(b)'
    ,hslcommercialinvoice.preferencedocumentcode 'Preference Document Code'
    ,hslcommercialinvoice.preferencedocumentstatuscode AS 'Preference Document Status Code'
	,concat_ws('||',hslcommercialinvoice.bookingreference , hslcommercialinvoice.commercialinvoiceid , hslcommercialinvoice.recid) AS 'Key'
    ,hslcommercialinvoice.recid AS 'Level_Key'
    ,hslcommercialinvoice.commercialinvoiceid AS 'Parent_Key'

FROM
	hslcommercialinvoice

LEFT JOIN whsloadtable
	ON hslcommercialinvoice.bookingreference = whsloadtable.hslcomminvbookingreference
	AND hslcommercialinvoice.dataareaid = whsloadtable.dataareaid

LEFT JOIN purchtable
	ON hslcommercialinvoice.purchaseorder = purchtable.purchid
	AND hslcommercialinvoice.dataareaid = purchtable.dataareaid

LEFT JOIN inventtable
	ON hslcommercialinvoice.itemnumber = inventtable.itemid
	AND hslcommercialinvoice.dataareaid = inventtable.dataareaid

LEFT JOIN ecoresproducttranslation
	ON inventtable.product = ecoresproducttranslation.product

LEFT JOIN inventtablemodule
	ON inventtable.itemid = inventtablemodule.itemid
	AND inventtable.dataareaid = inventtablemodule.dataareaid
	AND inventtablemodule.moduletype = 1

LEFT JOIN vatgrouplookup
	ON inventtablemodule.taxitemgroupid = vatgrouplookup.ItemVATgroup

LEFT JOIN ecorescategoryintrastat
	ON inventtable.intrastatcommodity = ecorescategoryintrastat.category

WHERE
	whsloadtable.hslcomminvbookingreference != ''
AND
	whsloadtable.dataareaid IN ('end.','END.')
AND
	whsloadtable.loadstatus != '0'

--to investigate, not needed in action:
AND loadid = 'LD-3825365'