CREATE EXTERNAL TABLE IF NOT EXISTS order_items (
    order_id             STRING,
    order_item_id        INT,
    product_id           STRING,
    seller_id            STRING,
    shipping_limit_date  STRING,
    price                DOUBLE,
    freight_value        DOUBLE
)
STORED AS PARQUET
LOCATION 's3://raw-ecommerce-lake-hassanessam/order_items/';
