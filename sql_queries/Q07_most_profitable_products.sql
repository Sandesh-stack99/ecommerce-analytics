-- Business question: Which 10 products earn the most profit?
SELECT product_name, category,
       SUM(quantity)                                    AS units_sold,
       ROUND(SUM(total_sales), 2)                       AS revenue,
       ROUND(SUM(profit), 2)                            AS profit,
       ROUND(100.0 * SUM(profit) / SUM(total_sales), 2) AS profit_margin_pct
FROM revenue_orders
GROUP BY product_name, category
ORDER BY profit DESC
LIMIT 10;
