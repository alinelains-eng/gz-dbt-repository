SELECT 
om.orders_id,
om.date_date,
round(om.margin + sh.shipping_fee - (sh.logcost + sh.ship_cost),2) as operational_margin,
om.quantity, 
om.revenue,
om.purchase_cost,
om.margin, 
sh.shipping_fee,
sh.logcost,
sh.ship_cost
FROM {{ ref('int_orders_margin') }} as om
 LEFT JOIN {{ ref('stg_gz_raw_data__ship') }} as sh
 using(orders_id)
 order by om.orders_id desc