SELECT *    
FROM {{ ref('stg_gz_raw_data__sales') }} as s
LEFT JOIN {{ ref('stg_gz_raw_data__product') }} as p
ON p.products_id = s.product_id