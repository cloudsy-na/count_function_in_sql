SELECT
A.sku,
COUNT(DISTINCT B.attribute_code) as uniq_attr
FROM `table_001` as A
INNER JOIN `table_002` as B
ON A.attribute_code = B.attribute_code 
INNER JOIN `table_003` as C
ON A.sku = C.sku
WHERE C.disable = 0 AND C.discontinue_type = 0 AND A.disable=0
GROUP BY A.sku
HAVING COUNT(B.attribute_code) = 2
ORDER BY uniq_attr DESC
LIMIT 10
