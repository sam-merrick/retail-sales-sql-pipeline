CREATE TABLE raw.raw_orders (
    order_id INT,
    customer_id NVARCHAR(50),
    employee_id INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    ship_via INT,
    freight FLOAT,
    ship_name NVARCHAR(100),
    ship_address NVARCHAR(255),
    ship_city NVARCHAR(50),
    ship_region NVARCHAR(50),
    ship_postal_code NVARCHAR(50),
    ship_country NVARCHAR(50)
);

CREATE TABLE raw.raw_order_details (
    order_id INT,
    product_id INT,
    unit_price FLOAT,
    quantity INT,
    discount FLOAT
);