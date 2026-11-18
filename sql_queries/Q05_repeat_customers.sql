-- Business question: What share of customers buy more than once?
WITH per_customer AS (
    SELECT customer_id, COUNT(DISTINCT order_id) AS orders
    FROM revenue_orders
    GROUP BY customer_id
)
SELECT COUNT(*)                                           AS total_customers,
       SUM(orders >= 2)                                   AS repeat_customers,
       ROUND(100.0 * SUM(orders >= 2) / COUNT(*), 2)      AS repeat_rate_pct,
       ROUND(AVG(orders), 2)                              AS avg_orders_per_customer,
       MAX(orders)                                        AS max_orders_by_one_customer
FROM per_customer;
