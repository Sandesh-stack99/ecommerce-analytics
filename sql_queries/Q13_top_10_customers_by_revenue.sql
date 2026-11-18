-- Business question: Who are the 10 most valuable customers?
SELECT customer_id, customer_name,
       COUNT(DISTINCT order_id)    AS orders,
       ROUND(SUM(total_sales), 2)  AS lifetime_revenue,
       ROUND(SUM(profit), 2)       AS lifetime_profit,
       MIN(order_date)             AS first_order,
       MAX(order_date)             AS last_order
FROM revenue_orders
GROUP BY customer_id, customer_name
ORDER BY lifetime_revenue DESC
LIMIT 10;
