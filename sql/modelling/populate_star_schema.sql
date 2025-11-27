INSERT INTO dw.fact_sales
SELECT
    od.order_id,
    od.product_id,
    CONVERT(INT, FORMAT(o.order_date, 'yyyyMMdd')),
    o.customer_id,
    od.unit_price,
    od.quantity,
    od.discount,
    od.unit_price * od.quantity * (1 - od.discount)
FROM staging.stg_order_details od
JOIN staging.stg_orders o
    ON od.order_id = o.order_id;
