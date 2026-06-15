CREATE EXTERNAL TABLE IF NOT EXISTS products (
    product_id                   STRING,
    product_category_name        STRING,
    product_name_lenght          INT,
    product_description_lenght   INT,
    product_photos_qty           INT,
    product_weight_g             INT,
    product_length_cm            INT,
    product_height_cm            INT,
    product_width_cm             INT
)
STORED AS PARQUET
LOCATION 's3://raw-ecommerce-lake-hassanessam/products/';
