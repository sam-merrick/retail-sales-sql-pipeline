-- Total Revenue Per Month

SELECT 
    d.year,
    d.month,
    SUM(f.total_sales) AS total_revenue
FROM dbo.fact_sales f
JOIN dw.dim_date d ON f.date_key = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- Top 10 Customers by Total Spend

SELECT TOP 10
    c.customer_id,
    c.customer_name,
    ROUND(SUM(f.total_sales), 2) AS total_spend
FROM dbo.fact_sales f
JOIN dw.dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spend DESC, customer_id, customer_name

-- Revenue by Product Category

SELECT
    p.category_id,
    ROUND(SUM(f.total_sales), 2) AS total_revenue
FROM dbo.fact_sales f
JOIN dw.dim_product p ON p.product_id = f.product_id
GROUP BY p.category_id
ORDER BY total_revenue DESC

-- Top 10 Products by Total Quantity Sold

SELECT TOP 10
    p.product_name,
    SUM(f.quantity) AS total_quantity_sold
FROM dbo.fact_sales f
JOIN dw.dim_product p ON f.product_id = p.product_key
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC

-- On-Time Shipping Rate
SELECT
    ROUND(
    COUNT(*) * 1.0 /
    SUM(COUNT(*)) OVER(), 2) AS on_time_percentage
FROM dbo.fact_sales f
JOIN dw.dim_date d ON f.date_key = d.date_id
JOIN dw.dim_date r ON f.date_key = r.date_id
WHERE d.full_date <= r.full_date;


SELECT * FROM dbo.fact_sales
SELECT * FROM dw.dim_customer
SELECT * FROM dw.dim_product
SELECT * FROM dw.dim_date