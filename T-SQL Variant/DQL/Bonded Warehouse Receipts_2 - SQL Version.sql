SELECT
     '2' AS Record_Type
    ,'ENDCTG' AS Company_Code
    ,whsloadtable.loadid AS Receipt_Ref
    ,whsloadtable.loadshipconfirmutcdatetime AS Receipt_Date
    ,'PEIM' AS Receipt_Type
    ,concat_ws('-', purchtable.orderaccount, hslcommercialinvoice.commercialinvoiceid) AS Invoice_Key
    ,'' AS Invoice_Reference
    ,purchtable.orderaccount AS Supplier_Reference
    ,dirpartytable.name AS Supplier_Name
    ,'' AS Invoice_Charges
    ,sum(hslcommercialinvoice.value) AS Invoice_Value
    ,hslcommercialinvoice.currency AS Invoice_Currency
    ,hslcommercialinvoice.termsduty AS Trade_Terms
    ,'' AS Cash_Discount
    ,'' AS Invoice_Net_Weight
    ,'' AS Weight_Code
    ,'' AS Freight_Charges
    ,'' AS Freight_Charges_Currency
    ,'' AS Basis_of_Freight
    ,'' AS Air_Freight_Charges
    ,'' AS Air_Freight_Charges_Currency
    ,'' AS Basic_of_Air_Freight
    ,hslcommercialinvoice.insurancecharges AS Insurance_Charges
    ,hslcommercialinvoice.insurancechargescurrency AS Insurance_Charges_Currency
    ,'' AS Commission_Value
    ,'' AS Commission_Currency
    ,'' AS Basis_of_Commission
    ,'' AS Post_Importation_Charges
    ,'' AS Post_Importation_Currency
    ,'' AS Post_Importation_Basis
    ,'' AS Container_Number
    ,'' AS Gross_Weight
    ,'' AS Sell_Code
    ,hslcommercialinvoice.locationname AS Location_Name

    ,CASE WHEN purchtable.purchasetype = 3 THEN '1' 
          WHEN purchtable.purchasetype = 4 THEN '2' 
          ELSE '1' 
     END AS NOTC_a

    ,'1' AS NOTC_b
    ,'' AS Country_of_Consignment
    ,concat_ws('||', hslcommercialinvoice.bookingreference, hslcommercialinvoice.commercialinvoiceid) AS Key
    ,hslcommercialinvoice.commercialinvoiceid AS Level_Key
    ,hslcommercialinvoice.bookingreference AS Parent_Key

FROM hslcommercialinvoice

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

WHERE whsloadtable.hslcomminvbookingreference != ''
  AND whsloadtable.dataareaid IN ('end.', 'END.')
  AND whsloadtable.loadstatus != 0

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
    ,CASE WHEN purchtable.purchasetype = 3 THEN '1' 
          WHEN purchtable.purchasetype = 4 THEN '2' 
          ELSE '1' 
     END
    ,concat_ws('||', hslcommercialinvoice.bookingreference, hslcommercialinvoice.commercialinvoiceid)
    ,hslcommercialinvoice.commercialinvoiceid
    ,hslcommercialinvoice.bookingreference