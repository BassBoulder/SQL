DROP TABLE IF EXISTS tempOrderMAX, tempOrderMax_TOP1 

    ;

CREATE TEMP TABLE tempOrderMAX AS
select 
     cusord.customer_id
    ,DENSE_RANK() OVER (PARTITION BY cusord.customer_id ORDER BY COUNT(cusordline.title) DESC, cusordline.price DESC) Most_Ordered
    ,COUNT(cusordline.title)
    ,cusordline.title

from 
    wild_nutrition_shopify."order" cusord 

INNER JOIN 
    wild_nutrition_shopify.order_line cusordline
        ON cusordline.order_id = cusord.id

GROUP BY 
     cusord.customer_id
    ,cusordline.title
    ,cusordline.price 

    ;

CREATE TEMP TABLE tempOrderMax_TOP1 AS
SELECT customer_id, title FROM tempOrderMAX WHERE Most_Ordered = 1

    ;

SELECT * FROM tempOrderMax_TOP1
WHERE customer_id = '3388701933630'