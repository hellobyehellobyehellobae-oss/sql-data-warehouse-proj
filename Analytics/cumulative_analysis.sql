with year_stats as (
    SELECT 
        DATE_TRUNC('year', order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATE_TRUNC('year', order_date)
) 
SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_sales,
    avg_price,
    AVG(avg_price) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_avg_price
FROM year_stats
ORDER BY order_date;
