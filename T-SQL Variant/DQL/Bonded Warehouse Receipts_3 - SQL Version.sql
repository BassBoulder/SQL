SELECT
     '3' AS Record_Type
    ,'ENDCTG' AS Company_Code
    ,'' AS Site_Code
    ,whsloadtable.loadid AS Receipt_Ref
    ,whsloadtable.loadshipconfirmutcdatetime AS Receipt_Date
    ,'PEIM' AS Receipt_Type
    ,hslcommercialinvoice.itemnumber AS Product_Code
    ,concat_ws('-', purchtable.orderaccount, hslcommercialinvoice.commercialinvoiceid) AS Invoice_Key

    ,concat_ws(
        '', 
        ecoresproducttranslation.name,
        inventtable.endfabriccomposition,
        CASE 
            WHEN inventtable.endmenswear = 1 AND inventtable.endwomenswear = 1 THEN 'U'
            WHEN inventtable.endmenswear = 1 THEN 'M'
            WHEN inventtable.endwomenswear = 1 THEN 'F'
            ELSE ''
        END
    ) AS Product_Description

    ,hslcommercialinvoice.commoditycode AS Product_Tariff_Commodity_Code
    ,vatgrouplookup.LangdonCode AS Product_VAT_Rate_Identifier
    ,'' AS Product_Unit_Weight
    ,'BOND' AS Project_Reference
    ,'' AS IPR_Reference
    ,'' AS OPR_Project_Reference
    ,purchtable.purchid AS Order_Reference
    ,hslcommercialinvoice.countryoforigin AS Country_Of_Origin
    ,hslcommercialinvoice.dispatchcountry AS Country_of_Consignment
    ,hslcommercialinvoice.invoicedqty AS Invoiced_Quantity
    ,ecorescategoryintrastat.additionalunits AS Quantity_Code
    ,hslcommercialinvoice.polinetotal AS Item_Value
    ,hslcommercialinvoice.invoicedqty AS Received_Quantity
    ,'' AS Licence_Reference
    ,hslcommercialinvoice.preferencedocumenttype AS Preference_Document_Type
    ,hslcommercialinvoice.preferencedocumentreference AS Preference_Document_Reference
    ,'' AS Item_Net_Weight
    ,'' AS Container_Number
    ,'' AS Package_Count
    ,'' AS Package_Kind
    ,'' AS Package_Marks_And_Numbers
    ,'' AS Gross_Weight
    ,'' AS Seller_Code
    ,hslcommercialinvoice.preferencecountry AS Preference
    ,hslcommercialinvoice.preferencegroup AS Preference_Group
    ,'' AS NOTC_a
    ,'' AS NOTC_b
    ,hslcommercialinvoice.preferencedocumentcode AS Preference_Document_Code
    ,hslcommercialinvoice.preferencedocumentstatuscode AS Preference_Document_Status_Code
    ,concat_ws('||', hslcommercialinvoice.bookingreference, hslcommercialinvoice.commercialinvoiceid, hslcommercialinvoice.recid) AS 'Key'
    ,hslcommercialinvoice.recid AS Level_Key
    ,hslcommercialinvoice.commercialinvoiceid AS Parent_Key

FROM hslcommercialinvoice

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
    AND whsloadtable.dataareaid IN ('end.', 'END.')
    AND whsloadtable.loadstatus != '0'