-- Business question: Are category profit margins improving or shrinking over time?
SELECT year, category,
       ROUND(SUM(total_sales), 2)                       AS revenue,
       ROUND(SUM(profit), 2)                            AS profit,
       ROUND(100.0 * SUM(profit) / SUM(total_sales), 2) AS profit_margin_pct
FROM revenue_orders
GROUP BY year, category
ORDER BY category, year;
