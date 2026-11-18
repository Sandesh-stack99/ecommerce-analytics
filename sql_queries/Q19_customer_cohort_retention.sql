-- Business question: For customers acquired in each year, how many are still buying in later years?
WITH first_year AS (
    SELECT customer_id, MIN(year) AS cohort_year FROM revenue_orders GROUP BY customer_id
)
SELECT f.cohort_year, r.year AS active_year,
       COUNT(DISTINCT r.customer_id) AS active_customers,
       ROUND(100.0 * COUNT(DISTINCT r.customer_id)
             / (SELECT COUNT(*) FROM first_year x WHERE x.cohort_year = f.cohort_year), 2) AS pct_of_cohort
FROM revenue_orders r
JOIN first_year f ON f.customer_id = r.customer_id
GROUP BY f.cohort_year, r.year
ORDER BY f.cohort_year, r.year;
