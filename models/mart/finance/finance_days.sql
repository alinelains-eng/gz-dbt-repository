with operational as(
SELECT 
date_date 
, count (distinct orders_id) as nb_transactions
,round(sum(revenue),2) as revenue
,round (sum(operational_margin),2) as operational_margin 
,round(sum(purchase_cost),2) as purchase_cost
,round(sum(shipping_fee),2) as shipping_fee
,round(sum(logcost),2) as logcost
,round(sum(ship_cost),2) as ship_cost
, sum(quantity) as quantity
FROM {{ ref('int_orders_operational') }}
group by date_date 
)

select 
date_date
,revenue
,operational_margin 
, purchase_cost
, shipping_fee
, logcost
, ship_cost
, quantity
, round(revenue/nullif(nb_transactions,0),2) as average_basket
    from operational
    order by date_date desc
    