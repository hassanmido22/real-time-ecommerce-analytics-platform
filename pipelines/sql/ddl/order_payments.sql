CREATE EXTERNAL TABLE IF NOT EXISTS order_payments (
    order_id              STRING,
    payment_sequential    INT,
    payment_type          STRING,
    payment_installments  INT,
    payment_value         DOUBLE
)
STORED AS PARQUET
LOCATION 's3://raw-ecommerce-lake-hassanessam/order_payments/';
