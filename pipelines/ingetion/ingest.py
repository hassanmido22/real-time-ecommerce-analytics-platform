# importing necessary libraries
import pandas as pd
import boto3
import io
import s3fs


# configure variables for AWS S3
session = boto3.Session(profile_name="ecommerce-dev")
s3 = session.client("s3")
bucket_name = 'raw-ecommerce-lake-hassanessam'
fs = s3fs.S3FileSystem(profile="ecommerce-dev")


# functions

# function to ingest files to S3
def ingest_without_partition(path, bucket_name, folder_name):
    df = pd.read_csv(path)
    # create a new directory for the parquet file customer folder inside the bucket 
    # Convert to parquet in memory
    if folder_name == "products":
        int_cols = [
            'product_name_lenght',
            'product_description_lenght',
            'product_photos_qty',
            'product_weight_g',
            'product_length_cm',
            'product_height_cm',
            'product_width_cm'
        ]
        for col in int_cols:
            df[col] = df[col].fillna(0).astype(int)
            
    buffer = io.BytesIO()
    df.to_parquet(buffer, index=False)
    buffer.seek(0)

    # Upload directly to S3
    s3.upload_fileobj(
        buffer,
        bucket_name,
        f"{folder_name}/{folder_name}.parquet"
    )
    print(f"Successfully uploaded {folder_name} — {len(df)} rows")


def ingest_with_partition(path, bucket_name, folder_name):

    df = pd.read_csv(path)
   
    # create month,day,hour columns for partitioning
    df['year'] = pd.to_datetime(df['order_purchase_timestamp']).dt.year       
    df['month'] = pd.to_datetime(df['order_purchase_timestamp']).dt.month       
    df['day'] = pd.to_datetime(df['order_purchase_timestamp']).dt.day
    # df['hour'] = pd.to_datetime(df['order_purchase_timestamp']).dt.hour
    s3_path = f"s3://{bucket_name}/{folder_name}"
    df.to_parquet(s3_path, index=False, partition_cols=["year", "month", "day"])
    print(f"Successfully uploaded {folder_name} — {len(df)} rows")

if __name__ == "__main__":
    files = [
        ("data/archive/olist_customers_dataset.csv", "customers"),
        ("data/archive/olist_geolocation_dataset.csv", "geolocation"),
        ("data/archive/olist_order_items_dataset.csv", "order_items"),
        ("data/archive/olist_order_payments_dataset.csv", "order_payments"),
        ("data/archive/olist_order_reviews_dataset.csv", "order_reviews"),
        ("data/archive/product_category_name_translation.csv", "product_category_name_translation"),
        ("data/archive/olist_products_dataset.csv", "products"),
        ("data/archive/olist_sellers_dataset.csv", "sellers"),
    ]
    for path, folder in files:
        ingest_without_partition(path, bucket_name, folder)

    ingest_with_partition("data/archive/olist_orders_dataset.csv", bucket_name, "orders")