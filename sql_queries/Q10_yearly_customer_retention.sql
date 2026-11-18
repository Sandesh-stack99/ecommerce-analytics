-- Business question: Of the customers active last year, how many bought again this year?
WITH customer_years AS (
    SELECT DISTINCT customer_id, year FROM revenue_orders
)
SELECT cur.year,
       COUNT(*)                                                   AS active_customers,
       SUM(prev.customer_id IS NOT NULL)                          AS also_active_previous_year,
       (SELECT COUNT(*) FROM customer_years p WHERE p.year = cur.year - 1) AS previous_year_customers,
       ROUND(100.0 * SUM(prev.customer_id IS NOT NULL)
             / (SELECT COUNT(*) FROM customer_years p WHERE p.year = cur.year - 1), 2) AS retention_rate_pct
FROM customer_years cur
LEFT JOIN customer_years prev ON prev.customer_id = cur.customer_id AND prev.year = cur.year - 1
GROUP BY cur.year
ORDER BY cur.year;
