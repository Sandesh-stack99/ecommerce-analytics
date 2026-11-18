-- Business question: Which days of the week are busiest?
SELECT weekday,
       COUNT(DISTINCT order_id)                              AS orders,
       ROUND(SUM(total_sales), 2)                            AS revenue,
       ROUND(SUM(total_sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM revenue_orders
GROUP BY weekday
ORDER BY (CAST(strftime('%w', MIN(order_date)) AS INTEGER) + 6) % 7;
