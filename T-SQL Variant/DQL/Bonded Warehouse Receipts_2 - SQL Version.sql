










join_operation:
  aggregations:
  - column: Record Type
    value: GR
  - column: Company Code
    value: GR
  - column: Receipt Ref
    value: min
  - column: Receipt Date
    value: min
  - column: Receipt Type
    value: GR
  - column: Invoice Key
    value: min
  - column: Invoice Reference
    value: GR
  - column: Supplier Reference
    value: min
  - column: Supplier name
    value: min
  - column: Invoice Charges
    value: GR
  - column: Invoice Value
    value: sum
  - column: Invoice Currency
    value: min
  - column: Trade Terms
    value: min
  - column: Cash Discount
    value: GR
  - column: Invoice net weight
    value: GR
  - column: Weight code
    value: GR
  - column: Freight Charges
    value: GR
  - column: Freight Charges Currency
    value: GR
  - column: Basis of freight
    value: GR
  - column: Air Freight Charges
    value: GR
  - column: Air Freight Charges Currency
    value: GR
  - column: Basis of Air Freight
    value: GR
  - column: Insurance Charges
    value: min
  - column: Insurance Charges currency
    value: min
  - column: Commission Value
    value: GR
  - column: Commission Currency
    value: GR
  - column: Basis of Commission
    value: GR
  - column: Post Importation Charges
    value: GR
  - column: Post Importation Currency
    value: GR
  - column: Post Importation Basis
    value: GR
  - column: Container Number
    value: GR
  - column: Gross Weight
    value: sum
  - column: Seller code
    value: GR
  - column: Location Name
    value: min
  - column: NOTC(a)
    value: GR
  - column: NOTC(b)
    value: GR
  - column: Country of Consignment
    value: GR
  - column: Key
    value: GR
  - column: Level_Key
    value: GR
  - column: Parent_Key
    value: GR
  calculations:
  - column: Invoice Key
    value: concat_ws("-", purchtable.orderaccount, hslcommercialinvoice.commercialinvoiceid)
  - column: NOTC(a)
    value: CASE WHEN purchtable.purchasetype = 3 THEN "1" WHEN purchtable.purchasetype
      = 4 THEN "2" ELSE "1" END
  - column: Key
    value: concat_ws("||",hslcommercialinvoice.bookingreference , hslcommercialinvoice.commercialinvoiceid)
  date_filter_column: []
  filter_criteria:
  - column: whsloadtable.hslcomminvbookingreference
    operator: '!='
    value: ''''''
  - column: whsloadtable.dataareaid
    operator: isin
    value: '[''end.'', ''END.'']'
  - column: whsloadtable.loadstatus
    operator: '!='
    value: '0'
  fixed_columns:
  - column: Record Type
    value: '2'
  - column: Company Code
    value: ENDCTG
  - column: Receipt Type
    value: PEIM
  - column: Invoice Reference
    value: ''
  - column: Invoice Charges
    value: ''
  - column: Cash Discount
    value: ''
  - column: Invoice net weight
    value: ''
  - column: Weight code
    value: ''
  - column: Freight Charges
    value: ''
  - column: Freight Charges Currency
    value: ''
  - column: Basis of freight
    value: ''
  - column: Air Freight Charges
    value: ''
  - column: Air Freight Charges Currency
    value: ''
  - column: Basis of Air Freight
    value: ''
  - column: Commission Value
    value: ''
  - column: Commission Currency
    value: ''
  - column: Basis of Commission
    value: ''
  - column: Post Importation Charges
    value: ''
  - column: Post Importation Currency
    value: ''
  - column: Post Importation Basis
    value: ''
  - column: Container Number
    value: ''
  - column: Seller code
    value: ''
  - column: NOTC(a)_calc
    value: NULL:'1'
  - column: NOTC(b)
    value: '1'
  - column: Country of Consignment
    value: ''
  joins:
  - left_table: hslcommercialinvoice
    on_conditions:
    - hslcommercialinvoice.bookingreference = whsloadtable.hslcomminvbookingreference
    - hslcommercialinvoice.dataareaid = whsloadtable.dataareaid
    right_table: ' whsloadtable'
    type: left
  - left_table: hslcommercialinvoice
    on_conditions:
    - hslcommercialinvoice.purchaseorder = purchtable.purchid
    - hslcommercialinvoice.dataareaid = purchtable.dataareaid
    right_table: ' purchtable'
    type: left
  - left_table: purchtable
    on_conditions:
    - purchtable.orderaccount = vendtable.accountnum
    - purchtable.dataareaid = vendtable.dataareaid
    right_table: ' vendtable'
    type: left
  - left_table: vendtable
    on_conditions:
    - vendtable.party = dirpartytable.recid
    - vendtable.dataareaid = dirpartytable.dataareaid
    right_table: ' dirpartytable'
    type: left
  select_columns:
  - alias: Record Type
    column: Record Type
  - alias: Company Code
    column: Company Code
  - alias: Receipt Ref
    column: whsloadtable.loadid
  - alias: Receipt Date
    column: whsloadtable.loadshipconfirmutcdatetime
  - alias: Receipt Type
    column: Receipt Type
  - alias: Invoice Key
    column: Invoice Key_calc
  - alias: Invoice Reference
    column: Invoice Reference
  - alias: Supplier Reference
    column: purchtable.orderaccount
  - alias: Supplier name
    column: dirpartytable.name
  - alias: Invoice Charges
    column: Invoice Charges
  - alias: Invoice Value
    column: hslcommercialinvoice.value
  - alias: Invoice Currency
    column: hslcommercialinvoice.currency
  - alias: Trade Terms
    column: hslcommercialinvoice.termsduty
  - alias: Cash Discount
    column: Cash Discount
  - alias: Invoice net weight
    column: Invoice net weight
  - alias: Weight code
    column: Weight code
  - alias: Freight Charges
    column: Freight Charges
  - alias: Freight Charges Currency
    column: Freight Charges Currency
  - alias: Basis of freight
    column: Basis of freight
  - alias: Air Freight Charges
    column: Air Freight Charges
  - alias: Air Freight Charges Currency
    column: Air Freight Charges Currency
  - alias: Basis of Air Freight
    column: Basis of Air Freight
  - alias: Insurance Charges
    column: hslcommercialinvoice.insurancecharges
  - alias: Insurance Charges currency
    column: hslcommercialinvoice.insurancechargescurrency
  - alias: Commission Value
    column: Commission Value
  - alias: Commission Currency
    column: Commission Currency
  - alias: Basis of Commission
    column: Basis of Commission
  - alias: Post Importation Charges
    column: Post Importation Charges
  - alias: Post Importation Currency
    column: Post Importation Currency
  - alias: Post Importation Basis
    column: Post Importation Basis
  - alias: Container Number
    column: Container Number
  - alias: Gross Weight
    column: hslcommercialinvoice.grossweight
  - alias: Seller code
    column: Seller code
  - alias: Location Name
    column: hslcommercialinvoice.locationname
  - alias: NOTC(a)
    column: NOTC(a)_calc
  - alias: NOTC(b)
    column: NOTC(b)
  - alias: Country of Consignment
    column: Country of Consignment
  - alias: Key
    column: Key_calc
  - alias: Level_Key
    column: hslcommercialinvoice.commercialinvoiceid
  - alias: Parent_Key
    column: hslcommercialinvoice.bookingreference
  tables:
  - alias: hslcommercialinvoice
    name: hslcommercialinvoice
    sql: ''
  - alias: whsloadtable
    name: whsloadtable
    sql: ''
  - alias: purchtable
    name: purchtable
    sql: ''
  - alias: vendtable
    name: vendtable
    sql: ''
  - alias: dirpartytable
    name: dirpartytable
    sql: ''
  target_data_type:
  - column: Receipt Date
    value: dd-MM-yyyy
  - column: Invoice Value
    value: DecimalType(9, 4)
  - column: Insurance Charges
    value: DecimalType(10, 4)
  - column: Gross Weight
    value: DecimalType(9, 4)
