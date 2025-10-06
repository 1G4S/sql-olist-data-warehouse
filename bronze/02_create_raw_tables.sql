-- ====================================================
-- STEP: Creating tables with raw data in bronze layer 
-- ====================================================

-- =======================
-- TABLE: bronze.customers
-- SOURCE: data/olist_customers_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.customers(
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix INT,
    customer_city TEXT,
    customer_state TEXT
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.geolocation
-- SOURCE: data/olist_geolocation_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.geolocation(
    geolocation_zip_code_prefix INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city TEXT,
    geolocation_state TEXT,
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.order_items
-- SOURCE: data/olist_order_items_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.order_items(
    order_id TEXT,
    order_item_id TEXT,
    seller_id TEXT,
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.order_payments
-- SOURCE: data/olist_order_payments_dataset.csv
-- =======================

CREATE TABLE IF NOT EXISTS bronze.order_payments(
    order_id TEXT,
    payment_sequential INT,
    payment_type TEXT,
    payment_installments INT,
    payment_value NUMERIC(10,2),
    ingested_at TIMESTAMPTZ DEFAULT now()
);

-- =======================
-- TABLE: bronze.order_reviews
-- SOURCE: data/olist_order_reviews_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.order_reviews(
    review_id TEXT,
    order_id TEXT,
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME,
    ingested_at TIMESTAMPTZ DEFAULT now()
)

-- =======================
-- TABLE: bronze.orders
-- SOURCE: data/olist_orders_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.orders(
    order_id TEXT,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_career_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    ingested_at TIMESTAMPTZ DEFAULT now()
)

-- =======================
-- TABLE: bronze.products
-- SOURCE: data/olist_products_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.products(
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
)

-- =======================
-- TABLE: bronze.sellers
-- SOURCE: data/olist_sellers_dataset.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.sellers(
    seller_id TEXT,
    seller_zip_code_prefix TEXT,
    seller_city TEXT,
    seller_state TEXT,
    ingested_at TIMESTAMPTZ DEFAULT now()
)

-- =======================
-- TABLE: bronze.product_category_name_translation
-- SOURCE: data/product_category_name_translation.csv
-- =======================
CREATE TABLE IF NOT EXISTS bronze.product_category_name_translation(
    product_category_name TEXT,
    product_category_name_english TEXT,
    ingested_at TIMESTAMPTZ DEFAULT now()
)
