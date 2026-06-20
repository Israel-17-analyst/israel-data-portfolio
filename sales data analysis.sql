CREATE DATABASE sales_data;
1. Total number of rows
SELECT COUNT(*) AS total_rows
FROM dbo.[Sales data];
SELECT * FROM dbo.[Sales data];
2. Total revenue generated 
SELECT 
    ROUND(SUM(SALES), 2) AS total_revenue_usd
FROM dbo.[Sales data];
3. Unique orders, total lines, and average lines per order
SELECT 
    COUNT(DISTINCT [ORDER_NUM]) AS unique_orders,
    COUNT(*) AS total_order_lines,
    ROUND(CAST(COUNT(*) AS FLOAT) / COUNT(DISTINCT [ORDER_NUM]), 2) AS avg_lines_per_order
FROM dbo.[Sales data];
4. Date range of the sales data
SELECT 
    MIN([ORDER_DATE]) AS earliest_order_date,
    MAX([ORDER_DATE]) AS latest_order_date,
    DATEDIFF(DAY, MIN([ORDER_DATE]), MAX([ORDER_DATE])) AS total_days_covered
FROM dbo.[Sales data];
5. Number of unique customers and unique products
SELECT 
    COUNT(DISTINCT ([CUSTOMER_NAME])) AS unique_customers,
    COUNT(DISTINCT ([PRODUCT])) AS unique_products
FROM dbo.[Sales data];
6. Order status breakdown (Shipped, Cancelled, Disputed, etc.)
SELECT 
    STATUS,
    COUNT(*) AS order_lines_count,
    COUNT(DISTINCT ([ORDER_NUM])) AS unique_orders_count,
    ROUND(SUM(SALES), 2) AS total_revenue,
    ROUND(100.0 * SUM(SALES) / (SELECT SUM(SALES) FROM dbo.[Sales data]), 2) AS percent_of_total_revenue
FROM dbo.[Sales data]
GROUP BY ([STATUS])
ORDER BY total_revenue DESC;
7. Total Revenue by Year
SELECT 
    YEAR,
    COUNT(DISTINCT ([ORDER_NUM])) AS unique_orders,
    ROUND(SUM(SALES), 2) AS total_revenue,
    ROUND(AVG(SALES), 2) AS avg_order_line_value
FROM dbo.[Sales data]
GROUP BY ([YEAR])
ORDER BY total_revenue DESC;
8. Revenue by Year and Quarter
SELECT 
    YEAR,
    ([QTR_ID]) AS quarter_id,
    COUNT(DISTINCT ([ORDER_NUM])) AS unique_orders,
    ROUND(SUM(SALES), 2) AS total_revenue,
    ROUND(AVG(SALES), 2) AS avg_order_line_value
FROM dbo.[Sales data]
GROUP BY YEAR, ([QTR_ID])
ORDER BY YEAR, ([QTR_ID]);
9. Monthly Revenue Trend (with proper month sorting)
SELECT 
    YEAR,
    MONTH,
    COUNT(DISTINCT ([ORDER_NUM])) AS unique_orders,
    ROUND(SUM(SALES), 2) AS total_revenue,
    ROUND(AVG(SALES), 2) AS avg_order_line_value
FROM dbo.[Sales data]
GROUP BY YEAR, ([MONTH])
ORDER BY 
    YEAR ASC,
    CASE ([MONTH])
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END ASC;
10. Top Months by Total Revenue (Overall, across all years)
WITH MonthlySummary AS (
    SELECT 
        YEAR,
        MONTH,
        ROUND(SUM(SALES), 2) AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(SALES) DESC) AS revenue_rank
    FROM dbo.[Sales data]
    GROUP BY YEAR, MONTH
)
SELECT 
    YEAR,
    MONTH,
    total_revenue,
    revenue_rank
FROM MonthlySummary
ORDER BY revenue_rank ASC;  -- ASC for top-to-bottom (1 = highest)