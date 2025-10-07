-- ==========================================================
-- SCRIPT: bronze/load_raw_data.sql
-- PURPOSE: Load raw data to tables in bronze layer
-- AUTHOR: Igor
-- DATE: 2025-10-06
-- ==========================================================

-- ================
-- STEP: Load raw data to customers table
-- TABLE: bronze.customers_raw
-- ================

-- 1. Delete all rows from customers
TRUNCATE TABLE bronze.customers_raw;

-- 2. Load raw data to customers
COPY bronze.customers_raw(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_customers_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- 3. Insert information about load to load_log table
INSERT INTO bronze.load_log(
	table_name,
	file_name,
	rows_loaded,
	load_start,
	load_end,
	status,
	notes
)
VALUES (
	'bronze.customers_raw',
	'olist_customers_dataset.csv',
	(SELECT COUNT(*) FROM bronze.customers_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);

-- ================
-- STEP: Load raw data to geolocation table
-- TABLE: bronze.geolocation_raw
-- ================

-- 1. Delete all rows from geolocation_raw table
TRUNCATE TABLE bronze.geolocation_raw;

-- 2. Load raw data to geolocation_raw table
COPY bronze.geolocation_raw(geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_geolocation_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- 3. Insert information about load to load_log table
INSERT INTO bronze.load_log(
	table_name,
	file_name,
	rows_loaded,
	load_start,
	load_end,
	status,
	notes
)
VALUES(
	'bronze.geolocation_raw',
	'olist_geolocation_dataset.csv',
	(SELECT COUNT(*) FROM bronze.geolocation_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);

-- ================
-- STEP: Load raw data to order_items
-- TABLE: bronze.order_items_raw
-- ================

-- 1. Delete rows from bronze.order_items_raw table
TRUNCATE TABLE bronze.order_items_raw;

-- 2. Load raw data to bronze.order_items_raw table
COPY bronze.order_items_raw(order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_order_items_dataset.csv' WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8');

-- 3. Insert information about load into load_log table
INSERT INTO bronze.load_log(
	table_name,
    file_name,
    rows_loaded,
    load_start,
    load_end,
    status,
    notes
)
VALUES(
	'bronze.order_items_raw',
	'olist_order_items_dataset.csv',
	(SELECT COUNT(*) FROM bronze.order_items_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);

-- ================
-- STEP: Load raw data to order_payments
-- TABLE: bronze.order_payments_raw
-- ================

-- 1. Delete rows from bronze.order_payments_raw table
TRUNCATE TABLE bronze.order_payments_raw;

-- 2. Load raw data to bronze.order_payments_raw table
COPY bronze.order_payments_raw(order_id, payment_sequential, payment_type, payment_installments, payment_value)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_order_payments_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- 3. Insert information about load into load_log table
INSERT INTO bronze.load_log(
	table_name,
    file_name,
    rows_loaded,
    load_start,
    load_end,
    status,
    notes
)
VALUES(
	'bronze.order_payments_raw',
	'olist_order_payments_dataset.csv',
	(SELECT COUNT(*) FROM bronze.order_payments_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);

-- ================
-- STEP: Load raw data to order_reviews
-- TABLE: bronze.order_reviews_raw
-- ================

-- 1. Delete rows from bronze.order_reviews_raw table
TRUNCATE TABLE bronze.order_reviews_raw;

-- 2. Load raw data to bronze.order_reviews_raw table
COPY bronze.order_reviews_raw(review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_order_reviews_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- 3. Insert information about load into load_log table
INSERT INTO bronze.load_log(
	table_name,
    file_name,
    rows_loaded,
    load_start,
    load_end,
    status,
    notes
)
VALUES(
	'bronze.order_reviews_raw',
	'olist_order_reviews_dataset.csv',
	(SELECT COUNT(*) FROM bronze.order_reviews_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);

-- ================
-- STEP: Load raw data to orders
-- TABLE: bronze.orders_raw
-- ================

-- 1. Delete rows from bronze.orders_raw table
TRUNCATE TABLE bronze.orders_raw;

-- 2. Load raw data to bronze.orders_raw table
COPY bronze.orders_raw(order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_orders_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- 3. Insert information about load into load_log table
INSERT INTO bronze.load_log(
	table_name,
	file_name,
	rows_loaded,
	load_start,
	load_end,
	status,
	notes
)
VALUES(
	'bronze.orders_raw',
	'olist_orders_dataset.csv',
	(SELECT COUNT(*) FROM bronze.orders_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);

-- ================
-- STEP: Load raw data to products
-- TABLE: bronze.products_raw
-- ================

-- 1. Delete rows from bronze.products_raw table
TRUNCATE TABLE bronze.products_raw;

-- 2. Load raw data to bronze.products_raw table
COPY bronze.products_raw(product_id, product_category_name, product_name_length, product_description_length, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_products_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- 3. Insert information about load into load_log table
INSERT INTO bronze.load_log(
	table_name,
	file_name,
	rows_loaded,
	load_start,
	load_end,
	status,
	notes
)
VALUES(
	'bronze.products_raw',
	'olist_products_dataset.csv',
	(SELECT COUNT(*) FROM bronze.products_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);

-- ================
-- STEP: Load raw data to sellers
-- TABLE: bronze.sellers_raw
-- ================

-- 1. Delete rows from bronze.sellers_raw table
TRUNCATE TABLE bronze.sellers_raw;

-- 2. Load raw data to bronze.sellers_raw table
COPY bronze.sellers_raw(seller_id, seller_zip_code_prefix, seller_city, seller_state)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/olist_sellers_dataset.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- 3. Insert information about load into load_log table
INSERT INTO bronze.load_log(
	table_name,
	file_name,
	rows_loaded,
	load_start,
	load_end,
	status,
	notes
)
VALUES(
	'bronze.sellers_raw',
	'olist_sellers_dataset.csv',
	(SELECT COUNT(*) FROM bronze.sellers_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);

-- ================
-- STEP: Load raw data to product category name translation
-- TABLE: bronze.product_category_name_translation_raw
-- ================

-- 1. Delete rows from bronze.product_category_name_translation_raw table
TRUNCATE TABLE bronze.product_category_name_translation_raw;

-- 2. Load raw data to bronze.product_category_name_translation_raw table
COPY bronze.product_category_name_translation_raw(product_category_name, product_category_name_english)
FROM '/Users/igorsarnowski/e_commerce_analysis_sql/data/product_category_name_translation.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- 3. Insert information about load into load_log table
INSERT INTO bronze.load_log(
	table_name,
	file_name,
	rows_loaded,
	load_start,
	load_end,
	status,
	notes
)
VALUES(
	'bronze.product_category_name_translation_raw',
	'product_category_name_translation.csv',
	(SELECT COUNT(*) FROM bronze.product_category_name_translation_raw),
	now(),
	now(),
	'SUCCESS',
	NULL
);