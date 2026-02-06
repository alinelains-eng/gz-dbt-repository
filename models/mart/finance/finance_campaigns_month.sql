 SELECT
     date_trunc(date_date, month) as datemonth,
     SUM(margin) AS ads_margin,
     sum(average_basket) as average_basket,
     SUM(operational_margin) AS operational_margin,
     SUM(ads_cost) AS ads_cost,
     SUM(ads_impression) AS ads_impression,
     SUM(ads_clicks) AS ads_clicks,
     SUM(quantity) AS quantity,
     SUM(revenue) AS revenue,
     SUM(purchase_cost) AS purchase_cost,
     sum(operational_margin - ads_cost) as margin ,
     SUM(shipping_fee) AS shipping_fee,
     SUM(logcost) AS log_cost,
     SUM(ship_cost) AS ship_cost,
 FROM {{ ref('finance_campaigns_day') }}
 GROUP BY datemonth
 ORDER BY datemonth desc
