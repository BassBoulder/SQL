--join_operation:
--  aggregations:
--  - column: Record Type
--    value: GR
--  - column: Company Code
--    value: GR
--  - column: Receipt Reference
--    value: min
--  - column: Receipt Date
--    value: min
--  - column: Receipt Type
--    value: GR
--  - column: Port/Airport of Arrival
--    value: min
--  - column: Airport of Departure
--    value: GR
--  - column: Nationality
--    value: min
--  - column: Inland Depot
--    value: GR
--  - column: Container ID
--    value: GR
--  - column: Mode of Transport
--    value: min
--  - column: Inland Mode of Transport
--    value: GR
--  - column: Total Value
--    value: sum
--  - column: No. of Packages
--    value: min
--  - column: Volume (cubic metres)
--    value: GR
--  - column: Gross Weight
--    value: sum
--  - column: Agent
--    value: GR
--  - column: Carrier
--    value: GR
--  - column: Freight
--    value: min
--  - column: Freight currency
--    value: min
--  - column: Freight basis
--    value: min
--  - column: Air Freight
--    value: GR
--  - column: Air Freight Currency
--    value: GR
--  - column: Air Freight basis
--    value: GR
--  - column: Shipped Date
--    value: GR
--  - column: Date of Arrival
--    value: GR
--  - column: Voyage Reference
--    value: GR
--  - column: Ships Name
--    value: GR
--  - column: Post Importation Charges
--    value: GR
--  - column: Post Importation currency
--    value: GR
--  - column: Post Importation basis
--    value: GR
--  - column: Container Number
--    value: GR
--  - column: Arrival Transport ID Type
--    value: min
--  - column: Arrival Transport ID
--    value: min
--  - column: MRN
--    value: min
--  - column: Previous Document Ref
--    value: GR
--  - column: Previous Document Type
--    value: GR
--  - column: Key
--    value: GR
--  - column: Level_Key
--    value: GR
--  - column: Parent_Key
--    value: GR
--  calculations:
--  - column: Key
--    value: hslcommercialinvoice.bookingreference
--  date_filter_column: []
--  filter_criteria:
--  - column: whsloadtable.hslcomminvbookingreference
--    operator: '!='
--    value: ''''''
--  - column: whsloadtable.dataareaid
--    operator: isin
--    value: '[''end.'', ''END.'']'
--  - column: whsloadtable.loadstatus
--    operator: '!='
--    value: '0'
--  fixed_columns:
--  - column: Record Type
--    value: '1'
--  - column: Company Code
--    value: ENDCTG
--  - column: Receipt Type
--    value: PEIM
--  - column: Airport of Departure
--    value: ''
--  - column: Inland Depot
--    value: ''
--  - column: Container ID
--    value: ''
--  - column: Inland Mode of Transport
--    value: '3'
--  - column: Volume (cubic metres)
--    value: ''
--  - column: Agent
--    value: ''
--  - column: Carrier
--    value: ''
--  - column: Air Freight
--    value: ''
--  - column: Air Freight Currency
--    value: ''
--  - column: Air Freight basis
--    value: ''
--  - column: Shipped Date
--    value: ''
--  - column: Date of Arrival
--    value: ''
--  - column: Voyage Reference
--    value: ''
--  - column: Ships Name
--    value: ''
--  - column: Post Importation Charges
--    value: ''
--  - column: Post Importation currency
--    value: ''
--  - column: Post Importation basis
--    value: ''
--  - column: Container Number
--    value: ''
--  - column: Previous Document Ref
--    value: ''
--  - column: Previous Document Type
--    value: ''
--  - column: Parent_Key
--    value: ''
--  joins:
--  - left_table: hslcommercialinvoice
--    on_conditions:
--    - hslcommercialinvoice.bookingreference = whsloadtable.hslcomminvbookingreference
--    - hslcommercialinvoice.dataareaid = whsloadtable.dataareaid
--    right_table: ' whsloadtable'
--    type: left
--  select_columns:
--  - alias: Record Type
--    column: Record Type
--  - alias: Company Code
--    column: Company Code
--  - alias: Receipt Reference
--    column: whsloadtable.loadid
--  - alias: Receipt Date
--    column: whsloadtable.loadshipconfirmutcdatetime
--  - alias: Receipt Type
--    column: Receipt Type
--  - alias: Port/Airport of Arrival
--    column: hslcommercialinvoice.portairportofarrival
--  - alias: Airport of Departure
--    column: Airport of Departure
--  - alias: Nationality
--    column: hslcommercialinvoice.nationality
--  - alias: Inland Depot
--    column: Inland Depot
--  - alias: Container ID
--    column: Container ID
--  - alias: Mode of Transport
--    column: hslcommercialinvoice.modeoftransport
--  - alias: Inland Mode of Transport
--    column: Inland Mode of Transport
--  - alias: Total Value
--    column: hslcommercialinvoice.value
--  - alias: No. of Packages
--    column: hslcommercialinvoice.numberofpackages
--  - alias: Volume (cubic metres)
--    column: Volume (cubic metres)
--  - alias: Gross Weight
--    column: hslcommercialinvoice.grossweight
--  - alias: Agent
--    column: Agent
--  - alias: Carrier
--    column: Carrier
--  - alias: Freight
--    column: hslcommercialinvoice.freightcharges
--  - alias: Freight currency
--    column: hslcommercialinvoice.freightchargescurrency
--  - alias: Freight basis
--    column: hslcommercialinvoice.freightbasis
--  - alias: Air Freight
--    column: Air Freight
--  - alias: Air Freight Currency
--    column: Air Freight Currency
--  - alias: Air Freight basis
--    column: Air Freight basis
--  - alias: Shipped Date
--    column: Shipped Date
--  - alias: Date of Arrival
--    column: Date of Arrival
--  - alias: Voyage Reference
--    column: Voyage Reference
--  - alias: Ships Name
--    column: Ships Name
--  - alias: Post Importation Charges
--    column: Post Importation Charges
--  - alias: Post Importation currency
--    column: Post Importation currency
--  - alias: Post Importation basis
--    column: Post Importation basis
--  - alias: Container Number
--    column: Container Number
--  - alias: Arrival Transport ID Type
--    column: hslcommercialinvoice.arrivaltransportidtype
--  - alias: Arrival Transport ID
--    column: hslcommercialinvoice.arrivaltransportid
--  - alias: MRN
--    column: hslcommercialinvoice.mrn
--  - alias: Previous Document Ref
--    column: Previous Document Ref
--  - alias: Previous Document Type
--    column: Previous Document Type
--  - alias: Key
--    column: Key_calc
--  - alias: Level_Key
--    column: hslcommercialinvoice.bookingreference
--  - alias: Parent_Key
--    column: Parent_Key
--  tables:
--  - alias: hslcommercialinvoice
--    name: hslcommercialinvoice
--    sql: ''
--  - alias: whsloadtable
--    name: whsloadtable
--    sql: ''
--  target_data_type:
--  - column: Receipt Date
--    value: dd-MM-yyyy
--  - column: Total Value
--    value: DecimalType(9, 4)
--  - column: Gross Weight
--    value: DecimalType(10, 4)
--  - column: Freight
--    value: DecimalType(10, 4)


