SELECT SUM(clst_quantity) FROM (
    select
    p.displayproductnumber as clst_prod_key,
    i.physicalinvent as clst_quantity,
    'ENDCTG' as clst_comp_key,
    '' as clst_site_key,
    getdate() as clst_clst_date
 
    from inventsum i
 
    INNER JOIN  inventtable as it
    ON i.itemid = it.itemid
    AND i.dataareaid = it.dataareaid
 
    INNER JOIN ecoresproduct p
    ON it.product = p.recid
 
    WHERE i.dataareaid IN ('end.','END.')
    AND i.inventlocationid = 'PAR'
    AND i.wmslocationid != 'Off-site'
 
    -- AND i.modifieddatetime > '2025-04-08'
 
) q