-- Business question: What is the average order value overall and by category?
SELECT 'All orders' AS segment,
       COUNT(DISTINCT order_id)                                  AS orders,
       ROUND(SUM(total_sales) / COUNT(DISTINCT order_id), 2)     AS avg_order_value
FROM revenue_orders
UNION ALL
SELECT category, COUNT(DISTINCT order_id), ROUND(SUM(total_sales) / COUNT(DISTINCT order_id), 2)
FROM revenue_orders
GROUP BY category
ORDER BY avg_order_value DESC;