SELECT
	'1' 'Record Type'
	,'ENDCTG' 'Company Code'
	,whsloadtable.loadid 'Receipt Reference'
	,whsloadtable.loadshipconfirmutcdatetime 'Receipt Date'
	,'PEIM' 'Receipt Type'
	,hslcommercialinvoice.portairportofarrival 'Port/Airport of Arrival'
	,'Airport of Departure'
	,hslcommercialinvoice.nationality 'Nationality'
	,'' 'Inland Depot'
	,'' 'Container ID'
	,hslcommercialinvoice.modeoftransport 'Mode of Transport'
	,'3' 'Inland Mode of Transport'
	,SUM(hslcommercialinvoice.value) 'Total Value'
	,hslcommercialinvoice.numberofpackages 'No. of Packages'
	,'' 'Volume (cubic metres)'
	,SUM(hslcommercialinvoice.grossweight) 'Gross Weight'
	,'' 'Agent'
	,'' 'Carrier'
	,hslcommercialinvoice.freightcharges 'Freight'
	,hslcommercialinvoice.freightchargescurrency 'Freight currency'
	,hslcommercialinvoice.freightbasis 'Freqight basis'
	,'' 'Air Freight'
	,'' 'Air Freight Currency'
	,'' 'Air Freight basis'
	,'' 'Shipped Date'
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
	loadid = 'LD-3798936'

GROUP BY
	 whsloadtable.loadid
	,whsloadtable.loadshipconfirmutcdatetime
	,hslcommercialinvoice.portairportofarrival
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
	,hslcommercialinvoice.bookingreference
