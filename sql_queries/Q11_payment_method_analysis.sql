-- Business question: How do customers pay, and which methods lead to more cancellations or returns?
SELECT payment_method,
       COUNT(*)                                                   AS orders,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2)         AS share_pct,
       ROUND(100.0 * SUM(order_status = 'Cancelled') / COUNT(*), 2) AS cancel_rate_pct,
       ROUND(100.0 * SUM(order_status = 'Returned') / COUNT(*), 2)  AS return_rate_pct
FROM orders
GROUP BY payment_method
ORDER BY orders DESC;
