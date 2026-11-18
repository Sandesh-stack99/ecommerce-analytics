-- Business question: Which months of the year are strongest? (100 = an average month)
WITH by_month AS (
    SELECT CAST(strftime('%m', order_date) AS INTEGER) AS month_no, SUM(total_sales) AS revenue
    FROM revenue_orders
    GROUP BY month_no
)
SELECT month_no, ROUND(revenue, 2) AS revenue,
       ROUND(100.0 * revenue / AVG(revenue) OVER (), 1) AS seasonality_index
FROM by_month
ORDER BY month_no;
