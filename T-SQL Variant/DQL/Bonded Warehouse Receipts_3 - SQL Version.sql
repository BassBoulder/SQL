










join_operation:
  aggregations: []
  calculations:
  - column: Invoice Key
    value: concat_ws("-", purchtable.orderaccount, hslcommercialinvoice.commercialinvoiceid)
  - column: Product Description
    value: concat_ws("", ecoresproducttranslation.name, inventtable.endfabriccomposition,
      CASE WHEN inventtable.endmenswear = 1 and inventtable.endwomenswear = 1 THEN
      "U"  WHEN inventtable.endmenswear = 1 THEN "M"  WHEN inventtable.endwomenswear
      = 1 THEN "F" ELSE "" END)
  - column: Key
    value: concat_ws("||",hslcommercialinvoice.bookingreference , hslcommercialinvoice.commercialinvoiceid,
      hslcommercialinvoice.recid)
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
    value: '3'
  - column: Company Code
    value: ENDCTG
  - column: Site Code
    value: ''
  - column: Receipt Type
    value: PEIM
  - column: Product Unit weight
    value: ''
  - column: Project reference
    value: BOND
  - column: IPR reference
    value: ''
  - column: OPR Project reference
    value: ''
  - column: Licence Reference
    value: ''
  - column: Item Net Weight
    value: ''
  - column: Container Number
    value: ''
  - column: Package Count
    value: ''
  - column: Package Kind
    value: ''
  - column: Package Marks & Numbers
    value: ''
  - column: Seller Code
    value: ''
  - column: NOTC(a)
    value: ''
  - column: NOTC(b)
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
  - left_table: hslcommercialinvoice
    on_conditions:
    - hslcommercialinvoice.itemnumber = inventtable.itemid
    - hslcommercialinvoice.dataareaid = inventtable.dataareaid
    right_table: ' inventtable'
    type: left
  - left_table: inventtable
    on_conditions:
    - inventtable.product = ecoresproducttranslation.product
    right_table: ' ecoresproducttranslation'
    type: left
  - left_table: inventtable
    on_conditions:
    - inventtable.itemid = inventtablemodule.itemid
    - inventtable.dataareaid = inventtablemodule.dataareaid
    - inventtablemodule.moduletype = 1
    right_table: ' inventtablemodule'
    type: left
  - left_table: inventtablemodule
    on_conditions:
    - inventtablemodule.taxitemgroupid = vatgrouplookup.ItemVATgroup
    right_table: ' vatgrouplookup'
    type: left
  - left_table: inventtable
    on_conditions:
    - inventtable.intrastatcommodity = ecorescategoryintrastat.category
    right_table: ' ecorescategoryintrastat'
    type: left
  select_columns:
  - alias: Record Type
    column: Record Type
  - alias: Company Code
    column: Company Code
  - alias: Site Code
    column: Site Code
  - alias: Receipt Ref
    column: whsloadtable.loadid
  - alias: Receipt Date
    column: whsloadtable.loadshipconfirmutcdatetime
  - alias: Receipt Type
    column: Receipt Type
  - alias: Invoice Key
    column: Invoice Key_calc
  - alias: Product Code
    column: hslcommercialinvoice.itemnumber
  - alias: Product Description
    column: Product Description_calc
  - alias: Product tariff/commodity code
    column: hslcommercialinvoice.commoditycode
  - alias: Product Vat rate identifier
    column: vatgrouplookup.LangdonCode
  - alias: Product Unit weight
    column: Product Unit weight
  - alias: Project reference
    column: Project reference
  - alias: IPR reference
    column: IPR reference
  - alias: OPR Project reference
    column: OPR Project reference
  - alias: Order Reference
    column: purchtable.purchid
  - alias: Country Of Origin
    column: hslcommercialinvoice.countryoforigin
  - alias: Country of Consignment
    column: hslcommercialinvoice.dispatchcountry
  - alias: Invoiced Quantity
    column: hslcommercialinvoice.invoicedqty
  - alias: Quantity Code
    column: ecorescategoryintrastat.additionalunits
  - alias: Item value
    column: hslcommercialinvoice.polinetotal
  - alias: Received Quantity
    column: hslcommercialinvoice.invoicedqty
  - alias: Licence Reference
    column: Licence Reference
  - alias: Preference Document type
    column: hslcommercialinvoice.preferencedocumenttype
  - alias: Preference document reference
    column: hslcommercialinvoice.preferencedocumentreference
  - alias: Item Net Weight
    column: Item Net Weight
  - alias: Container Number
    column: Container Number
  - alias: Package Count
    column: Package Count
  - alias: Package Kind
    column: Package Kind
  - alias: Package Marks & Numbers
    column: Package Marks & Numbers
  - alias: Gross Weight
    column: hslcommercialinvoice.grossweight
  - alias: Seller Code
    column: Seller Code
  - alias: Preference
    column: hslcommercialinvoice.preferencecountry
  - alias: Preference Group
    column: hslcommercialinvoice.preferencegroup
  - alias: NOTC(a)
    column: NOTC(a)
  - alias: NOTC(b)
    column: NOTC(b)
  - alias: Preference Document Code
    column: hslcommercialinvoice.preferencedocumentcode
  - alias: Preference Document Status Code
    column: hslcommercialinvoice.preferencedocumentstatuscode
  - alias: Key
    column: Key_calc
  - alias: Level_Key
    column: hslcommercialinvoice.recid
  - alias: Parent_Key
    column: hslcommercialinvoice.commercialinvoiceid
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
  - alias: inventtable
    name: inventtable
    sql: ''
  - alias: ecoresproducttranslation
    name: ecoresproducttranslation
    sql: ''
  - alias: inventtablemodule
    name: inventtablemodule
    sql: ''
  - alias: vatgrouplookup
    name: vatgrouplookup
    sql: ''
  - alias: ecorescategoryintrastat
    name: ecorescategoryintrastat
    sql: ''
  target_data_type:
  - column: Receipt Date
    value: dd-MM-yyyy
  - column: Invoiced Quantity
    value: DecimalType(10, 3)
  - column: Item value
    value: DecimalType(9, 4)
  - column: Received Quantity
    value: DecimalType(10, 3)
  - column: Gross Weight
    value: DecimalType(9, 4)
