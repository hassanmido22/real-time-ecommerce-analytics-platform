CREATE EXTERNAL TABLE IF NOT EXISTS geolocation (
    geolocation_zip_code_prefix int,
    geolocation_lat             DOUBLE,
    geolocation_lng             DOUBLE,
    geolocation_city            STRING,
    geolocation_state           STRING
)
STORED AS PARQUET
LOCATION 's3://raw-ecommerce-lake-hassanessam/geolocation/';
