-- Business question: How does revenue change month over month?
WITH monthly AS (
    SELECT month, SUM(total_sales) AS revenue, COUNT(DISTINCT order_id) AS orders
    FROM revenue_orders
    GROUP BY month
)
SELECT month,
       orders,
       ROUND(revenue, 2)                                   AS revenue,
       ROUND(LAG(revenue) OVER (ORDER BY month), 2)        AS previous_month_revenue,
       ROUND(100.0 * (revenue - LAG(revenue) OVER (ORDER BY month))
             / LAG(revenue) OVER (ORDER BY month), 2)      AS mom_growth_pct
FROM monthly
ORDER BY month;
