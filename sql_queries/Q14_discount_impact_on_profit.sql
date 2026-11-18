-- Business question: Do bigger discounts lift volume or just destroy margin?
SELECT CASE WHEN discount = 0    THEN '0% (no discount)'
            WHEN discount <= 0.10 THEN '1-10%'
            WHEN discount <= 0.20 THEN '11-20%'
            ELSE '21-30%' END                                  AS discount_band,
       COUNT(DISTINCT order_id)                                AS orders,
       ROUND(AVG(quantity), 2)                                 AS avg_units_per_order,
       ROUND(SUM(total_sales), 2)                              AS revenue,
       ROUND(SUM(profit), 2)                                   AS profit,
       ROUND(100.0 * SUM(profit) / SUM(total_sales), 2)        AS profit_margin_pct
FROM revenue_orders
GROUP BY discount_band
ORDER BY MIN(discount);
