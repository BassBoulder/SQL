WITH liamsales AS (
SELECT
FiscalYear,
FiscalWeek,
storeId,
salesOrderNumber,
SUM(amount) + SUM(shippingPerOrder)  Srevenue,
        SUM(CASE
            WHEN s.invoiceDate >= '2025-06-02' THEN COALESCE(s.landedCost, 0.00)
            ELSE COALESCE(s.factoryCost, 0.00)
         END) 
            AS Scost

            ,MAX(isReturn) AS Sreturn
            ,SUM(landedCost) SlandedCost

FROM Sales s
INNER JOIN Calendar ON Calendar.Date = invoiceDate
WHERE FiscalYear IN (2025,2026) AND FiscalWeek = 4
AND s.giftcard = 'N'
AND s.orderLineNote != 'Adjustment'
AND s.custgroup = 'Stock'
AND s.storeId = 'MAN-UK'
GROUP BY salesOrderNumber,
FiscalYear,
FiscalWeek,
storeId
),
 
nicksales AS (
SELECT
FiscalYear,
FiscalWeek,
storeId,
  salesOrderNumber,
   SUM(Value) Trevenue
  ,SUM(factoryCost) Tcost
  ,MAX(isReturn) AS Treturn
FROM tradereportrevenue
INNER JOIN Calendar ON Calendar.Date = invoiceDate
WHERE FiscalYear IN (2025,2026) AND FiscalWeek = 4
AND tradereportrevenue.storeId LIKE '%MAN-UK%'
GROUP BY salesOrderNumber,
FiscalYear,
FiscalWeek,
storeId
)
 
SELECT liamsales.FiscalYear,
liamsales.FiscalWeek,liamsales.storeId,
liamsales.salesOrderNumber,
liamsales.Srevenue, nicksales.Trevenue,liamsales.Srevenue - nicksales.Trevenue rev_diff,
liamsales.Scost, liamsales.SlandedCost, nicksales.Tcost,liamsales.Scost - nicksales.Tcost  cost_diff,
liamsales.Sreturn, nicksales.Treturn
FROM liamsales
 
LEFT JOIN nicksales
ON nicksales.salesOrderNumber = liamsales.salesOrderNumber

ORDER BY 1,2,3,4 DESC