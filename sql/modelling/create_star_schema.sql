CREATE TABLE dw.dim_customer (
    customer_id NVARCHAR(5) PRIMARY KEY,
    company_name NVARCHAR(100),
    country NVARCHAR(50),
    city NVARCHAR(50)
);

CREATE TABLE dw.dim_product (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(100),
    category NVARCHAR(50),
    unit_price DECIMAL(10,2),
    discontinued BIT
);

CREATE TABLE dw.dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT,
    month_name VARCHAR(20),
    quarter INT
);

CREATE TABLE dbo.fact_sales (
    order_id INT,
    product_id INT,
    date_key INT,
    customer_id NVARCHAR(5),
    unit_price DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(10,4),
    revenue DECIMAL(12,2)
);
