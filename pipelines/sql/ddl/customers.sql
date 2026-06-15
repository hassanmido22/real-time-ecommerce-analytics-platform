CREATE EXTERNAL TABLE IF NOT EXISTS customers (
    customer_id             STRING,
    customer_unique_id      STRING,
    customer_zip_code_prefix int ,
    customer_city           STRING,
    customer_state          STRING
)
STORED AS PARQUET
LOCATION 's3://raw-ecommerce-lake-hassanessam/customers/';
