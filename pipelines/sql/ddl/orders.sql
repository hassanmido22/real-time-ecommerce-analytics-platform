

CREATE EXTERNAL TABLE IF NOT EXISTS orders (
    order_id                          STRING,
    customer_id                       STRING,
    order_status                      STRING,
    order_purchase_timestamp          STRING,
    order_approved_at                 STRING,
    order_delivered_carrier_date      STRING,
    order_delivered_customer_date     STRING,
    order_estimated_delivery_date     STRING
)
PARTITIONED BY (year INT, month INT, day INT)
STORED AS PARQUET
LOCATION 's3://raw-ecommerce-lake-hassanessam/orders/';

MSCK REPAIR TABLE orders;
