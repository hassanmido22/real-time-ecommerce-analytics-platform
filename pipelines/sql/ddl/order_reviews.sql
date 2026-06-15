







CREATE EXTERNAL TABLE IF NOT EXISTS order_reviews (
    review_id                STRING,
    order_id                 STRING,
    review_score             INT,
    review_comment_title     STRING,
    review_comment_message   STRING,
    review_creation_date     STRING,
    review_answer_timestamp  STRING
)
STORED AS PARQUET
LOCATION 's3://raw-ecommerce-lake-hassanessam/order_reviews/';
