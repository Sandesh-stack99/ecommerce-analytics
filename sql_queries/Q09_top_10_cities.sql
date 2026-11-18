-- Business question: Which 10 cities bring in the most revenue?
SELECT city, state,
       COUNT(DISTINCT order_id)    AS orders,
       COUNT(DISTINCT customer_id) AS customers,
       ROUND(SUM(total_sales), 2)  AS revenue,
       ROUND(SUM(profit), 2)       AS profit
FROM revenue_orders
WHERE city <> 'Unknown'
GROUP BY city, state
ORDER BY revenue DESC
LIMIT 10;
