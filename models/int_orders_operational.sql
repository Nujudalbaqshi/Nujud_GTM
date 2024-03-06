SELECT
  o.orders_id
  ,o.date_date
  ,ROUND(CAST(o.margin AS FLOAT64) + s.shipping_fee - (s.logcost + CAST(s.ship_cost AS FLOAT64)),2) AS operational_margin 
  ,o.quantity
  ,o.revenue
  ,CAST(o.purchase_cost AS FLOAT64) AS purchase_cost
  ,CAST(o.margin AS FLOAT64) As margin
  ,s.shipping_fee
  ,s.logcost
  ,s.ship_cost
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw__ship")}} s 
  USING(orders_id)
ORDER BY orders_id desc