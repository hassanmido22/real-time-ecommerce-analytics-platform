CREATE EXTERNAL TABLE IF NOT EXISTS sellers (
    seller_id                STRING,
    seller_zip_code_prefix   INT,
    seller_city              STRING,
    seller_state             STRING
)
STORED AS PARQUET
LOCATION 's3://raw-ecommerce-lake-hassanessam/sellers/';