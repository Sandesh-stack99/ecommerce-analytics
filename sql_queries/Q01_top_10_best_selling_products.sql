-- Business question: Which 10 products sell the most units?
SELECT product_name, category,
       SUM(quantity)                  AS units_sold,
       COUNT(DISTINCT order_id)       AS orders,
       ROUND(SUM(total_sales), 2)     AS revenue
FROM revenue_orders
GROUP BY product_name, category
ORDER BY units_sold DESC
LIMIT 10;
