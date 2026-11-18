-- Business question: How fast is the business growing year over year?
WITH yearly AS (
    SELECT year, COUNT(DISTINCT order_id) AS orders, SUM(total_sales) AS revenue, SUM(profit) AS profit
    FROM revenue_orders
    GROUP BY year
)
SELECT year, orders,
       ROUND(revenue, 2) AS revenue,
       ROUND(profit, 2)  AS profit,
       ROUND(100.0 * (revenue - LAG(revenue) OVER (ORDER BY year))
             / LAG(revenue) OVER (ORDER BY year), 2) AS yoy_growth_pct
FROM yearly
ORDER BY year;
