DROP TABLE IF EXISTS Orders_And_Items, Final_Order_And_Items

    ;

CREATE TEMP TABLE Orders_And_Items AS

    SELECT 
         cus.id Customer_ID
        ,DENSE_RANK() OVER (PARTITION BY cus.id ORDER BY cusord.created_at ASC) First_Order
        ,cusord.created_at
        ,DENSE_RANK() OVER (PARTITION BY cusord.id ORDER BY price DESC) Top_Item
        ,cusordline.name Product_Name
        ,cusprod.product_type Product_Type
        ,SUM(cusordline.quantity) Order_Items_Count
        ,cusordline.price Top_Item_Price
        ,cusord.total_price First_Order_Price

    FROM 
        wild_nutrition_shopify.customer cus

    INNER JOIN
        wild_nutrition_shopify."order" cusord
            ON cus.id = cusord.customer_id

    INNER JOIN 
        wild_nutrition_shopify.order_line cusordline
            ON cusordline.order_id = cusord.id

    LEFT JOIN
        wild_nutrition_shopify.product cusprod
            ON cusordline.product_id = cusprod.id


    --WHERE cus.id IN ('3388701900862')

    GROUP BY
         cus.id
        ,cusord.id
        ,cusordline.price
        ,cusord.total_price
        ,cusord.created_at
        ,cusordline.name
        ,cusprod.product_type

    ;

CREATE TEMP TABLE Final_Order_And_Items AS

SELECT
     a.Customer_ID
    --,a.First_Order
    ,TO_CHAR(a.created_at, 'MONTH') first_order_month
    ,DATE_PART('DAY',NOW() - a.created_at) since_first_order_days
    --,a.Top_Item
    ,a.Product_Name
    ,a.Product_Type
    ,SUM(b.Order_Items_Count) Items
    ,a.Top_Item_Price
    ,a.First_Order_Price
FROM 
    Orders_And_Items a

INNER JOIN 
    Orders_And_Items b 
        ON a.customer_id = b.customer_id
        AND b.First_Order = 1

WHERE a.First_Order = 1
AND a.Top_Item = 1

GROUP BY
     a.customer_id
    ,a.first_order
    ,a.created_at
    ,a.Top_Item
    ,a.Product_Name
    ,a.Product_Type
    ,a.Top_Item_Price
    ,a.First_Order_Price

    ;

--SELECT * FROM Final_Order_And_Items LIMIT 10