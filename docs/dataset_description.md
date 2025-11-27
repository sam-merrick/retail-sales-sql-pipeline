`northwind_orders` (primary key)

- Row Count:  830
- Columns
    - `order_id` (integer)
    - `customer_id` (text)
    - `employee_id` (integer)
    - `order_date` (date)
    - `required_date` (date)
    - `shipped_date` (date)
    - `ship_via` (integer)
    - `freight` (float)
        - Float value however some rows are to 1 decimal place, clean this up so all 2 decimal place
    - `ship_name` (text)
    - `ship_address` (text)
    - `ship_city` (text)
    - `ship_region` (text)
        - A lot of rows are missing a value in this column, may not be required/necessary
    - `ship_postal_code` (text)
    - `ship_country` (text)

`northwind_order_details` (foreign_key)

- Row Count: 2155
- Columns
    - `order_id` (integer)
    - `product_id` (integer)
    - `unit_price` (float/integer)
        - Appears to be a mix of integers/floats, clean this up and make it consistent
    - `quantity` (integer)
    - `discount` (float)
        - Sometimes the value is 1 decimal place, sometimes 2, clean up here as well

**Example Data:**

```sql
-- northwind_orders.csv
order_id,customer_id,employee_id,order_date,required_date,shipped_date,ship_via,freight,ship_name,ship_address,ship_city,ship_region,ship_postal_code,ship_country
10248,VINET,5,1996-07-04,1996-08-01,1996-07-16,3,32.38,Vins et alcools Chevalier,59 rue de l'Abbaye,Reims,,51100,France
10249,TOMSP,6,1996-07-05,1996-08-16,1996-07-10,1,11.61,Toms Spezialitäten,Luisenstr. 48,Münster,,44087,Germany
10250,HANAR,4,1996-07-08,1996-08-05,1996-07-12,2,65.83,Hanari Carnes,"Rua do Paço, 67",Rio de Janeiro,RJ,05454-876,Brazil
10251,VICTE,3,1996-07-08,1996-08-05,1996-07-15,1,41.34,Victuailles en stock,"2, rue du Commerce",Lyon,,69004,France
10252,SUPRD,4,1996-07-09,1996-08-06,1996-07-11,2,51.3,Suprêmes délices,"Boulevard Tirou, 255",Charleroi,,B-6000,Belgium

-- northwind_order_details.csv

order_id,product_id,unit_price,quantity,discount
10248,11,14,12,0
10248,42,9.8,10,0
10248,72,34.8,5,0
10249,14,18.6,9,0
10249,51,42.4,40,0
```
