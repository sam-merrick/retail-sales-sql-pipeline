BULK INSERT raw.raw_orders
FROM 'C:\DE\SQL\Projects\northwind_orders_clean.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT raw.raw_order_details
FROM 'C:\DE\SQL\Projects\northwind_order_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);