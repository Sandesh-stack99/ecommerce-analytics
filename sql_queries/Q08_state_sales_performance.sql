-- Business question: How does each state perform?
SELECT state,
       COUNT(DISTINCT order_id)                                             AS orders,
       COUNT(DISTINCT customer_id)                                          AS customers,
       ROUND(SUM(total_sales), 2)                                           AS revenue,
       ROUND(SUM(profit), 2)                                                AS profit,
       ROUND(SUM(total_sales) / COUNT(DISTINCT order_id), 2)                AS avg_order_value,
       ROUND(100.0 * SUM(total_sales) / SUM(SUM(total_sales)) OVER (), 2)   AS revenue_share_pct
FROM revenue_orders
WHERE state <> 'Unknown'
GROUP BY state
ORDER BY revenue DESC;
