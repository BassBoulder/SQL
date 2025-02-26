
SELECT a.*, ' ' '-', c.* FROM purchorderline a
LEFT JOIN purchorderheader b ON ((b.PurchaseOrderid = a.purchaseorderheaderid) AND (a.dataareaid = b.dataareaid))
LEFT JOIN DE_LH_300_GOLD_EndClothingData.dbo.Product c ON a.productvariantid = c.productId AND c.magentoStatus IS NOT NULL
WHERE a.recid IN ('5639291246','5639300943')
  

SELECT TOP 100 magentoStatus, * FROM DE_LH_300_GOLD_EndClothingData.dbo.Product
WHERE productId IN ('5638790671','5638790668')

SELECT TOP 100 * FROM DE_LH_300_GOLD_EndClothingData.dbo.PurchaseOrderLine
WHERE PurchaseOrderLineId IN ('5638790671','5638790668')