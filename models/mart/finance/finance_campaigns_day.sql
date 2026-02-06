select 
date_date 
, operational_margin - ads_cost as ads_margin
, round(average_basket,2) as average_basket
, operational_margin
, ads_cost
, ads_impression
, ads_clicks
, quantity
, revenue
, purchase_cost
, shipping_fee
, logcost
, ship_cost
, operational_margin - ads_cost as margin 

from {{ ref('int_campaigns_day') }}
full outer join {{ ref('finance_days') }}
 using (date_date)
order by date_date desc 