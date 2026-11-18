-- Business question: How much revenue does each RFM customer segment contribute?
SELECT segment,
       COUNT(*)                                                                  AS customers,
       ROUND(SUM(monetary), 2)                                                   AS revenue,
       ROUND(100.0 * SUM(monetary) / (SELECT SUM(monetary) FROM customer_segments), 2) AS revenue_share_pct,
       ROUND(AVG(frequency), 2)                                                  AS avg_orders,
       ROUND(AVG(recency_days), 0)                                               AS avg_days_since_last_order
FROM customer_segments
GROUP BY segment
ORDER BY revenue DESC;
