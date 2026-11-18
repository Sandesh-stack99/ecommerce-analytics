-- Business question: How many orders are delivered, shipped, cancelled or returned, and how much value is lost?
SELECT order_status,
       COUNT(*)                                             AS orders,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2)   AS share_pct,
       ROUND(SUM(total_sales), 2)                           AS order_value
FROM orders
GROUP BY order_status
ORDER BY orders DESC;
