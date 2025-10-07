-- ==========================================================
-- SCRIPT: bronze/02_create_raw_tables.sql
-- PURPOSE: Create raw tables in bronze layer
-- AUTHOR: Igor
-- DATE: 2025-10-06
-- ==========================================================


-- =======================
-- TABLE: bronze.customers_raw
-- SOURCE: data/olist_customers_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.customers_raw(
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix INT,
    customer_city TEXT,
    customer_state TEXT,
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.geolocation_raw
-- SOURCE: data/olist_geolocation_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.geolocation_raw(
    geolocation_zip_code_prefix INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city TEXT,
    geolocation_state TEXT,
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.order_items_raw
-- SOURCE: data/olist_order_items_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.order_items_raw(
    order_id TEXT,
    order_item_id TEXT,
	product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TIMESTAMP,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.order_payments_raw
-- SOURCE: data/olist_order_payments_dataset.csv
-- =======================

CREATE TABLE IF NOT EXISTS bronze.order_payments_raw(
    order_id TEXT,
    payment_sequential INT,
    payment_type TEXT,
    payment_installments INT,
    payment_value NUMERIC(10,2),
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.order_reviews_raw
-- SOURCE: data/olist_order_reviews_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.order_reviews_raw(
    review_id TEXT,
    order_id TEXT,
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.orders_raw
-- SOURCE: data/olist_orders_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.orders_raw(
    order_id TEXT,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.products_raw
-- SOURCE: data/olist_products_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.products_raw(
    product_id TEXT,
    product_category_name TEXT,
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT,
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.sellers_raw
-- SOURCE: data/olist_sellers_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.sellers_raw(
    seller_id TEXT,
    seller_zip_code_prefix TEXT,
    seller_city TEXT,
    seller_state TEXT,
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.product_category_name_translation_raw
-- SOURCE: data/product_category_name_translation.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.product_category_name_translation_raw(
    product_category_name TEXT,
    product_category_name_english TEXT,
    ingested_at TIMESTAMPTZ DEFAULT now()
);
