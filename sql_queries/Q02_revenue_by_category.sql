-- Business question: Which categories generate the most revenue and what is each one's profit margin?
SELECT category,
       COUNT(DISTINCT order_id)                                             AS orders,
       ROUND(SUM(total_sales), 2)                                           AS revenue,
       ROUND(SUM(profit), 2)                                                AS profit,
       ROUND(100.0 * SUM(profit) / SUM(total_sales), 2)                     AS profit_margin_pct,
       ROUND(100.0 * SUM(total_sales) / SUM(SUM(total_sales)) OVER (), 2)   AS revenue_share_pct
FROM revenue_orders
GROUP BY category
ORDER BY revenue DESC;
