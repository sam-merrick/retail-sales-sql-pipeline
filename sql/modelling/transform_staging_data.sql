INSERT INTO staging.stg_orders
SELECT
    order_id,
    customer_id,
    employee_id,
    TRY_CONVERT(date, order_date),
    TRY_CONVERT(date, required_date),
    TRY_CONVERT(date, shipped_date),
    ship_via,
    TRY_CONVERT(decimal(10,2), freight),
    ship_name,
    REPLACE(ship_address, '"', ''),
    ship_city,
    ship_region,
    ship_postal_code,
    ship_country
FROM raw.raw_orders;

INSERT INTO staging.stg_order_details
SELECT
    order_id,
    product_id,
    unit_price,
    quantity,
    discount
FROM raw.raw_order_details;
