-- Revenue

SELECT
	SUM(od.quantity * od.unit_price * (1 - od.discount)) AS raw_total_sales
FROM raw.raw_order_details od

SELECT
	sum(total_sales) AS fact_total_sales
FROM dbo.fact_sales

-- Comparison

SELECT
	(SELECT SUM(od.quantity * od.unit_price * (1 - od.discount))
	FROM raw.raw_order_details od) AS raw_revenue,
	(SELECT SUM(total_sales)
	FROM dbo.fact_sales) AS fact_revenue

-- Row Counts

SELECT
    (SELECT COUNT(*) FROM raw.raw_orders) AS raw_orders,
    (SELECT COUNT(*) FROM staging.stg_orders) AS stg_orders,
    (SELECT COUNT(*) FROM dw.dim_customer) AS dim_customers

SELECT
	(SELECT COUNT(*) FROM raw.raw_order_details) AS raw_order_details,
	(SELECT COUNT(*) FROM dbo.fact_sales) AS fact_rows;

-- Duplicate Checks

-- Orders

SELECT
	order_id,
	COUNT(*) AS cnt
FROM raw.raw_orders
GROUP BY order_id
HAVING COUNT(*) > 1

-- Products

SELECT 
	product_id,
	COUNT(*) AS cnt
FROM dw.dim_product
GROUP BY product_id
HAVING COUNT(*) > 1

-- Fact Table

SELECT
	order_id,
	product_id,
	COUNT(*) AS cnt
FROM dbo.fact_sales
GROUP BY order_id, product_id
HAVING COUNT(*) > 1

-- Missing Foreign Keys

-- Missing Product IDs in Fact Table

SELECT f.product_id
FROM dbo.fact_sales f
LEFT JOIN dw.dim_product p
    ON f.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Missing Customer IDs

SELECT f.customer_id
FROM dbo.fact_sales f
LEFT JOIN dw.dim_customer c
    ON f.customer_id = c.customer_id
WHERE c.customer_id IS NULL;




