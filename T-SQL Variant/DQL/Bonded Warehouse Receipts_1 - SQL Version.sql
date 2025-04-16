SELECT
     '1' AS Record_Type
    ,'ENDCTG' AS Company_Code
    ,whsloadtable.loadid AS Receipt_Reference
    ,whsloadtable.loadshipconfirmutcdatetime AS Receipt_Date
    ,'PEIM' AS Receipt_Type
    ,hslcommercialinvoice.portairportofarrival AS Port_Airport_Of_Arrival
    ,hslcommercialinvoice.airportofdeparture AS Airport_Of_Departure
    ,hslcommercialinvoice.nationality AS Nationality
    ,'' AS Inland_Depot
    ,'' AS Container_ID
    ,hslcommercialinvoice.modeoftransport AS Mode_Of_Transport
    ,'3' AS Inland_Mode_Of_Transport
    ,SUM(hslcommercialinvoice.value) AS Total_Value
    ,hslcommercialinvoice.numberofpackages AS Number_Of_Packages
    ,'' AS Volume_Cubic_Metres
    ,SUM(hslcommercialinvoice.grossweight) AS Gross_Weight
    ,'' AS Agent
    ,'' AS Carrier
    ,hslcommercialinvoice.freightcharges AS Freight
    ,hslcommercialinvoice.freightchargescurrency AS Freight_Currency
    ,hslcommercialinvoice.freightbasis AS Freight_Basis
    ,'' AS Air_Freight
    ,'' AS Air_Freight_Currency
    ,'' AS Air_Freight_Basis
    ,hslcommercialinvoice.shippeddate AS Shipped_Date
    ,'' AS Date_Of_Arrival
    ,'' AS Voyage_Reference
    ,'' AS Ships_Name
    ,'' AS Post_Importation_Charges
    ,'' AS Post_Importation_Currency
    ,'' AS Post_Importation_Basis
    ,'' AS Container_Number
    ,hslcommercialinvoice.arrivaltransportidtype AS Arrival_Transport_ID_Type
    ,hslcommercialinvoice.arrivaltransportid AS Arrival_Transport_ID
    ,hslcommercialinvoice.mrn AS MRN
    ,'' AS Previous_Document_Ref
    ,'' AS Previous_Document_Type
    ,hslcommercialinvoice.bookingreference AS 'Key'
    ,hslcommercialinvoice.bookingreference AS Level_Key
    ,'' AS Parent_Key

FROM hslcommercialinvoice

LEFT JOIN whsloadtable
    ON hslcommercialinvoice.bookingreference = whsloadtable.hslcomminvbookingreference
    AND hslcommercialinvoice.dataareaid = whsloadtable.dataareaid

WHERE
    whsloadtable.hslcomminvbookingreference != ''
    AND whsloadtable.dataareaid IN ('end.', 'END.')
    AND whsloadtable.loadstatus != '0'

GROUP BY
     whsloadtable.loadid
    ,whsloadtable.loadshipconfirmutcdatetime
    ,hslcommercialinvoice.portairportofarrival
    ,hslcommercialinvoice.airportofdeparture
    ,hslcommercialinvoice.nationality
    ,hslcommercialinvoice.modeoftransport
    ,hslcommercialinvoice.numberofpackages
    ,hslcommercialinvoice.freightcharges
    ,hslcommercialinvoice.freightchargescurrency
    ,hslcommercialinvoice.freightbasis
    ,hslcommercialinvoice.arrivaltransportidtype
    ,hslcommercialinvoice.arrivaltransportid
    ,hslcommercialinvoice.mrn
    ,hslcommercialinvoice.bookingreference
    ,hslcommercialinvoice.shippeddate