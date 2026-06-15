CREATE EXTERNAL TABLE IF NOT EXISTS product_category_name_translation (
    product_category_name         STRING,
    product_category_name_english STRING
)
STORED AS PARQUET
LOCATION 's3://raw-ecommerce-lake-hassanessam/product_category_name_translation/';
